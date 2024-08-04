<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ecommerce.dao.ProductDao" %>
<%@ page import="com.ecommerce.model.Product" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header>
        <nav>
           <jsp:include page="navbar.jsp" />
        </nav>
    </header>

    <main>
        <section class="all-products">
            <h2>All Products</h2>
            <div class="products">
                <%
                    ProductDao productDao = new ProductDao();
                    List<Product> productList = productDao.getAllProducts();
                    for (Product product : productList) {
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
        </section>
    </main>

    <footer>
        <p>&copy; 2024 E-Commerce. All rights reserved.</p>
    </footer>
</body>
</html>
