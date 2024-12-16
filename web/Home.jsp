<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="FC.Model.Movie" %>
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
    List<Movie> ComingsoonMovies = null;
    try {
        // Create an instance of MovieDao
        MovieDao movieDao = new MovieDao();

        // Fetch the latest movies
        ComingsoonMovies = movieDao.getComingsoonMovies(); 
        } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>Error: " + e.getMessage() + "</p>");
    }
     List<Movie> CarouselMovies = null;
    try {
        // Create an instance of MovieDao
        MovieDao movieDao = new MovieDao();

        // Fetch the latest movies
        CarouselMovies = movieDao.getCarouselImage();
        
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <title>Future Cinemas</title>
    <link rel="stylesheet" href="css/Home.css">
</head>
<body>
    <%@ include file="NavBar.jsp" %>

      <!-- carousel -->

    <div id="carouselExampleIndicators" class="carousel slide position-relative">
    <!-- Carousel Indicators -->
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>

   <!-- Carousel Inner -->
<div class="carousel-inner">
    <% 
        if (CarouselMovies != null && !CarouselMovies.isEmpty()) {
            for (int i = 0; i < Math.min(3, CarouselMovies.size()); i++) { 
                Movie cmovie = CarouselMovies.get(i);
    %>
    <div class="carousel-item <%= (i == 0) ? "active" : "" %>">
        <img src="<%= cmovie.getCarouselImg() %>" class="d-block w-100" alt="<%= cmovie.getTitle() %>">
        
        <!-- Left Side Film Details -->
        <div class="carousel-caption d-none d-md-block text-start">
            <h2 class="film-name"><%= cmovie.getTitle() %></h2>
            <p class="film-details">
                <span class="film-time"><%= cmovie.getDuration() %> min</span> | 
                <span class="film-rating">IMDb: <%= cmovie.getRating() %></span>
            </p>
        </div>
    </div>
    <% 
            } 
        } else {
    %>
        <p>No movies available at the moment.</p>
    <% 
        }
    %>
</div>

<!-- Carousel Controls -->
<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
</button>
<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
</button>

<!-- Custom Buttons -->
<div class="custom-buttons position-absolute bottom-0 end-0 m-3">
    <button class="btn btn-primary me-2">Buy Ticket</button>
    <button class="btn btn-secondary">Watch Trailer</button>
</div>



      <!-- Now showing section -->

      <div class="container-wrapper">
        <!-- Header Section -->
        <div class="header-container">
          <h1>NOW <br>SHOWING</h1>
        </div>
      
        <!-- Posters Section -->
        <div class="container">
            <% 
                if (latestMovies != null && !latestMovies.isEmpty()) {
                    for (Movie movie : latestMovies) { 
            %>
                <div class="poster">
                    <a href="MovieDetails.jsp?id=<%= movie.getId() %>">
                        <img src="<%= movie.getImageUrl() %>" alt="<%= movie.getTitle() %>">
                    </a>
                    
                </div>
            <% 
                    }
                } else {
            %>
                <p>No movies available at the moment.</p>
            <% 
                }
            %>
        </div>
      
        <!-- View All Button -->
        <div class="view-all">
          <a href="Movies.jsp">View All</a>
        </div>
      </div>
      
      <!-- Coming Soon Section -->
    <div class="coming-soon-container-wrapper">
        <!-- Coming Soon Header -->
        <div class="header-container">
            <h1>COMING SOON</h1>
        </div>
      
        <div class="coming-soon-container">
            <% 
                if (ComingsoonMovies != null) {
                    for (Movie csmovie : ComingsoonMovies) {
            %>
            <!-- Poster -->
            <div class="coming-soon-poster">
                <a href="">
                    <img src="<%= csmovie.getImageUrl() %>" alt="">
                </a>
                
            </div>
            <% 
                    }
                } else {
            %>
                <p>No coming soon movies available.</p>
            <% 
                }
            %>
        </div>
    </div>

      

</body>
</html>
