<%-- 
    Document   : UserDashboard
    Created on : Dec 14, 2024, 11:56:41 AM
    Author     : navod
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User Dashboard</title>
        <link rel="stylesheet" href="css/UserDashboard.css">
    </head>
    <body>
        <%@ include file="NavBar.jsp" %>
       
    <!-- Sidebar Navigation -->
    <div class="sidebar">
        <h2>User Dashboard</h2>
        <ul>
            <li><a href="#">Home</a></li>
            <li><a href="#">Profile</a></li>
            <li><a href="#">Tickets</a></li>
            <li><a href="#">Logout</a></li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="main-content">

        <!-- User Details Section -->
        <div class="details-section">
            <h3>Your Details</h3>
            <p><strong>Name:</strong> John Doe</p>
            <p><strong>Email:</strong> john.doe@example.com</p>
            <p><strong>Mobile:</strong> +1234567890</p>
            <button id="editDetails">Edit Details</button>
        </div>

        <!-- Ticket Management Section -->
        <div class="ticket-section">
            <h3>Your Tickets</h3>
            <ul>
                <li>
                    <span>Movie: Inception</span>
                    <span>Date: 2024-12-20</span>
                    <button class="cancel-btn">Cancel</button>
                </li>
                <li>
                    <span>Movie: The Matrix</span>
                    <span>Date: 2024-12-22</span>
                    <button class="cancel-btn">Cancel</button>
                </li>
            </ul>
        </div>

        <!-- Edit Profile Section - Initially hidden -->
        <div class="profile-section hidden">
            <h3>Edit Profile</h3>
            <form id="profileForm">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" placeholder="Enter your name">
                <button type="submit">Save</button>
                <br>
                <br>
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" placeholder="Enter your email">
                <button type="submit">Save</button>
                <br>
                <br>

                <label for="password">Password:</label>
                <input type="password" id="password" name="password" placeholder="Enter new password">
                <button type="submit">Save</button>
                <br>
                <br>

                <label for="mobile">Mobile Number:</label>
                <input type="tel" id="mobile" name="mobile" placeholder="Enter your mobile number">
                <button type="submit">Save</button>
            </form>
        </div>

    </div>

    <script src="js/UserDashboard.js"></script>
    </body>
</html>
