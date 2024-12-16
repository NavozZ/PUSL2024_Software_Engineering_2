<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="FC.Model.*" %>
<%@ page import="FC.Dao.*" %>
<%
    List<Location> getAllLocations = null;
    try {
        LocationDao locationDao = new LocationDao();
        getAllLocations = locationDao.selectAllLocations();
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>Error: " + e.getMessage() + "</p>");
    }
%>
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
    Movie selectedMovie = null;
    try {
        MovieDao movieDao = new MovieDao();
        selectedMovie = movieDao.selectMovieById(movieId);
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
    <title>Future Cinema Showcase</title>
    <link rel="stylesheet" href="MovieDetailsStyles.css">
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            color: #333;
        }

        .hero {
            position: relative;
            width: 100%;
            height: 100vh;
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            }

        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
        }

        .content {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
            color: rgb(246, 247, 242);
        }

        .content h1 {
            font-size: 2.5rem;
            margin-bottom: 10px;
        }

        .content h2 {
            font-size: 3rem;
            margin-bottom: 20px;
        }

        .content p {
            font-size: 1.2rem;
            margin-bottom: 30px;
        }

        .buttons {
            display: flex;
            justify-content: center;
            gap: 20px;
        }

        .buttons a {
            text-decoration: none;
            padding: 15px 30px;
            font-size: 1rem;
            color: white;
            background: #d51a09;
            border-radius: 5px;
            transition: background 0.3s;
        }

        .buttons a:hover {
            background: #e64a19;
        }

        .section {
            padding: 20px;
            max-width: 1200px;
            margin: auto;
        }

        .card-gallery {
            display: flex;
            gap: 10px;
            overflow-x: auto;
            padding: 10px 0;
        }

        .card {
            flex: 0 0 300px;
            border-radius: 5px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .card img {
            width: 100%;
            height: auto;
        }

        .horizontal-line {
            width: 50%;
            height: 2px;
            background-color: #000;
            margin: 20px auto;
        }

        .genres, .cast, .team {
            text-align: center;
            margin: 20px 0;
        }

        .genres b {
            display: inline-block;
            margin: 0 10px;
            font-size: 1.1rem;
        }

        .buy-button {
            text-align: center;
            margin: 20px;
        }

        .buy-button button {
            padding: 15px 30px;
            font-size: 1rem;
            color: white;
            background: #d51a09;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s;
        }

        .buy-button button:hover {
            background: #e64a19;
        }
    </style>
</head>

<body>
    <%@ include file="NavBar.jsp" %>
    <!-- Hero Section -->
    <div class="hero" style="background: url('src/tom_hardy_michelle_williams_woody_harrelson_riz_ahmed_reid_scott_hd_venom-1280x720.jpg') no-repeat center center/cover; height: 100vh; width: 100%;">
        <div class="overlay"></div>
        <div class="content">
            <h1>NOW SHOWING AT FUTURE CINEMAS</h1>
            <p>2 HR 40 MIN</p>
            <h2><%= selectedMovie.getTitle() %></h2>
            <div class="buttons">
                <a href="#">BUY TICKETS</a>
                <a href="#">WATCH TRAILER</a>
            </div>
        </div>
    </div>

    <!-- Now Showing Section -->
    <div class="section">
    <h4>NOW SHOWING AT</h4>
    <div class="card-gallery">
        <% 
            if (getAllLocations != null && !getAllLocations.isEmpty()) { 
                for (Location location : getAllLocations) {
        %>
            <div class="card">
                <img src="<%= location.getImageUrl() %>" alt="<%= location.getName() %>">
                <p><%= location.getName() %></p>
                <p><%= location.getAddress() %></p>
            </div>
        <% 
                }
            } else { 
        %>
            <p>No locations available for this movie.</p>
        <% } %>
    </div>
</div>


    <!-- Story Line Section -->
    <div class="section story-line">
        <h2>Story Line</h2>
        <p><%= selectedMovie.getDescription() %></p>
    </div>

    <!-- Genres Section -->
    <div class="horizontal-line"></div>
    <div class="genres">
        <b>Genres:<%= selectedMovie.getGenre() %></b>

    </div>
    <div class="horizontal-line"></div>

    <!-- Cast Section -->
    <div class="cast">
        <h4>CAST</h4>
        <p><strong>Cynthia Erivo</strong> as Elphaba</p>
        <p><strong>Ariana Grande</strong> as Glinda</p>
        <p><strong>Jonathan Bailey</strong> as Fiyero</p>
    </div>

    <!-- Team Section -->
    <div class="horizontal-line"></div>
    <div class="team">
        <h4>TEAM</h4>
        <p><strong>Directed by:<%= selectedMovie.getDirector()%></strong></p>
        <p><strong>Produced by:<%= selectedMovie.getProducer()%></strong></p>
        <p><strong>Written by:<%= selectedMovie.getWriter()%></strong></p>
    </div>
    <div class="horizontal-line"></div>

    <!-- Buy Tickets Button -->
    <div class="buy-button">
    <a href="ShowTime.jsp?id=<%= selectedMovie.getId() %>" target="_blank">
        <button>BUY TICKETS</button>
    </a>
</div>


    <script src="js/MovieSelectingScripts.js"></script>
</body>

</html>
