<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="FC.Model.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NavBar</title>
        <link rel="stylesheet" href="css/navbarstyle.css">
    </head>
    <body>
        <nav class="navbar">
            <!-- Logo Section -->
            <div class="logo">
                <img src="src/logo.png" alt="logo" />
                <h1>FUTURE CINEMAS</h1>
            </div>
            
            <!-- Navigation Links -->
            <ul>
                <li><a href="Home.jsp">Home</a></li>
                <li><a href="Movies.jsp">Movies</a></li>
                <li><a href="Location.jsp">Locations</a></li>
            </ul>

            <!-- Conditional Display Based on Session -->
            <%
                User user = (User) session.getAttribute("user"); // Check for user in session
                if (user == null) {
            %>
                <!-- Login Button for Guests -->
                <a href="Login.jsp" class="login-link">LOGIN</a>
            <%
                } else {
            %>
                <!-- Profile Dropdown for Logged-In Users -->
                <div class="profile-dropdown">
                    <button class="profile-btn">
                        <img src="src/icons8-menu-64.png" alt="Profile" class="profile-icon">
                    </button>
                    <div class="dropdown-menu">
                        <a href="UserDashboard.jsp">View Profile</a>
                        <a href="LogoutServlet">Logout</a>
                    </div>
                </div>
            <%
                }
            %>

            <!-- Hamburger Menu -->
            <div class="hamburger">
                <span class="line"></span>
                <span class="line"></span>
                <span class="line"></span>
            </div>
        </nav>

        <!-- Menubar for Small Screens -->
        <div class="menubar">
            <ul>
                <li><a class="Orange" href="Home.jsp">Home</a></li>
                <li><a href="Movies.jsp">Movies</a></li>
                <li><a href="Location.jsp">Location</a></li>
                <% if (user == null) { %>
                    <li><a href="Login.jsp">LOGIN</a></li>
                <% } else { %>
                    <li><a href="UserDashboard.jsp">Dashboard</a></li>
                    <li><a href="LogoutServlet">Logout</a></li>
                <% } %>
            </ul>
        </div>

        <!-- Script -->
        <script src="js/navbar.js"></script>
    </body>
</html>
