<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>

header {
    background-color: #A1A1A1;
    color: #fff;
    padding: 1rem 0;
}

.nav {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin: 0 auto;
    padding: 0 1rem;
    height: 40px;
}

.logo {
    margin-left: 20px;
    display: flex;
    align-items: center;
}

.logo a {
    color: #fff;
    font-size: 1.5rem;
    text-decoration: none;
    font-weight: bold;
    margin-left: 10px;
}

.logo img {
    max-width: 50px;
    height: auto;
    border-radius: 50%;
}

/* Style the navbar */
.nav ul {
    
    list-style-type: none;
    margin: 0;
    padding: 0;
    display: flex;
    align-items: center;
}

.nav ul li {
    margin-left: 20px;
}

.nav ul li a {
    color: white;
    font-size: 1.2rem;
    font-weight: 500;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

.nav ul li a:hover, .dropdown:hover .dropbtn {
    color: black;
}

.logo1 img {
    max-width: 50px;
    height: auto;
    border-radius: 50%;
    margin-left: 10px;
    margin-right:30px;
}

</style>
<header>
    <nav>
        <div class="nav">
            <div class="logo">
                <img src="e_logo.png" alt="Shoppify Logo">
                <a href="index.jsp">Shoppify</a>
            </div>
            <ul>
                <c:choose>
                    <c:when test="${not empty sessionScope.user}">
                        <li><a href="logout">Logout</a></li>
                    </c:when>
                </c:choose>
                <li class="logo1">
                    <img src="user.jpg" alt="User Profile">
                </li>
            </ul>
        </div>
    </nav>
</header>
