package com.ecommerce.servlet;

import com.ecommerce.model.Product;
import com.ecommerce.model.User;
import com.ecommerce.dao.Database;

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
import java.util.ArrayList;
import java.util.List;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String action = request.getParameter("action");

        // Get userId from session
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.html");
            return;
        }

        int userId = user.getId();
        List<Product> cart = (List<Product>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
        }

        if ("add".equals(action)) {
            int productId = Integer.parseInt(request.getParameter("productId"));
            String productName = request.getParameter("productName");
            String productImage = request.getParameter("productImage");
            double productPrice = Double.parseDouble(request.getParameter("productPrice"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String size = request.getParameter("size");

            boolean found = false;
            for (Product product : cart) {
                if (product.getId() == productId && product.getSize().equals(size)) {
                    product.setQuantity(product.getQuantity() + quantity);
                    updateCartItemInDB(userId, productId, product.getQuantity(), size); // Update DB
                    found = true;
                    break;
                }
            }

            if (!found) {
                Product product = new Product(productId, productName, productImage, productPrice, quantity, size);
                cart.add(product);
                saveCartItemInDB(userId, productId, quantity, size); // Save to DB
            }

            session.setAttribute("cart", cart);
            response.sendRedirect("cart.jsp");

        } else if ("remove".equals(action)) {
            int productId = Integer.parseInt(request.getParameter("productId"));
            String size = request.getParameter("size");
            cart.removeIf(product -> product.getId() == productId && product.getSize().equals(size));
            removeCartItemFromDB(userId, productId, size); // Remove from DB
            session.setAttribute("cart", cart);
            response.sendRedirect("cart.jsp");

        } else if ("update".equals(action)) {
            int productId = Integer.parseInt(request.getParameter("productId"));
            String size = request.getParameter("size");
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            for (Product product : cart) {
                if (product.getId() == productId && product.getSize().equals(size)) {
                    product.setQuantity(quantity);
                    updateCartItemInDB(userId, productId, quantity, size); // Update DB
                    break;
                }
            }

            session.setAttribute("cart", cart);
            response.sendRedirect("cart.jsp");

        } 
        else if ("checkout".equals(action)) {
            session.setAttribute("cart", cart);
            response.sendRedirect("checkout.jsp");
        }
        else {
            response.sendRedirect("cart.jsp");
        }
    }

    private void saveCartItemInDB(int userId, int productId, int quantity, String size) {
        String sql = "INSERT INTO cart_items (user_id, product_id, quantity, size) VALUES (?, ?, ?, ?)";
        try (Connection conn = Database.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            stmt.setInt(2, productId);
            stmt.setInt(3, quantity);
            stmt.setString(4, size);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void updateCartItemInDB(int userId, int productId, int quantity, String size) {
        String sql = "UPDATE cart_items SET quantity = ? WHERE user_id = ? AND product_id = ? AND size = ?";
        try (Connection conn = Database.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, quantity);
            stmt.setInt(2, userId);
            stmt.setInt(3, productId);
            stmt.setString(4, size);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void removeCartItemFromDB(int userId, int productId, String size) {
        String sql = "DELETE FROM cart_items WHERE user_id = ? AND product_id = ? AND size = ?";
        try (Connection conn = Database.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            stmt.setInt(2, productId);
            stmt.setString(3, size);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
