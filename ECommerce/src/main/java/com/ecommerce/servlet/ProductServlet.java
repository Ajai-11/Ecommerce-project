package com.ecommerce.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.ecommerce.dao.ProductDao;
import com.ecommerce.model.Product;

@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDao productDao = new ProductDao();
        List<Product> popularProducts = productDao.getLast4Products();
        List<Product>  first8Products = productDao.getFirst8Products();
      
        request.setAttribute("popularProducts", popularProducts);
        request.setAttribute("first8Products", first8Products);
        
        // Forwarding to the main JSP page (index.jsp)
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
