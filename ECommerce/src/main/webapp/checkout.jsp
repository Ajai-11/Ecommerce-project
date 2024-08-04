<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.ecommerce.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ecommerce.servlet.CheckoutServlet" %>

<%
     session = request.getSession();
    List<Product> cart = (List<Product>) session.getAttribute("cart");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout</title>
    <link rel="stylesheet" href="checkout.css">
</head>
<body>
    <header>
        <nav>
            <jsp:include page="navbar.jsp" />
        </nav>
    </header>

    <main>
        <section class="checkout">
            <h1>Checkout</h1>
            <hr>
            <%
                if (cart != null && !cart.isEmpty()) {
            %>
            <table>
                <thead>
                    <tr>
                        <th>Product Name</th>
                        <th>Image</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Size</th>
                        <th>Total Price</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        double totalPrice = 0;
                        for (Product product : cart) {
                            totalPrice += product.getPrice() * product.getQuantity();
                    %>
                    <tr>
                        <td><%= product.getName() %></td>
                        <td><img src="<%= product.getImage() %>" alt="<%= product.getName() %>" /></td>
                        <td>$<%= product.getPrice() %></td>
                        <td><%= product.getQuantity() %></td>
                        <td><%= product.getSize() %></td>
                        <td>$<%= product.getPrice() * product.getQuantity() %></td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <div class="checkout-summary">
                <h2>Total Price: $<%= totalPrice %></h2>
            </div>
            <hr>
            <form action="CheckoutServlet" method="post" class="checkout-form">
                <h2>Shipping Details</h2>
              
                <input type="text" id="name" name="name" placeholder="Full Name" required>
                <input type="text" id="city" name="city" placeholder="City" required>
                <input type="text" id="state" name="state" placeholder="State" required>
                <input type="text" id="zip" name="zip"placeholder="ZIP Code" required>
                <input type="text" id="country" name="country"placeholder="Country" required>
                <input type="email" id="email" name="email"placeholder="Email" required>
                <input type="tel" id="phone" name="phone"placeholder="Phone" required>
                
                <button type="submit" class="checkout-button">Place Order</button>
            </form>
            <%
                } else {
            %>
            <p>Your cart is empty.</p>
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
