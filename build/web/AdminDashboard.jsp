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
                    <li><a href="#movies" >Movies</a></li>
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
                        <div>Total Theaters Listed: <span id="total-theaters">0</span></div>
                        <div>Total Users Registered: <span id="total-users">0</span></div>
                        <div>Total Bookings: <span id="total-bookings">0</span></div>
                    </div>
                </section>

                <!-- Movies Section -->
                <section id="movies">
                    <h2>Movie Management</h2>

                    <!-- List of Movies -->
                    <div class="movie-list">
                        <h3>List of Movies</h3>
                        <input type="text" placeholder="Filter by Title or Genre" id="filter-movies">
                        <ul id="movie-list">
                            <li data-id="1">
                                <span>Movie 1 - Genre</span>
                                <button class="edit-movie">Edit</button>
                                <button class="delete-movie">Delete</button>
                            </li>
                            <li data-id="2">
                                <span>Movie 2 - Genre</span>
                                <button class="edit-movie">Edit</button>
                                <button class="delete-movie">Delete</button>
                            </li>
                        </ul>
                    </div>

                    <!-- Add Movie -->
                    <div class="add-movie">
                        <h3>Add New Movie</h3>
                        <form id="add-movie-form">
                            <input type="text" id="movie-title" placeholder="Title" required>
                            <input type="text" id="movie-genre" placeholder="Genre" required>
                            <input type="text" id="movie-language" placeholder="Language" required>
                            <input type="number" id="movie-duration" placeholder="Duration (minutes)" required>
                            <textarea id="movie-description" placeholder="Description"></textarea>
                            <input type="date" id="movie-release-date" required>
                            <input type="file" id="movie-poster">
                            <button type="submit">Add Movie</button>
                        </form>
                    </div>

                    <!-- Edit Movie -->
                    <div class="edit-movie-section" id="edit-movie-section">
                        <h3>Edit Movie</h3>
                        <form id="edit-movie-form">
                            <input type="text" id="edit-movie-title" placeholder="Title" required>
                            <input type="text" id="edit-movie-genre" placeholder="Genre" required>
                            <input type="text" id="edit-movie-language" placeholder="Language" required>
                            <input type="number" id="edit-movie-duration" placeholder="Duration (minutes)" required>
                            <textarea id="edit-movie-description" placeholder="Description"></textarea>
                            <input type="date" id="edit-movie-release-date" required>
                            <button type="submit">Update Movie</button>
                        </form>
                    </div>

                    <!-- Delete Movie -->
                    <div class="delete-movie-section" id="delete-movie-section">
                        <h3>Delete Movie</h3>
                        <p>Select a movie to delete:</p>
                        <select id="delete-movie-select">
                            <option value="1">Movie 1</option>
                            <option value="2">Movie 2</option>
                        </select>
                        <button id="confirm-delete-movie">Delete Selected Movie</button>
                    </div>
                </section>

                <!-- Theaters Section -->
                <section id="theaters">
                    <h2>Theater Management</h2>

                    <!-- List of Theaters -->
                    <div class="theater-list">
                        <h3>List of Theaters</h3>
                        <input type="text" placeholder="Filter by Name or Location" id="filter-theaters">
                        <ul id="theater-list">
                            <li data-id="1">
                                <span>Theater 1 - Location</span>
                                <button class="edit-theater">Edit</button>
                                <button class="delete-theater">Delete</button>
                            </li>
                            <li data-id="2">
                                <span>Theater 2 - Location</span>
                                <button class="edit-theater">Edit</button>
                                <button class="delete-theater">Delete</button>
                            </li>
                        </ul>
                    </div>

                    <!-- Add Theater -->
                    <div class="add-theater">
                        <h3>Add New Theater</h3>
                        <form id="add-theater-form">
                            <input type="text" id="theater-name" placeholder="Theater Name" required>
                            <input type="text" id="theater-location" placeholder="Location" required>
                            <input type="number" id="theater-seats" placeholder="Number of Seats" required>
                            <input type="text" id="theater-facilities" placeholder="Facilities (e.g., 3D, IMAX)">
                            <button type="submit">Add Theater</button>
                        </form>
                    </div>

                    <!-- Edit Theater -->
                    <div class="edit-theater-section" id="edit-theater-section">
                        <h3>Edit Theater</h3>
                        <form id="edit-theater-form">
                            <input type="text" id="edit-theater-name" placeholder="Theater Name" required>
                            <input type="text" id="edit-theater-location" placeholder="Location" required>
                            <input type="number" id="edit-theater-seats" placeholder="Number of Seats" required>
                            <input type="text" id="edit-theater-facilities" placeholder="Facilities (e.g., 3D, IMAX)">
                            <button type="submit">Update Theater</button>
                        </form>
                    </div>

                    <!-- Delete Theater -->
                    <div class="delete-theater-section" id="delete-theater-section">
                        <h3>Delete Theater</h3>
                        <p>Select a theater to delete:</p>
                        <select id="delete-theater-select">
                            <option value="1">Theater 1</option>
                            <option value="2">Theater 2</option>
                        </select>
                        <button id="confirm-delete-theater">Delete Selected Theater</button>
                    </div>
                </section>

                <!-- Schedule Section -->
                <section id="schedule">
                    <h2>Schedule Management</h2>
                    <div class="schedule-list">
                        <h3>View Schedule</h3>
                        <input type="text" placeholder="Filter by Date, Movie, or Theater" id="filter-schedule">
                        <ul id="schedule-list">
                            <!-- Schedules will be listed here -->
                        </ul>
                    </div>
                    <div class="add-schedule">
                        <h3>Add New Schedule</h3>
                        <form>
                            <select id="movie-select" required>
                                <!-- Movies dropdown -->
                            </select>
                            <select id="theater-select" required>
                                <!-- Theaters dropdown -->
                            </select>
                            <input type="datetime-local" placeholder="Date and Time" required>
                            <input type="number" placeholder="Price per Ticket" required>
                            <button type="submit">Add Schedule</button>
                        </form>
                    </div>
                </section>

                <!-- Orders Section -->
                <section id="orders">
                    <h2>Order Management</h2>
                    <div class="order-list">
                        <h3>View Orders</h3>
                        <input type="text" placeholder="Filter by Date, User, or Movie" id="filter-orders">
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
                        <input type="text" placeholder="Search by Username or Email" id="filter-users">
                        <ul id="user-list">
                            <!-- Users will be listed here -->
                        </ul>
                    </div>
                    <div class="add-admin">
                        <h3>Add Admin User</h3>
                        <form>
                            <input type="text" placeholder="Admin Username" required>
                            <input type="email" placeholder="Email" required>
                            <input type="password" placeholder="Password" required>
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
                            <input type="text" placeholder="Site Name" required>
                            <input type="file" placeholder="Logo">
                            <input type="text" placeholder="Contact Information" required>
                            <button type="submit">Update</button>
                        </form>
                    </div>
                    <div class="payment-settings">
                        <h3>Payment Settings</h3>
                        <form>
                            <input type="text" placeholder="Payment Gateway Details" required>
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

                <!-- Reports Section -->
                <section id="reports">
                    <h2>Reports</h2>
                    <p>Generate detailed performance and user reports here.</p>
                </section>

                <!-- Logout Section -->
                <section id="logout">
                    <h2>Logout</h2>
                    <button>Logout Securely</button>
                </section>
            </main>
        </div>
        <script src="js/AdminDashboard.js"></script>
        <%@ include file="Footer.jsp" %>
    </body>
</html>
