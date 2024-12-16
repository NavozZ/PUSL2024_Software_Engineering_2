<%-- 
    Document   : NavBar
    Created on : Dec 16, 2024, 1:44:14 AM
    Author     : navod
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NavBar</title>
        <link rel="stylesheet" href="css/navbarstyle.css">
    </head>
    <body >
        <nav>
    <div class="logo">
      <img src="src/logo.png" alt="logo" />
      <h1>FUTURE CINEMAS</h1>
    </div>
    <ul>
      <li>
        <a href="Home.jsp">Home</a>
      </li>
      <li>
        <a href="Movies.jsp">Movies</a>
      </li>
      <li>
        <a href="Location.jsp">Locations</a>
      </li>     
    </ul>
    <a href="Movies.jsp" class="buy-tickets-btn">Buy Tickets</a>
    <a href="Login.jsp" class="login-link">LOGIN</a>
    <div class="profile-dropdown">
      <button class="profile-btn">
        <img src="src/icons8-menu-64.png" alt="Profile" class="profile-icon"> 
      </button>
      <div class="dropdown-menu">
        <a href="UserDashboard.jsp">View Profile</a>
        <a href="#">Logout</a>
      </div>
    </div>
    
    <div class="hamburger">
      <span class="line"></span>
      <span class="line"></span>
      <span class="line"></span>
    </div>
  </nav>
  <div class="menubar">
    <ul>
      <li>
        <a class="Orange" href="#">Home</a>
      </li>
      <li>
        <a href="Movies.jsp">Movies</a>
      </li>
      <li>
        <a href="Location.jsp">Location</a>
      </li>
      <li>
        <a href="Login.jsp">LOGIN</a>
      </li>
    </ul>
  </div>
  <script src="js/navbar.js"></script>
  <div>
    
  </div>
    </body>
</html>
