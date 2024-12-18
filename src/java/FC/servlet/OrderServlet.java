import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import org.json.JSONArray;

public class OrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try (Connection con = FC.connection.dbconnection.getConnection()) {
            // Retrieve form data
            int movieTimeId = Integer.parseInt(request.getParameter("movieTimeId"));
            int customerId = Integer.parseInt(request.getParameter("customerId"));
            String seatNumbers = request.getParameter("seatNumbers");

            // Convert seat numbers into valid JSON format
            JSONArray seatNumbersJson = new JSONArray(seatNumbers.split(","));

            // SQL query to insert the order
            String query = "INSERT INTO orders (movie_time_id, customer_id, seat_number) VALUES (?, ?, ?)";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, movieTimeId);
            stmt.setInt(2, customerId);
            stmt.setString(3, seatNumbersJson.toString()); // Ensure valid JSON is inserted

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                out.println("<h2>Order Confirmed Successfully!</h2>");
                out.println("<p>Thank you for your payment. Your seats have been reserved.</p>");
                out.println("<p>Movie Time ID: " + movieTimeId + "</p>");
                out.println("<p>Customer ID: " + customerId + "</p>");
                out.println("<p>Seats: " + seatNumbersJson.toString() + "</p>");
                out.println("<a href='Home.jsp'>Return to Home</a>");
            } else {
                out.println("<h2>Failed to confirm your order!</h2>");
            }
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h2>Error occurred while confirming the order.</h2>");
            out.println("<p>" + e.getMessage() + "</p>");
        }
    }
}
