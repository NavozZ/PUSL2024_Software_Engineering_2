<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="FC.Model.Movie" %>
<%@ page import="FC.connection.dbconnection" %>
<%@ page import="FC.Dao.MovieDao" %>

<%
    List<Movie> latestMovies = null;
    try {
        // Create an instance of MovieDao
        MovieDao movieDao = new MovieDao();

        // Fetch the latest movies
        latestMovies = movieDao.getLatestMovies();
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>Error: " + e.getMessage() + "</p>");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movie</title>
    <link rel="stylesheet" href="css/Movies.css">
    
</head>
<body>
   
    <div class="main">
        <!-- Section 1: Showing Now -->
        <div class="section1">
            <div class="section-name">
                <p class="section-name-text">Showing Now</p>
            </div>
            <div class="section1-all-movie">
                <div class="movies-grid">
    <% if (latestMovies != null) { %>
        <% for (Movie movie : latestMovies) { %>
            <div class="movie-card">
                <img src="<%= movie.getImageUrl() %>" alt="<%= movie.getTitle() %>">
                <div class="movie-info">
                    <h4><%= movie.getTitle() %></h4>
                    <h6><%= movie.getGenre() %></h6>
                </div>
            </div>
        <% } %>
    <% } else { %>
        <p>No movies available.</p>
    <% } %>
</div>
                <div class="view-all-text-block">
                    <button class="view-all">VIEW ALL ></button>
                </div>
            </div>
        </div>

        <!-- Section 2: Coming Soon -->
        <div class="section2">
            <div class="section-name">
                <p class="section-name-text">Coming Soon</p>
            </div>
            <div class="section2-all-movie">
                <div class="movies-grid">
                    <!-- Movie Cards -->
                    <div class="movie-card">
                        <img src="https://s3-alpha-sig.figma.com/img/c421/aadf/c8127caccde25aeba839bea45f9a0355?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=flPqPGg5vFxwK610v53BYdPO39mPlBvM5yZfJpZ~E59w5zgunEeMlCoZ~JHTs6z-vvs1k17ThA3lot6Q9xYxUHR-0dGmVa4TSKwd5xNxrUPl6nnzggqAP0wz8rfKuCvuwcvLNzGBW9ld66Y6oHHDfDQW-ljAz5xdP0SSY8FkQDOKm3L4lbLuGaK~oXtHxqlfkbObL6aDRjNPNvHeXIHVeCW7vyt4-V8H~cRK5e97QWFmXU9NIx186p1nDBgLvmcwoQqLrKpm18j59Lxy3RDRrOvosoq4uUjA2I4qnfbbW8Y9RXr0BFIUnKdmqwEwZI-HNOtkwdIAziogdSeLV89p4A__" alt="Avatar 3 - fire & ash">
                        <div class="movie-info">
                            <h4>Avatar 3 - Fire & Ash</h4>
                            <h6>Science | Fiction</h6>
                        </div>
                    </div>
                    <!-- Additional Movie Cards -->
                    <!-- Similar structure repeated for other movies -->
                </div>
                <div class="view-all-text-block">
                    <button class="view-all">VIEW ALL ></button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
