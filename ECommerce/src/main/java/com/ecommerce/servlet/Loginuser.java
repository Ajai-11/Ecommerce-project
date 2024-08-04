package com.ecommerce.servlet;

import com.ecommerce.dao.UserDao;
import com.ecommerce.model.Product;
import com.ecommerce.model.User;
import com.ecommerce.dao.Database;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/Loginuser")
public class Loginuser extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");

        UserDao userDao = new UserDao();
        User user = userDao.validateUser(email, pass);

        if (user != null) {
            // Set user in session
            request.getSession().setAttribute("user", user);
            System.out.println("User logged in successfully: " + user.getEmail());

            // Load cart items from the database
            List<Product> cart = loadUserCart(user.getId());
            request.getSession().setAttribute("cart", cart);

            // Print cart details to verify
            if (cart != null) {
                System.out.println("Cart loaded for user ID: " + user.getId());
                for (Product product : cart) {
                    System.out.println("Product ID: " + product.getId() + 
                                       ", Name: " + product.getName() + 
                                       ", Quantity: " + product.getQuantity() + 
                                       ", Size: " + product.getSize());
                }
            } else {
                System.out.println("Cart is empty for user ID: " + user.getId());
            }

            response.sendRedirect("product.jsp");
        } else {
            System.out.println("Invalid login attempt with email: " + email);
            response.sendRedirect("login.html");
        }
    }

    private List<Product> loadUserCart(int userId) {
        List<Product> cart = new ArrayList<>();
        String sql = "SELECT p.id, p.name, p.price, p.image, ci.quantity AS ci_quantity, ci.size AS ci_size " +
                     "FROM cart_items ci " +
                     "JOIN products p ON ci.product_id = p.id WHERE ci.user_id = ?";
        try (Connection conn = Database.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    // Create a new product object and set its properties
                    Product product = new Product();
                    product.setId(rs.getInt("id"));
                    product.setName(rs.getString("name"));
                    product.setPrice(rs.getDouble("price"));
                    product.setImage(rs.getString("image"));
                    product.setQuantity(rs.getInt("ci_quantity"));  // Set the quantity from the cart_items table
                    product.setSize(rs.getString("ci_size"));  // Set the size from the cart_items table

                    // Add the product to the cart list
                    cart.add(product);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cart;
    }

      
}
