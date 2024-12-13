/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package FC.servlet;

import FC.Dao.MovieDao;
import FC.Model.Movie;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/latestMovies")
public class LatestMovieServlet extends HttpServlet {
    private MovieDao movieDao;

    public void init() {
        movieDao = new MovieDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Movie> latestMovies = movieDao.getLatestMovies();
            request.setAttribute("latestMovies", latestMovies);
            RequestDispatcher dispatcher = request.getRequestDispatcher("latestMovies.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

