<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="com.ecommerce.dao.ProductDao" %>
<%@ page import="com.ecommerce.model.Product" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Product</title>
    <link rel="stylesheet" href="admin.css">
    <script>
        function showMessage(message) {
            if (message) {
                alert(message);
            }
        }

        function checkMessage() {
            var message = '<%= session.getAttribute("message") != null ? session.getAttribute("message") : "" %>';
            if (message) {
                showMessage(message);
                <% session.removeAttribute("message"); %>
            }
        }
    </script>
</head>
<body onload="checkMessage()">
<%@ include file="nav.jsp" %>
    <div class="add-product">
     <div class="admin-main">
            <%@ include file="SideBar.jsp" %>  
        </div>
        <form action="AddProductServlet" method="post" enctype="multipart/form-data">
            <div class="addproduct-itemfield">
                <p>Product Name</p>
                <input type="text" name="name" placeholder="Type here">
            </div>
            <div class="addproduct-price">
                <div class="addproduct-itemfield">
                    <p>Price</p>
                    <input type="text" name="price" placeholder="Type here">
                </div>
            </div>
            <div class="addproduct-itemfield">
                <p>Product Category</p>
                <select name="category" class="add-product-selector">
                    <option value="Women">Women</option>
                    <option value="Men">Men</option>
                    <option value="Kid">Kid</option>
                </select>
            </div>
            <div class="addproduct-itemfield">
                <p>Product Description</p>
                <input type="text" name="desc" placeholder="Type here">
            </div>
            <div class="addproduct-itemfield">
                <label for="file-input">
                    <img src="upload_area.svg" class="addproduct-thumbnail-img" alt="">
                </label>
                <input type="file" name="image" id="file-input" hidden>
            </div>
            <button type="submit" class="addproduct-btn">ADD</button>
        </form>
    </div>
</body>
</html>
