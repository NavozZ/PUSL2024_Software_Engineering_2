    <%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="FC.Model.*" %>
<%@ page import="FC.Dao.*" %> 
<%
    
    List<Location> AllLocations = null;
    try {
        LocationDao locationDao = new LocationDao();
        AllLocations = locationDao.selectAllLocations();
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>Error: " + e.getMessage() + "</p>");
    }
    
    int movieTimeId = 0; // Default value
    try {
        String idParam = request.getParameter("id");
        if (idParam != null) {
            movieTimeId = Integer.parseInt(idParam);
        } else {
            // Handle the case where "id" is not present
            response.sendRedirect("Home.jsp");
            return;
        }
    } catch (NumberFormatException e) {
        // Handle the case where "id" is not a valid integer
        response.sendRedirect("Home.jsp");
    }
    
    MovieTime selectedMovieTime = null;
    try {
        MovieTimeDao movieTimeDao = new MovieTimeDao();
        selectedMovieTime = movieTimeDao.selectMovieTimeById(movieTimeId);
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>Error: " + e.getMessage() + "</p>");
    }
    
    Movie selectedMovie = null;
    try {
        MovieDao movieDao = new MovieDao();
        selectedMovie = movieDao.selectMovieById(selectedMovieTime.getMovieId());
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>Error: " + e.getMessage() + "</p>");
    }

    List<String> bookedSeats = new ArrayList<>(); // Initialize the list
    try {
        OrderDao orderDao = new OrderDao(); // Assuming OrderDao is implemented
        List<Order> movieTimeOrders = orderDao.getOrdersByMovieTimeId(movieTimeId); // Fetch orders for the movie time

        for (Order movieTimeOrder : movieTimeOrders) {
            String seatNumbers = movieTimeOrder.getSeatNumbers().toString(); // Get seat numbers

            seatNumbers = seatNumbers.replace("[", "").replace("]", "");

            // Split by comma to get individual seats
            String[] seats = seatNumbers.split(",");
            for (String seat : seats) {
                bookedSeats.add(seat.trim()); // Trim spaces and add to the list
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>Error: " + e.getMessage() + "</p>");
    }
       
    for (int i = 0; i < bookedSeats.size(); i++) {
    String cleanedSeat = bookedSeats.get(i).replace("\"", "").trim(); // Remove quotes and extra spaces
    bookedSeats.set(i, cleanedSeat); // Update the list with cleaned values
    }
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/SBstyle.css" />
    <title>Seat Booking Page</title>
  </head>
 
  <body>
      <%@ include file="NavBar.jsp" %>
  
    <header>
      <h4 id="page-title">SEAT SELECT</h4>
      <h1 id="film-title"><%=selectedMovie.getTitle()%></h1>
      <p id="film-details">
          <span id="date"><%=selectedMovieTime.getDate()%></span>, <span id="location">Location: <%=AllLocations.get(selectedMovieTime.getLocationId()).getName() %></span>
      </p>
      <hr>
      <p id="showtime">SHOWTIME: <span id="time"><%= selectedMovieTime.getTime() %></span></p>
      <hr>
    </header>

    

    <ul class="showcase">
      <li>
        <div class="seat"></div>
        <small>AVAILABLE</small>
      </li>
      <li>
        <div class="seat selected"></div>
        <small>SELECTED</small>
      </li>
      <li>
        <div class="seat sold"></div>
        <small>UNAVAILABLE</small>
      </li>
    </ul>

    <div class="container">
      <div class="screen"></div>
      <p class="screen-text">SCREEN THIS WAY</p>

      <%-- Generate seats dynamically using JSP --%>
      <% 
        char[] rows = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I'}; // Row labels
        int seatsPerRow = 15; // Number of seats per row

        for (char row : rows) {
      %>
      <div class="row">
        <span class="row-number"><%= row %></span>
        <% 
          for (int seat = 1; seat <= seatsPerRow; seat++) {
            String seatId = row + String.valueOf(seat); // Unique seat ID
            String seatClass = bookedSeats.contains(seatId) ? "seat sold" : "seat";
        %>
        <div class="<%= seatClass %>" id="<%= seatId %>"></div>
        <% } %>
      </div>
      <% } %>
    </div>

    <p class="text">
      You have selected <span id="count">0</span> seat(s) for a price of RS.<span id="total">0</span>
    </p>

    <form action="Checkout.jsp?id=<%=movieTimeId%>" method="POST" id="seatForm">
  <input type="hidden" name="selectedSeats" id="selectedSeatsInput" value="" />
  <button type="submit" class="pay-btn">Pay</button>
</form>



    <script>
document.addEventListener("DOMContentLoaded", () => {
  const seats = document.querySelectorAll(".seat:not(.sold)"); // Select all available seats
  const count = document.getElementById("count");
  const total = document.getElementById("total");
  const pricePerSeat = 500; // Example seat price
  let selectedSeats = [];

  // Add click event to available seats
  seats.forEach((seat) => {
    seat.addEventListener("click", () => {
      const seatId = seat.id;

      // Toggle "selected" class
      if (seat.classList.contains("selected")) {
        seat.classList.remove("selected");
        selectedSeats = selectedSeats.filter((id) => id !== seatId);
      } else {
        seat.classList.add("selected");
        selectedSeats.push(seatId);
      }

      // Update count and total
      count.textContent = selectedSeats.length;
      total.textContent = selectedSeats.length * pricePerSeat;

      // Update the hidden input with selected seats
      document.getElementById("selectedSeatsInput").value = selectedSeats.join(",");
    });
  });
});

</script>


  </body>
</html>
