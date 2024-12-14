<%-- 
    Document   : AdminDashboard
    Created on : Dec 14, 2024, 11:20:24 AM
    Author     : navod
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Dashboard</title>
        <link rel="stylesheet" href="css/AdminDashboard.css">
    </head>
    <body>
        <div class="dashboard">
        <nav class="nav">
            <h1>Admin Dashboard</h1>
            <ul>
                <li><a href="#overview" class="active">Dashboard</a></li>
                <li><a href="#movies">Movies</a></li>
                <li><a href="#theaters">Theaters</a></li>
                <li><a href="#schedule">Schedule</a></li>
                <li><a href="#orders">Orders</a></li>
                <li><a href="#users">Users</a></li>
                <li><a href="#settings">Settings</a></li>
                <li><a href="#reports">Reports</a></li>
                <li><a href="#logout">Logout</a></li>
            </ul>
        </nav>

        <main>
            <!-- Overview Section -->
            <section id="overview">
                <h2>Site Performance Overview</h2>
                <div class="stats">
                    <div>Total Movies Listed: <span id="total-movies">0</span></div>
                    <div>Total Users Registered: <span id="total-users">0</span></div>
                    <div>Total Bookings: <span id="total-bookings">0</span></div>
                    <div>Revenue Statistics (Daily/Weekly/Monthly): <span id="revenue-stats">$0</span></div>
                </div>
                <div class="quick-links">
                    <a href="#add-movie">Add Movie</a>
                    <a href="#orders">View Orders</a>
                    <a href="#users">Manage Users</a>
                </div>
            </section>

            <!-- Movies Section -->
            <section id="movies">
                <h2>Movie Management</h2>
                <div class="movie-list">
                    <h3>List of Movies</h3>
                    <input type="text" placeholder="Filter by Genre, Release Date, or Status">
                    <ul id="movie-list">
                        <!-- Movies will be listed here -->
                    </ul>
                </div>
                <div class="add-movie">
                    <h3>Add New Movie</h3>
                    <form>
                        <input type="text" placeholder="Title">
                        <input type="text" placeholder="Genre">
                        <input type="text" placeholder="Language">
                        <input type="number" placeholder="Duration (minutes)">
                        <textarea placeholder="Description"></textarea>
                        <input type="date" placeholder="Release Date">
                        <input type="file" placeholder="Poster/Image">
                        <button type="submit">Add Movie</button>
                    </form>
                </div>
            </section>

            <!-- Theaters Section -->
            <section id="theaters">
                <h2>Theater Management</h2>
                <div class="theater-list">
                    <h3>List of Theaters</h3>
                    <ul id="theater-list">
                        <!-- Theaters will be listed here -->
                    </ul>
                </div>
                <div class="add-theater">
                    <h3>Add New Theater</h3>
                    <form>
                        <input type="text" placeholder="Theater Name">
                        <input type="text" placeholder="Location">
                        <input type="number" placeholder="Number of Seats">
                        <input type="text" placeholder="Facilities (e.g., 3D, IMAX)">
                        <button type="submit">Add Theater</button>
                    </form>
                </div>
            </section>

            <!-- Schedule Section -->
            <section id="schedule">
                <h2>Schedule Management</h2>
                <div class="schedule-list">
                    <h3>View Schedule</h3>
                    <input type="text" placeholder="Filter by Date, Movie, or Theater">
                    <ul id="schedule-list">
                        <!-- Schedules will be listed here -->
                    </ul>
                </div>
                <div class="add-schedule">
                    <h3>Add New Schedule</h3>
                    <form>
                        <select id="movie-select">
                            <!-- Movies dropdown -->
                        </select>
                        <select id="theater-select">
                            <!-- Theaters dropdown -->
                        </select>
                        <input type="datetime-local" placeholder="Date and Time">
                        <input type="number" placeholder="Price per Ticket">
                        <button type="submit">Add Schedule</button>
                    </form>
                </div>
            </section>

            <!-- Orders Section -->
            <section id="orders">
                <h2>Order Management</h2>
                <div class="order-list">
                    <h3>View Orders</h3>
                    <input type="text" placeholder="Filter by Date, User, or Movie">
                    <ul id="order-list">
                        <!-- Orders will be listed here -->
                    </ul>
                </div>
            </section>

            <!-- Users Section -->
            <section id="users">
                <h2>User Management</h2>
                <div class="user-list">
                    <h3>List of Users</h3>
                    <input type="text" placeholder="Search by Username or Email">
                    <ul id="user-list">
                        <!-- Users will be listed here -->
                    </ul>
                </div>
                <div class="add-admin">
                    <h3>Add Admin User</h3>
                    <form>
                        <input type="text" placeholder="Admin Username">
                        <input type="email" placeholder="Email">
                        <input type="password" placeholder="Password">
                        <button type="submit">Add Admin</button>
                    </form>
                </div>
            </section>

            <!-- Settings Section -->
            <section id="settings">
                <h2>Settings</h2>
                <div class="general-settings">
                    <h3>General Settings</h3>
                    <form>
                        <input type="text" placeholder="Site Name">
                        <input type="file" placeholder="Logo">
                        <input type="text" placeholder="Contact Information">
                        <button type="submit">Update</button>
                    </form>
                </div>
                <div class="payment-settings">
                    <h3>Payment Settings</h3>
                    <form>
                        <input type="text" placeholder="Payment Gateway Details">
                        <button type="submit">Update</button>
                    </form>
                </div>
                <div class="notifications">
                    <h3>Notifications</h3>
                    <form>
                        <label>
                            <input type="checkbox"> Email Notifications
                        </label>
                        <label>
                            <input type="checkbox"> SMS Notifications
                        </label>
                        <button type="submit">Update</button>
                    </form>
                </div>
            </section>
            

            <!-- Logout Section -->
            <section id="logout">
                <h2>Logout</h2>
                <button>Logout Securely</button>
            </section>
        </main>
    </div>
    </body>
</html>
