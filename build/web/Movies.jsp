<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="FC.Model.Movie" %>
<%@ page import="FC.connection.dbconnection" %>
<%@ page import="FC.Dao.MovieDao" %>

<%
    List<Movie> latestMovies = null;

    try {
        // Fetch the latest movies using MovieDao
        MovieDao movieDao = new MovieDao();
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
    <title>Movies</title>
    <link rel="stylesheet" href="css/Movies.css">
</head>
<body>
    <%@ include file="NavBar.jsp" %>

    <!-- Main Content -->
    <div class="main">
        <!-- Section 1: Showing Now -->
        <div class="section1">
            <div class="section-name">
                <p class="section-name-text">Movies List</p>
            </div>
            <div class="section1-all-movie">
                <div class="movies-grid">
                    <% if (latestMovies != null && !latestMovies.isEmpty()) { %>
                        <% for (Movie movie : latestMovies) { %>
                            <a href="MovieDetails.jsp?id=<%= movie.getId() %>" class="movie-card">
                                <div class="movie-content">
                                    <img src="<%= movie.getImage2() %>" alt="<%= movie.getTitle() %>">
                                    <div class="movie-info">
                                        <h4><%= movie.getTitle() %></h4>
                                        <h6><%= movie.getGenre() %></h6>
                                    </div>
                                </div>
                            </a>
                        <% } %>
                    <% } else { %>
                        <p>No movies available at the moment.</p>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
 <%@ include file="Footer.jsp" %>
</body>
</html>
