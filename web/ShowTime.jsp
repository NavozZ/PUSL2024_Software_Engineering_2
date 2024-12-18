<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="FC.Model.*" %>
<%@ page import="FC.Dao.*" %>
<%@ page import="java.util.List" %>
<%  
    int movieId = 0; // Default value
    try {
        String idParam = request.getParameter("id");
        if (idParam != null) {
            movieId = Integer.parseInt(idParam);
        } else {
            // Handle the case where "id" is not present
            response.sendRedirect("Home.jsp");
            return;
        }
    } catch (NumberFormatException e) {
        // Handle the case where "id" is not a valid integer
        response.sendRedirect("Home.jsp");
    }
    
    List<MovieTime> movieTimes = null;
    try {
        // Create an instance of MovieDao
        MovieTimeDao movieTimeDao = new MovieTimeDao();

        // Fetch the latest movies
        movieTimes = movieTimeDao.selectMovieTimesByMovieId(movieId);
        
        } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>Error: " + e.getMessage() + "</p>");
    }
    
    Movie selectedMovie = null;
    try {
        MovieDao movieDao = new MovieDao();
        selectedMovie = movieDao.selectMovieById(movieId);
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>Error: " + e.getMessage() + "</p>");
    }
    
    List<Location> AllLocations = null;
    try {
        LocationDao locationDao = new LocationDao();
        AllLocations = locationDao.selectAllLocations();
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
    <title>Select Show Time</title>

    <link rel="stylesheet" href="css/Buytickets.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
</head>
<body>
     <%@ include file="NavBar.jsp" %>
<!-- main content -->
<main class="main-content">
  <div class="poster-section">
    <img src="<%= selectedMovie.getImageUrl() %> " alt="Venom: The Last Dance">
  </div>
  <div class="info-section">
      
  <div class="info-section">
    <%
        if (movieTimes != null && !movieTimes.isEmpty()) {
            for (MovieTime movieTime : movieTimes) {
    %>
        <div class="cinema-info">
            <i class="fas fa-map-marker-alt"></i> 
            <span class="cinema-name"><%= AllLocations.get(movieTime.getLocationId()).getName()  %></span>
        </div>
        <div class="showtime">
            <a href="SeatBooking.jsp?id=<%=movieTime.getId()%>"><button><%= movieTime.getTime() %></button></a>
        </div>
        <hr class="short-line">
    <%
            }
        } else {
    %>
        <p>No showtimes available for this movie.</p>
    <%
        }
    %>
</div>
  </div>
</main>
<%@ include file="Footer.jsp" %>

</body>
</html>