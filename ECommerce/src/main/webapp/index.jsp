<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="com.ecommerce.servlet.ProductServlet" %>
<%@ page import="com.ecommerce.dao.ProductDao" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ecommerce.model.Product" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Commerce Website</title>
    <link rel="stylesheet" href="style.css">
    
</head>
<body>
    <header>
        <nav>
             <jsp:include page="navbar.jsp" />
        </nav>
    </header>
    
    <main>
        <!-- Hero Section -->

<section class="hero">
    <div class="hero-left">
        <h2>DISCOVER THE LATEST TRENDS</h2>
        <p>Fresh Collections Just for You</p>
        <p>Style Redefined</p>
        <div class="hero-explore-btn">
             <a href="#popular-items" class="herobtn">Explore More</a>
        </div>
    </div>
    <div class="hero-right">
        	
    </div>
</section>

             <!-- Popular Items Section -->
        <section id="popular-items" class="popular-items">
            <h2>Popular Items</h2>
            <div class="products">
                <%
                    ProductDao productDao = new ProductDao();
                    List<Product> productList = productDao.getLast4Products();
                    for (Product product : productList) {
                %>
                <div class="product">
                    <img src="<%= product.getImage() %>" alt="<%= product.getName() %>">
                    <h3><%= product.getName() %></h3>
                    <p class="price">$<%= product.getPrice() %></p>
                    <p class="category"><%= product.getCategory() %></p>
                    <a href="product-detail?id=<%= product.getId() %>" class="btn">View Details</a>
                </div>
                <%
                    }
                %>
            </div>
        </section>


      <!-- Enhanced Discount Section -->
<section class="discount-section">
    <div class="discount-content">
      <h2>Summer Sale Extravaganza!</h2>
      <p>Don’t miss out on our biggest sale of the year. Shop the trendiest styles with up to 70% off!</p>
      <p class="limited-time">Limited time offer, while stocks last!</p>
      <a href="product.jsp" class="btn-discount">Grab Your Deal</a>
    </div>
</section>


        <!-- All Products Section --> 
          <section class="all-products">    
             <div class="products">
             <%
              List<Product> first8Products = productDao.getFirst8Products();
              for (Product product : first8Products) {
             %>
             <div class="product">
             <img src="<%= product.getImage() %>" alt="<%= product.getName() %>">
             <h3><%= product.getName() %></h3>
             <p class="price">$<%= product.getPrice() %></p>
             <p class="category"><%= product.getCategory() %></p>
            <a href="productDetail.jsp?id=<%= product.getId() %>" class="btn">View Details</a>
            </div>
            <% } %>
           </div>
          <div class="view-more">
          <a href="product.jsp" class="btn">View More</a>
          </div>
        </section>

        <!-- Contact Section -->
        <section id="contact" class="contact">
            <h2>Contact Us</h2>
            <p>Email: info@ecommerce.com</p>
            <p>Phone: 123-456-7890</p>
        </section>
    </main>

    <footer>
        <p>&copy; 2024 E-Commerce. All rights reserved.</p>
    </footer>
</body>
</html>
