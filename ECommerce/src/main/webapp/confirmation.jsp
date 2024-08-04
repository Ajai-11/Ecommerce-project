<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation</title>
    <link rel="stylesheet" href="confirmation.css">
</head>
<body>
    <header>
        <nav>
            <jsp:include page="navbar.jsp" />
        </nav>
    </header>

    <main>
        <section class="confirmation">
            <h1>Order Confirmation</h1>
            <p>Thank you for your order! Your order has been placed successfully.</p>
            <p>You will receive an email confirmation shortly.</p>
            <p><a href="index.jsp">Continue Shopping</a></p>
        </section>
    </main>

    <footer>
        <p>&copy; 2024 E-Commerce. All rights reserved.</p>
    </footer>
</body>
</html>
