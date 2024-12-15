package FC.Servlet;

import FC.Dao.LocationDao;
import FC.Model.Location;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/locations") // URL mapping for the servlet
public class LocationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LocationDao locationDao = new LocationDao();

        try {
            // Fetch all locations using the DAO
            List<Location> locations = locationDao.selectAllLocations();

            // Set the list of locations as a request attribute
            request.setAttribute("locations", locations);

            // Forward the request to the JSP page
            request.getRequestDispatcher("Location.jsp").forward(request, response);
        } catch (SQLException e) {
            // Handle database-related errors
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error fetching cinema locations: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response); // Forward to an error page
        }
    }
}
