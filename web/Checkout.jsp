<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page import="FC.Model.User"%>
<%@page import="FC.servlet.EmailSenderServlet"%>

<%
    // Retrieve the selectedSeats parameter from the form
    String seatParam = request.getParameter("selectedSeats");
    List<String> selectedSeats = null;

    if (seatParam != null && !seatParam.isEmpty()) {
        // Split the seats into a list
        selectedSeats = Arrays.asList(seatParam.split(","));
    }
    
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
        return;
    }
    
    // Retrieve user ID from session
    User loggedInUser = (User) session.getAttribute("user");
    int customerId = 0; // Default user ID if not logged in
    if (loggedInUser != null) {
        customerId = loggedInUser.getUserId(); // Assuming 'getId()' returns the user's ID
    } else {
        // Redirect to login if no user is in session
        response.sendRedirect("Login.jsp");
        return;
        
    }
    try{
    EmailSenderServlet e  = new EmailSenderServlet();
    String o = e.sendEmail("navodyatheshan4@gmail.com", "test", "body");
    out.print(o);
    }catch(Exception e)
    {
        out.print(e);
    }
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout</title>
    <script src="https://www.paypal.com/sdk/js?client-id=Afi1ZWiLZ8hOjp72VyWdJmqAUwm11dlMWi0y6wlNHBLl1iYaNP_staUF5scFEscLhMAqtykwA8IPGvCl&currency=USD"></script>
  </head>
  <body>
    <h1>Checkout Page</h1>
    <h2>Selected Seats</h2>
    <ul>
      <% if (selectedSeats != null && !selectedSeats.isEmpty()) { 
          for (String seat : selectedSeats) { %>
            <li><%= seat %></li>
      <%   } 
        } else { %>
        <p>No seats selected.</p>
      <% } %>
    </ul>
    <h3>Total Price: RS. <%= (selectedSeats != null ? selectedSeats.size() * 500 : 0) %></h3>
    <form action="PaymentProcessing.jsp" method="POST">
      <input type="hidden" name="selectedSeats" value="<%= seatParam %>" />
      <div id="paypal-button-container"></div>
    
    <script>
        // Initialize PayPal Buttons
        paypal.Buttons({
            createOrder: function(data, actions) {
                // Create the order details
                return actions.order.create({
                    purchase_units: [{
                        amount: {
                            value: '<%= (selectedSeats != null ? selectedSeats.size() * 500 : 0) %>' // Actual total price
                        }
                    }]
                });
            },
            onApprove: function(data, actions) {
                // Capture the order after approval
                return actions.order.capture().then(function(details) {
                    // Submit the form to OrderServlet after payment is approved
                    const form = document.createElement("form");
                    form.method = "POST";
                    form.action = "OrderServlet"; // Target servlet
                    
                    // Add form fields
                    const movieTimeIdInput = document.createElement("input");
                    movieTimeIdInput.type = "hidden";
                    movieTimeIdInput.name = "movieTimeId";
                    movieTimeIdInput.value = "<%= movieId %>";
                    form.appendChild(movieTimeIdInput);
                    
                    const customerIdInput = document.createElement("input");
                    customerIdInput.type = "hidden";
                    customerIdInput.name = "customerId";
                    customerIdInput.value = "<%= customerId %>"; // Session user ID
                    form.appendChild(customerIdInput);
                    
                    const seatNumbersInput = document.createElement("input");
                    seatNumbersInput.type = "hidden";
                    seatNumbersInput.name = "seatNumbers";
                    seatNumbersInput.value = "<%= seatParam %>"; // Pass seat numbers as a string
                    form.appendChild(seatNumbersInput);

                    // Append the form to the body and submit
                    document.body.appendChild(form);
                    form.submit();
                });
            },
            onError: function(err) {
                // Handle error
                console.error('Transaction error:', err);
                alert('An error occurred during the transaction.');
            }
        }).render('#paypal-button-container'); // Render PayPal buttons
    </script>
    </form>
  </body>
</html>