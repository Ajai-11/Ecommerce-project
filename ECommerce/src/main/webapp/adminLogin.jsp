<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ecommerce.servlet.AdminLoginServlet"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <link rel="stylesheet" href="login.css">
</head>
<body>
    <div class="login-container">
        <h2>Admin Login</h2>
        <form action="adminLoginServlet" method="post">
            <input type="text" id="username" name="username" placeholder="Enter UserName"required>
            <input type="password" id="password" name="password" placeholder="Enter PassWord"required>

            <button type="submit">Login</button>
        </form>
    </div>
</body>
</html>
