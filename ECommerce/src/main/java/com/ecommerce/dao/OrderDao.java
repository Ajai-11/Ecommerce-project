package com.ecommerce.dao;

import com.ecommerce.model.Order;
import com.ecommerce.model.OrderItem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class OrderDao {

    private Connection connection;

    public OrderDao() {
        connection = Database.getConnection();
    }

    public void saveOrder(Order order) {
        String orderSql = "INSERT INTO orders (customer_name, customer_email, shipping_address, phone) VALUES (?, ?, ?, ?)";
        String orderItemSql = "INSERT INTO order_items (order_id, product_id, quantity) VALUES (?, ?, ?)";

        try {
            connection.setAutoCommit(false);

            // Save order
            try (PreparedStatement orderStmt = connection.prepareStatement(orderSql, PreparedStatement.RETURN_GENERATED_KEYS)) {
                orderStmt.setString(1, order.getCustomerName());
                orderStmt.setString(2, order.getCustomerEmail());
                orderStmt.setString(3, order.getShippingAddress());
                orderStmt.setString(4, order.getPhone());
                orderStmt.executeUpdate();

                try (var generatedKeys = orderStmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        long orderId = generatedKeys.getLong(1);

                        // Save order items
                        try (PreparedStatement orderItemStmt = connection.prepareStatement(orderItemSql)) {
                            for (OrderItem item : order.getOrderItems()) {
                                orderItemStmt.setLong(1, orderId);
                                orderItemStmt.setInt(2, item.getProduct().getId());
                                orderItemStmt.setInt(3, item.getQuantity());
                                orderItemStmt.addBatch();
                            }
                            orderItemStmt.executeBatch();
                        }
                    }
                }
            }

            connection.commit();
        } catch (SQLException e) {
            try {
                connection.rollback();
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
 