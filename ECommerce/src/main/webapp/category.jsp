<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="com.ecommerce.dao.ProductDao" %>
<%@ page import="com.ecommerce.model.Product" %>
<%@ page import="java.util.List" %>

<%
    String category = request.getParameter("category");
    ProductDao productDao = new ProductDao();
    List<Product> categoryProducts = productDao.getProductsByCategory(category);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= category %> Products</title>
    
</head>
<body>
    <header>
        <nav>
            <jsp:include page="navbar.jsp" />
        </nav>
    </header>
    
    <main>
        <section class="category-banner">
            <h2>Welcome to <%= category %> Section</h2>
            <p>Discover the best products for <%= category %></p>
        </section>
        <div class="products">
            <%
                for (Product product : categoryProducts) {
            %>
            <div class="product">
                <img src="<%= product.getImage() %>" alt="<%= product.getName() %>">
                <h3><%= product.getName() %></h3>
                <p class="price">$<%= product.getPrice() %></p>
                <a href="product-detail?id=<%= product.getId() %>" class="btn">View Details</a>
            </div>
            <%
                }
            %>
        </div>
    </main>

    <footer>
        <p>&copy; 2024 E-Commerce. All rights reserved.</p>
    </footer>
</body>
</html>
