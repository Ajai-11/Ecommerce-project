<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.ecommerce.model.Product" %>
<%@ page import="com.ecommerce.dao.ProductDao" %>
<%@ page import="com.ecommerce.servlet.CartServlet" %>

<%
    int productId = Integer.parseInt(request.getParameter("id"));
    ProductDao productDao = new ProductDao();
    Product product = productDao.getProductById(productId);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= product != null ? product.getName() : "Product Detail" %></title>
    <link rel="stylesheet" href="productDetail.css">
</head>
<body>
    <header>
        <nav>
            <jsp:include page="navbar.jsp" />
        </nav>
    </header>

    <main>
        <section class="product-detail">
            <%
                if (product != null) {
            %>
            <div class="product-detail-left">
                <div class="product-detail-img-list">
                    <img src="<%= product.getImage() %>" alt="<%= product.getName() %>" />
                    <img src="<%= product.getImage() %>" alt="<%= product.getName() %>" />
                    <img src="<%= product.getImage() %>" alt="<%= product.getName() %>" />
                    <img src="<%= product.getImage() %>" alt="<%= product.getName() %>" />
                </div>
                <div class="product-detail-img">
                    <img class='product-detail-main-img' src="<%= product.getImage() %>" alt="<%= product.getName() %>" />
                </div>
            </div>
            <div class="product-detail-right">
                <h1><%= product.getName() %></h1>
                <div class="product-detail-price">
                    $<%= product.getPrice() %>
                </div>
                <div class="product-detail-description">
                    <%= product.getDescription() %>
                </div>
                <div class="product-detail-size">
                    <h1>Available Sizes</h1>
                    <div class="product-detail-sizes">
                        <p>S</p>
                        <p>M</p>
                        <p>L</p>
                        <p>XL</p>
                        <p>XXL</p>
                    </div>
                    <div><p>Reviews</p></div>
                     <div class="product-detail-stars">
                     
                   
                    <img src="star_icon.png" alt="Star Icon" />
                    <img src="star_icon.png" alt="Star Icon" />
                    <img src="star_icon.png" alt="Star Icon" />
                    <img src="star_icon.png" alt="Star Icon" />
                    <img src="star_dull_icon.png" alt="Star Dull Icon" />
                    <p>(122)</p>
                  	 
                </div>
                    
                </div>
               <form action="CartServlet" method="post">
    <input type="hidden" name="action" value="add">
    <input type="hidden" name="productId" value="<%= product.getId() %>">
    <input type="hidden" name="productName" value="<%= product.getName() %>">
    <input type="hidden" name="productImage" value="<%= product.getImage() %>">
    <input type="hidden" name="productPrice" value="<%= product.getPrice() %>">
    <label for="quantity">Quantity:</label>
    <input type="number" name="quantity" id="quantity" value="1" min="1">
    <label for="size">Size:</label>
    <select name="size" id="size">
        <option value="S">S</option>
        <option value="M">M</option>
        <option value="L">L</option>
        <option value="XL">XL</option>
        <option value="XXL">XXL</option>
    </select>
    <button type="submit" class="cartitems-remove-icon">Add To Cart</button>
</form>

            </div>
            <%
                } else {
            %>
            <p>Product not found.</p>
            <%
                }
            %>
        </section>
    </main>

    <footer>
        <p>&copy; 2024 E-Commerce. All rights reserved.</p>
    </footer>
</body>
</html>
