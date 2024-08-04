<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="com.ecommerce.dao.ProductDao" %>
<%@ page import="com.ecommerce.model.Product" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Product List</title>
    <link rel="stylesheet" href="admin.css">
    <script>
        function showMessage(message) {
            if (message) {
                alert(message);
            }
        }

        function checkMessage() {
            var message = '<%= session.getAttribute("message") != null ? session.getAttribute("message") : "" %>';
            if (message) {
                showMessage(message);
                <% session.removeAttribute("message"); %>
            }
        }
    </script>
</head>
<body onload="checkMessage()">
<%@ include file="nav.jsp" %>
    <div class="list-product">
    <div class="admin-main">
            <%@ include file="SideBar.jsp" %>  
        </div>
        <h1>All Product List</h1>
        <div class="listproducts-format-main">
            <p>Products</p>
            <p>Title</p>
            <p>Price</p>
            <p>Description</p>
            <p>Category</p>
            <p>Remove</p>
        </div>
        <div class="listproduct-allproducts">
            <hr />
            <%
                ProductDao productDao = new ProductDao();
                List<Product> allProducts = productDao.getAllProducts();
                for (Product product : allProducts) {
            %>
            <div class="listproduct-format-main listproduct-format">
                <img src="<%= product.getImage() %>" alt="" class="listproduct-product-icon">
                <p><%= product.getName() %></p>
                <p>$<%= product.getPrice() %></p>
                <p class="description"><%= product.getDescription() %></p>
                <p><%= product.getCategory() %></p>
                <a href="deleteproduct?id=<%= product.getId() %>" class="listproduct-remove-icon">Remove</a>
            </div>
            <hr />
            <% } %>
        </div>
    </div>
</body>
</html>
