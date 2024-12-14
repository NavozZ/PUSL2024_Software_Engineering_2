<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="FC.Model.Movie" %>
<%@ page import="FC.Dao.MovieDao" %>
<%@ page import="FC.Model.ComingsoonMovies" %>
<%@ page import="FC.Dao.ComingsoonMoviesDao" %>

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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <title>Future Cinemas</title>
    <link rel="stylesheet" href="css/Home.css">
</head>
<body>

    <!-- Navigation bar -->

    <nav>
        <div class="logo">
          <img src="src/logo.png" alt="logo" />
          <h1>FUTURE CINEMAS</h1>
        </div>
        <ul>
          <li>
            <a href="#">Home</a>
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
            if (latestMovies != null) {
                for (int i = 0; i < 3 && i < latestMovies.size(); i++) { 
                    Movie movie = latestMovies.get(i);
        %>
        <div class="carousel-item <%= (i == 0) ? "active" : "" %>">
            <img src="<%= movie.getImageUrl() %>" class="d-block w-100" alt="<%= movie.getTitle() %>">
            
            <!-- Left Side Film Details -->
            <div class="carousel-caption d-none d-md-block text-start">
                <h2 class="film-name"><%= movie.getTitle() %></h2>
                <p class="film-details">
                    <span class="film-time"><%= movie.getDuration() %></span> | 
                    <span class="film-rating">IMDb: <%= movie.getRating() %></span>
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
                    <a href="movieDetails.jsp?id=<%= movie.getId() %>">
                        <img src="<%= movie.getImageUrl() %>" alt="<%= movie.getTitle() %>">
                    </a>
                    <div class="poster-title"><%= movie.getTitle() %></div>
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
                List<ComingsoonMovies> comingSoonMovies = (List<ComingsoonMovies>) request.getAttribute("comingSoonMovies");
                if (comingSoonMovies != null) {
                    for (ComingsoonMovies movie : comingSoonMovies) {
            %>
            <!-- Poster -->
            <div class="coming-soon-poster">
                <a href="<%= movie.getDetailsPageUrl() %>">
                    <img src="<%= movie.getImageUrl() %>" alt="<%= movie.getTitle() %>">
                </a>
                <div class="poster-title"><%= movie.getTitle() %></div>
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

      <!-- Footer -->

      <footer id="footer">
        <div class="container">
            <div class="row">
                <!-- Logo and About Section -->
                <div class="col">
                    <a href="index.html">
                        <img src="src/logo.png" alt="Logo" class="logo-footer">
                    </a>
                    <div class="footer-about">
                        <p>Future Cinema is your ultimate destination for exploring the latest blockbusters, timeless classics, and hidden gems. 
                            Experience the magic of cinema with personalized recommendations, detailed reviews, and exclusive trailers. </p>
                    </div>
                </div>
                <!-- Useful Links Section -->
                <div class="col">
                    <div class="useful-link">
                        <h2>Useful Links</h2>
                        <div class="use-links">
                            <ul>
                                <li><a href="index.html"><i class="fas fa-angle-right"></i> Home</a></li>
                                <li><a href="about.html"><i class="fas fa-angle-right"></i> About Us</a></li>
                                <li><a href="gallery.html"><i class="fas fa-angle-right"></i> Movies</a></li>
                                <li><a href="contact.html"><i class="fas fa-angle-right"></i> Locations</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                
                <div class="col">
                    <div class="other-links">
                        <span><br></span>
                        <div class="other-icons">
                            <ul>
                                <li><a href="#"><i class="fas fa-angle-right"></i> Contact Us</a></li>
                                <li><a href="#"><i class="fas fa-angle-right"></i> Disclaimer</a></li>
                                <li><a href="#"><i class="fas fa-angle-right"></i>Terms And Conditions</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                
                <div class="col">
                    <div class="address">
                        <h2>Address</h2>
                        <ul>
                            <li><i class="fas fa-map-marker-alt"></i> xxxx xxxxx, xxxxx xxxx, xxx</li>
                            <li><a href="#"><i class="fas fa-phone"></i> +94 909045001</a></li>
                            <li><a href="#"><i class="fas fa-envelope"></i> futurecinema@hotmail.com</a></li>
                        </ul>
                    </div>
                    <div class="subscribe">
                        <h2>Subscribe to Our Newsletter</h2>
                        <form action="#" method="POST">
                            <input type="email" placeholder="Enter your email" required>
                            <button type="submit">Subscribe</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </footer>

</body>
</html>
