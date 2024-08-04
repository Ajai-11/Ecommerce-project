<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<head>
    
    <link rel="stylesheet" href="style.css">
    <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
</head>
<style>

header {
    background-color: #A1A1A1;
    color: #fff;
    padding: 1rem 0;
}

.navbar {
	
    display: flex;
    justify-content: space-between;
    align-items: center;
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 1rem;
    height:20px;
}
.logo {
    margin-left:-100px;
    display: flex;
    align-items: center;
}

.navbar .logo a {
    color: #fff;
    font-size: 1.5rem;
    text-decoration: none;
    font-weight: bold;
}
.logo img {
    max-width: 50px; 
    height: auto; 
    margin-right: 10px; 
    border-radius:50%;
}

/* Style the navbar */
.navbar ul {
    list-style-type: none;
    margin-right: -50px;
    padding: 0;
    overflow: hidden;
    }

.navbar ul li {
    float: left;
}

.navbar ul li a {
    display: block;
    color: white;
    font-size: 1.2rem;
    font-weight: 500px;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

.navbar ul li a:hover, .dropdown:hover .dropbtn {
    color: black;
   
}

/* Dropdown container */
.dropdown {
    float: left;
    overflow: hidden;
}

/* Dropdown button */
.dropdown .dropbtn {
    font-size: 16px;
    border: none;
    outline: none;
    color: white;
    padding: 14px 16px;
    background-color: inherit;
    font-family: inherit;
    margin: 0;
}

/* Dropdown content (hidden by default) */
.dropdown-content {
    display: none;
    position: absolute;
    background-color: #A1A1A1;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

/* Links inside the dropdown */
.dropdown-content a {
    float: none;
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    text-align: left;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {
    background-color: #ddd;
}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {
    display: block;
}

</style>

<header>
    <nav>
        <div class="navbar">
            <div class="logo">
                <img src="e_logo.png" alt="Shoppify Logo">
                <a href="index.jsp">Shoppify</a>
            </div>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="category.jsp?category=Men">Men</a></li>
                <li><a href="category.jsp?category=Women">Women</a></li>
                <li><a href="category.jsp?category=Kid">Kids</a></li>
                <c:choose>
                    <c:when test="${not empty sessionScope.user}">
                        <li><a href="logout">Logout</a></li>
                    </c:when>
                    <c:otherwise>
                        <!-- Dropdown for Admin and User Login -->
                        <li class="dropdown">
                            <a href="#" class="dropbtn">Login</a>
                            <div class="dropdown-content">
                                <a href="adminLogin.jsp">Admin Login</a>
                                <a href="login.html">User Login</a>
                            </div>
                        </li>
                    </c:otherwise>
                </c:choose>
                <li><a href="cart.jsp"><box-icon name='cart' color='#ffffff'></box-icon></a></li>
            </ul>
        </div>
    </nav>
</header>
