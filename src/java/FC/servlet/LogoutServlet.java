package FC.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutServlet
 */
@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve the current session
        HttpSession session = request.getSession(false); // Avoid creating a new session
        if (session != null) {
            session.invalidate(); // Invalidate the session
        }

        // Redirect the user to the home or login page
        response.sendRedirect("Home.jsp"); // Replace with "Login.jsp" if desired
    }
}
