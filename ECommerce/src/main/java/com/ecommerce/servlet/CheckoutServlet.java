package com.ecommerce.servlet;

import com.ecommerce.dao.Database;
import com.ecommerce.model.Product;
import com.ecommerce.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<Product> cart = (List<Product>) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {
            response.sendRedirect("cart.jsp");
            return;
        }

        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String zip = request.getParameter("zip");
        String country = request.getParameter("country");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        double totalPrice = 0;
        for (Product product : cart) {
            totalPrice += product.getPrice() * product.getQuantity();
        }

        try (Connection conn = Database.getConnection()) {
            conn.setAutoCommit(false);

            // Insert into Orders table
            String insertOrderSQL = "INSERT INTO Orders (name, address, city, state, zip, country, email, phone, total_price) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement psOrder = conn.prepareStatement(insertOrderSQL, PreparedStatement.RETURN_GENERATED_KEYS)) {
                psOrder.setString(1, name);
                psOrder.setString(2, address);
                psOrder.setString(3, city);
                psOrder.setString(4, state);
                psOrder.setString(5, zip);
                psOrder.setString(6, country);
                psOrder.setString(7, email);
                psOrder.setString(8, phone);
                psOrder.setDouble(9, totalPrice);
                psOrder.executeUpdate();

                // Get the generated order ID
                int orderId = -1;
                try (var rs = psOrder.getGeneratedKeys()) {
                    if (rs.next()) {
                        orderId = rs.getInt(1);
                    }
                }

                // Insert into OrderItems table
                String insertOrderItemSQL = "INSERT INTO OrderItems (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";
                try (PreparedStatement psOrderItem = conn.prepareStatement(insertOrderItemSQL)) {
                    for (Product product : cart) {
                        psOrderItem.setInt(1, orderId);
                        psOrderItem.setInt(2, product.getId());
                        psOrderItem.setInt(3, product.getQuantity());
                        psOrderItem.setDouble(4, product.getPrice());
                        psOrderItem.addBatch();
                    }
                    psOrderItem.executeBatch();
                }

                // Clear cart items from the database
                String clearCartItemsSQL = "DELETE FROM cart_items WHERE user_id = ?";
                try (PreparedStatement psClearCart = conn.prepareStatement(clearCartItemsSQL)) {
                    User user = (User) session.getAttribute("user");
                    if (user != null) {
                        psClearCart.setInt(1, user.getId());
                        psClearCart.executeUpdate();
                    }
                }

                conn.commit();
            } catch (SQLException e) {
                conn.rollback();
                throw e;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
            return;
        }

        // Clear the cart after checkout
        session.removeAttribute("cart");

        // Redirect to a confirmation page or display a confirmation message
        response.sendRedirect("confirmation.jsp");
    }
}
