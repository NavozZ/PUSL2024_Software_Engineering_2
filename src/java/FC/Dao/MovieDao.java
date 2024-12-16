package FC.Dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import FC.connection.dbconnection; // Assuming this is your custom database connection utility
import FC.Model.Movie;

public class MovieDao {
    // SQL Queries
    private static final String INSERT_MOVIE_SQL = 
        "INSERT INTO Movie (title, genre, language, description, trailerLink, imageUrl, duration, rating, director, producer, writer, musicBy, CS_img, carousel_img) " +
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String SELECT_MOVIE_BY_ID = "SELECT * FROM movie WHERE id = ?";
    private static final String SELECT_ALL_MOVIES = "SELECT * FROM Movie";
    private static final String UPDATE_MOVIE_SQL = 
        "UPDATE Movie SET title = ?, genre = ?, language = ?, description = ?, trailerLink = ?, imageUrl = ?, duration = ?, rating = ?, director = ?, producer = ?, writer = ?, musicBy = ?, CS_img = ?, carousel_img = ? WHERE id = ?";
    private static final String DELETE_MOVIE_SQL = "DELETE FROM Movie WHERE id = ?";
    private static final String SELECT_LATEST_MOVIES = "SELECT * FROM movie WHERE Status = 'NS' ORDER BY id DESC LIMIT 8";
    private static final String SELECT_CAROUSEL_IMAGE = "SELECT * FROM movie WHERE carousel_img IS NOT NULL ";
    private static final String SELECT_CS_MOVIES = "SELECT * FROM movie WHERE Status = 'CS';";

    // Create a new movie
    public void insertMovie(Movie movie) throws SQLException {
        try (Connection connection = dbconnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_MOVIE_SQL)) {
            preparedStatement.setString(1, movie.getTitle());
            preparedStatement.setString(2, movie.getGenre());
            preparedStatement.setString(3, movie.getLanguage());
            preparedStatement.setString(4, movie.getDescription());
            preparedStatement.setString(5, movie.getTrailerLink());
            preparedStatement.setString(6, movie.getImageUrl());
            preparedStatement.setInt(7, movie.getDuration());
            preparedStatement.setDouble(8, movie.getRating());
            preparedStatement.setString(9, movie.getDirector());
            preparedStatement.setString(10, movie.getProducer());
            preparedStatement.setString(11, movie.getWriter());
            preparedStatement.setString(12, movie.getMusicBy());
           
            preparedStatement.setString(14, movie.getCarouselImg());
            preparedStatement.executeUpdate();
        }
    }

   // Read a movie by ID
public Movie selectMovieById(int id) throws SQLException {
    Movie movie = null;
    try (Connection connection = dbconnection.getConnection();
         PreparedStatement preparedStatement = connection.prepareStatement(SELECT_MOVIE_BY_ID)) {
        preparedStatement.setInt(1, id);
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.next()) {
            movie = new Movie(
                    id, // Movie ID
                    resultSet.getString("title"),
                    resultSet.getString("genre"),
                    resultSet.getString("language"),
                    resultSet.getString("description"),
                    null, // Assuming cast is null (no data in Movie table for this)
                    resultSet.getString("trailerLink"),
                    resultSet.getString("imageUrl"),
                    resultSet.getInt("duration"),
                    resultSet.getDouble("rating"),
                    resultSet.getString("director"),
                    resultSet.getString("producer"),
                    resultSet.getString("writer"),
                    resultSet.getString("musicBy"),
                    resultSet.getString("carousel_img"),
                    resultSet.getString("imagetype2")
            );
        }
    }
    return movie;
}


    // Read all movies
    
public List<Movie> selectAllMovies() throws SQLException {
    List<Movie> movies = new ArrayList<>();
    try (Connection connection = dbconnection.getConnection();
         PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_MOVIES);
         ResultSet resultSet = preparedStatement.executeQuery()) {
        while (resultSet.next()) {
            Movie movie = new Movie(
                    resultSet.getInt("id"), // Movie ID
                    resultSet.getString("title"),
                    resultSet.getString("genre"),
                    resultSet.getString("language"),
                    resultSet.getString("description"),
                    null, // Assuming cast is null
                    resultSet.getString("trailerLink"),
                    resultSet.getString("imageUrl"),
                    resultSet.getInt("duration"),
                    resultSet.getDouble("rating"),
                    resultSet.getString("director"),
                    resultSet.getString("producer"),
                    resultSet.getString("writer"),
                    resultSet.getString("musicBy"),
                    
                    resultSet.getString("carousel_img")
            );
            movies.add(movie);
        }
    }
    return movies;
}


    // Update a movie
    public boolean updateMovie(Movie movie, int id) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = dbconnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_MOVIE_SQL)) {
            preparedStatement.setString(1, movie.getTitle());
            preparedStatement.setString(2, movie.getGenre());
            preparedStatement.setString(3, movie.getLanguage());
            preparedStatement.setString(4, movie.getDescription());
            preparedStatement.setString(5, movie.getTrailerLink());
            preparedStatement.setString(6, movie.getImageUrl());
            preparedStatement.setInt(7, movie.getDuration());
            preparedStatement.setDouble(8, movie.getRating());
            preparedStatement.setString(9, movie.getDirector());
            preparedStatement.setString(10, movie.getProducer());
            preparedStatement.setString(11, movie.getWriter());
            preparedStatement.setString(12, movie.getMusicBy());
            
            preparedStatement.setString(14, movie.getCarouselImg());
            preparedStatement.setInt(15, id);
            rowUpdated = preparedStatement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    // Delete a movie
    public boolean deleteMovie(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = dbconnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_MOVIE_SQL)) {
            preparedStatement.setInt(1, id);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

   // Method to fetch the latest 8 movies
public List<Movie> getLatestMovies() throws SQLException {
    List<Movie> latestMovies = new ArrayList<>();
    try (Connection connection = dbconnection.getConnection();
         PreparedStatement preparedStatement = connection.prepareStatement(SELECT_LATEST_MOVIES);
         ResultSet resultSet = preparedStatement.executeQuery()) {
        while (resultSet.next()) {
            Movie movie = new Movie(
                    resultSet.getInt("id"), // Movie ID
                    resultSet.getString("title"),
                    resultSet.getString("genre"),
                    resultSet.getString("language"),
                    resultSet.getString("description"),
                    null, // Assuming cast is null (no data in Movie table for cast)
                    resultSet.getString("trailerLink"),
                    resultSet.getString("imageUrl"),
                    resultSet.getInt("duration"),
                    resultSet.getDouble("rating"),
                    resultSet.getString("director"),
                    resultSet.getString("producer"),
                    resultSet.getString("writer"),
                    resultSet.getString("musicBy"),
                    
                    resultSet.getString("carousel_img"),
                    resultSet.getString("imagetype2")
            );
            latestMovies.add(movie);
        }
    }
    return latestMovies;
}
  // Method to fetch the latest carousel image
    public List<Movie> getCarouselImage() throws SQLException {
        List<Movie> carouselImage = new ArrayList<>();
        try (Connection connection = dbconnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CAROUSEL_IMAGE);
             ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()){
                Movie movie = new Movie(
                    resultSet.getInt("id"),
                    resultSet.getString("title"),
                    resultSet.getInt("duration"),
                    resultSet.getDouble("rating"),
                    resultSet.getString("carousel_img")
                );
                carouselImage.add(movie);
            }
        }
        return carouselImage;
    }
    
    public List<Movie> getComingsoonMovies () throws  SQLException {
        List<Movie> ComingsoonMovies = new ArrayList<>();
        try (Connection connection = dbconnection.getConnection();
         PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CS_MOVIES);
         ResultSet resultSet = preparedStatement.executeQuery()) {
        while (resultSet.next()) {
            Movie movie = new Movie(
                    resultSet.getInt("id"), // Movie ID
                    resultSet.getString("imageUrl")
            );
            ComingsoonMovies.add(movie);
        }
    }
    return ComingsoonMovies;

    }
}
