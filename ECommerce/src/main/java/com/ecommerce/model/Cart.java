package com.ecommerce.model;

import java.util.HashMap;
import java.util.Map;

public class Cart {
    private Map<Integer, Product> products = new HashMap<>();
    private double total;

    public void addProduct(Product product) {
        if (products.containsKey(product.getId())) {
            Product existingProduct = products.get(product.getId());
            existingProduct.setQuantity(existingProduct.getQuantity() + 1);
        } else {
            products.put(product.getId(), product);
        }
        recalculateTotal();
    }

    public void removeProduct(int productId) {
        products.remove(productId);
        recalculateTotal();
    }

    public void updateProductQuantity(int productId, int quantity) {
        if (products.containsKey(productId)) {
            Product product = products.get(productId);
            product.setQuantity(quantity);
        }
        recalculateTotal();
    }

    public void updateProductSize(int productId, String size) {
        if (products.containsKey(productId)) {
            Product product = products.get(productId);
            product.setSize(size);
        }
    }

    public void recalculateTotal() {
        total = products.values().stream().mapToDouble(p -> p.getPrice() * p.getQuantity()).sum();
    }

    public Map<Integer, Product> getProducts() {
        return products;
    }

    public double getTotal() {
        return total;
    }
}
