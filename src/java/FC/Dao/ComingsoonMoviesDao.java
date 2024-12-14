/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package FC.Dao;

import FC.Model.ComingsoonMovies;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ComingsoonMoviesDao {
    private static final String DB_URL = "jdbc:mysql://localhost:3308/future_cinema";
    private static final String DB_USERNAME = "root";
    private static final String DB_PASSWORD = "";

    // Fetch all coming soon movies
    public List<ComingsoonMovies> getAllComingsoonMovies() {
        List<ComingsoonMovies> movies = new ArrayList<>();
        String query = "SELECT * FROM comingsoon_movies";

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {

            while (resultSet.next()) {
                ComingsoonMovies movie = new ComingsoonMovies();
                movie.setId(resultSet.getInt("id"));
                movie.setTitle(resultSet.getString("title"));
                movie.setDescription(resultSet.getString("description"));
                movie.setImageUrl(resultSet.getString("image_url"));
                movie.setDuration(resultSet.getString("duration"));
                movie.setImdbRating(resultSet.getDouble("imdb_rating"));
                movies.add(movie);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return movies;
    }

    // Add a new coming soon movie
    public boolean addComingsoonMovie(ComingsoonMovies movie) {
        String query = "INSERT INTO comingsoon_movies (title, description, image_url, duration, imdb_rating) VALUES (?, ?, ?, ?, ?)";

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setString(1, movie.getTitle());
            preparedStatement.setString(2, movie.getDescription());
            preparedStatement.setString(3, movie.getImageUrl());
            preparedStatement.setString(4, movie.getDuration());
            preparedStatement.setDouble(5, movie.getImdbRating());

            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // Delete a movie by ID
    public boolean deleteComingsoonMovie(int id) {
        String query = "DELETE FROM comingsoon_movies WHERE id = ?";

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, id);
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // Update an existing movie
    public boolean updateComingsoonMovie(ComingsoonMovies movie) {
        String query = "UPDATE comingsoon_movies SET title = ?, description = ?, image_url = ?, duration = ?, imdb_rating = ? WHERE id = ?";

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setString(1, movie.getTitle());
            preparedStatement.setString(2, movie.getDescription());
            preparedStatement.setString(3, movie.getImageUrl());
            preparedStatement.setString(4, movie.getDuration());
            preparedStatement.setDouble(5, movie.getImdbRating());
            preparedStatement.setInt(6, movie.getId());

            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }
}

