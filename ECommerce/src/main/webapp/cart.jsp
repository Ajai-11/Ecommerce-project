<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.ecommerce.model.Product" %>
<%@ page import="java.util.List" %>

<%
     session = request.getSession();
    List<Product> cart = (List<Product>) session.getAttribute("cart");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
    <link rel="stylesheet" href="cart.css">
    <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
</head>
<body>
    <header>
        <nav>
            <jsp:include page="navbar.jsp" />
        </nav>
    </header>

    <main>
        <section class="cartitems">
            <h1>Shopping Cart</h1>
            <hr>
            <%
                if (cart != null && !cart.isEmpty()) {
            %>
            <table>
                <thead>
                    <tr>
                        <th>Product Image</th>
                        <th>Product Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Size</th>
                        <th>Total Price</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        double totalPrice = 0;
                        int totalQuantity = 0;
                        for (Product product : cart) {
                            totalPrice += product.getPrice() * product.getQuantity();
                            totalQuantity += product.getQuantity();
                    %>
                    <tr>
                        <td><img src="<%= product.getImage() %>" alt="<%= product.getName() %>" /></td>
                        <td><%= product.getName() %></td>
                        <td>$<%= product.getPrice() %></td>
                        <td>
                            <form action="CartServlet" method="post" class="update-form">
                                <input type="hidden" name="action" value="update">
                                <input type="hidden" name="productId" value="<%= product.getId() %>">
                                <input type="hidden" name="size" value="<%= product.getSize() %>">
                                <input type="number" name="quantity" value="<%= product.getQuantity() %>" min="1" class="quantity-input">
                                <button type="submit" class="update-button"><box-icon name='edit-alt' type='solid' color='#ffffff' ></box-icon></button>
                            </form>
                        </td>
                        <td><%= product.getSize() %></td>
                        <td>$<%= product.getPrice() * product.getQuantity() %></td>
                        <td>
                            <form action="CartServlet" method="post">
                                <input type="hidden" name="action" value="remove">
                                <input type="hidden" name="productId" value="<%= product.getId() %>">
                                <input type="hidden" name="size" value="<%= product.getSize() %>">
                                <button type="submit" class="cartitems-remove-icon">Remove</button>
                            </form>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <div class="cartitems-summary">
                <div class="cartitems-total">
                    <h2>Cart Summary</h2>
                    <p>Total Quantity: <%= totalQuantity %></p>
                    <p>Total Price: $<%= totalPrice %></p>
                </div>
                <div class="cartitems-checkout">
<form action="CartServlet" method="post">
                    <input type="hidden" name="action" value="checkout">
                    <button type="submit">Proceed to Checkout</button>
                </form>
</div>

            </div>
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
