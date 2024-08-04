package com.ecommerce.servlet;

import com.ecommerce.dao.UserDao;
import com.ecommerce.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Registeruser")
public class Registeruser extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");

        User user = new User(0, name, email, pass);
        UserDao userDao = new UserDao();
        userDao.storeUser(user);
        response.sendRedirect("login.html");
    }
}
