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
        <section class="confirmation-message">
            <h1>Thank You for Your Order!</h1>
            <p>Your order has been placed successfully. You will receive an email confirmation shortly.</p>
            <a href="index.jsp">Return to Home</a>
        </section>
    </main>

    <footer>
        <p>&copy; 2024 E-Commerce. All rights reserved.</p>
    </footer>
</body>
</html>
