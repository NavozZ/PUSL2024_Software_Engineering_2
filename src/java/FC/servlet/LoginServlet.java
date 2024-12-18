package FC.servlet;

import FC.Dao.UserDao;
import FC.Model.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Retrieve login form parameters
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Validate input
        if (email == null || email.isEmpty() || password == null || password.isEmpty()) {
            request.setAttribute("errorMessage", "Email and Password cannot be empty.");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
            return;
        }

        // Authenticate user
        UserDao userDao = new UserDao();
        User user = userDao.getUserByEmailAndPassword(email, password); // Adjust password check with hashing in production

        if (user != null) {
            // User authenticated successfully
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            // Redirect to user dashboard or home page
            response.sendRedirect("Home.jsp");
        } else {
            // Authentication failed
            request.setAttribute("errorMessage", "Invalid email or password. Please try again.");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("Login.jsp"); // Redirect to login page if accessed via GET
    }
}
