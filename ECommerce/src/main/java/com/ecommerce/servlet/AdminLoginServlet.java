package com.ecommerce.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/adminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        
        String adminUsername = "admin";
        String adminPassword = "admin123";

        
        if (adminUsername.equals(username) && adminPassword.equals(password)) {
           
            HttpSession session = request.getSession();
            session.setAttribute("user", "admin");
            response.sendRedirect("admin.jsp"); 
        } else {
            response.sendRedirect("adminLogin.jsp?error=invalid");
        }
    }
}
