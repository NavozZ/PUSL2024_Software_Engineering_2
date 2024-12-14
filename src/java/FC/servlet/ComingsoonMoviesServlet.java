package FC.Servlet;

import FC.Dao.ComingsoonMoviesDao;
import FC.Model.ComingsoonMovies;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/comingsoonMovies")
public class ComingsoonMoviesServlet extends HttpServlet {
    private ComingsoonMoviesDao comingsoonMoviesDao;

    @Override
    public void init() throws ServletException {
        comingsoonMoviesDao = new ComingsoonMoviesDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if (action == null || action.equals("list")) {
                listMovies(request, response);
            } else if (action.equals("delete")) {
                deleteMovie(request, response);
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if (action != null && action.equals("add")) {
                addMovie(request, response);
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private void listMovies(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ComingsoonMovies> movies = comingsoonMoviesDao.getAllComingsoonMovies();
        request.setAttribute("comingsoonMovies", movies);
        request.getRequestDispatcher("Home.jsp").forward(request, response);
    }

    private void addMovie(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String imageUrl = request.getParameter("image_url");
        String duration = request.getParameter("duration");
        double imdbRating = Double.parseDouble(request.getParameter("imdb_rating"));

        ComingsoonMovies movie = new ComingsoonMovies(0, title, description, imageUrl, duration, imdbRating);
        comingsoonMoviesDao.addComingsoonMovie(movie);

        response.sendRedirect("comingsoonMovies?action=list");
    }

    private void deleteMovie(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        comingsoonMoviesDao.deleteComingsoonMovie(id);

        response.sendRedirect("comingsoonMovies?action=list");
    }
}
