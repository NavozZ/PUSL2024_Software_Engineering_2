package FC.Dao;

import FC.Model.MovieTime;
import FC.connection.dbconnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MovieTimeDao {
    private static final String SELECT_MOVIETIME_BY_ID = "SELECT * FROM MovieTime WHERE id = ?";
    private static final String INSERT_MOVIETIME = "INSERT INTO MovieTime (movie_id, location_id, time, date) VALUES (?, ?, ?, ?)";
    private static final String SELECT_ALL_MOVIETIMES = "SELECT * FROM MovieTime";
    private static final String SELECT_MOVIETIMES_BY_MOVIE_ID = "SELECT * FROM MovieTime WHERE movie_id = ?";
    private static final String SELECT_MOVIETIMES_BY_MOVIE_ID_AND_DATE = "SELECT * FROM MovieTime WHERE movie_id = ? AND date = ?";

    // Method to insert a new MovieTime into the database
    public boolean insertMovieTime(MovieTime movieTime) {
        try (Connection connection = dbconnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(INSERT_MOVIETIME)) {

            statement.setInt(1, movieTime.getMovieId());
            statement.setInt(2, movieTime.getLocationId());
            statement.setString(3, movieTime.getTime());
            statement.setDate(4, Date.valueOf(movieTime.getDate()));

            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Method to retrieve a MovieTime by its ID
    public MovieTime selectMovieTimeById(int id) {
        try (Connection connection = dbconnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_MOVIETIME_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                return new MovieTime(
                        resultSet.getInt("id"),
                        resultSet.getInt("movie_id"),
                        resultSet.getInt("location_id"),
                        resultSet.getString("time"),
                        resultSet.getDate("date").toLocalDate()
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Method to retrieve all MovieTime records
    public List<MovieTime> selectAllMovieTimes() {
        List<MovieTime> movieTimes = new ArrayList<>();
        try (Connection connection = dbconnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_MOVIETIMES);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                MovieTime movieTime = new MovieTime(
                        resultSet.getInt("id"),
                        resultSet.getInt("movie_id"),
                        resultSet.getInt("location_id"),
                        resultSet.getString("time"),
                        resultSet.getDate("date").toLocalDate()
                );
                movieTimes.add(movieTime);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return movieTimes;
    }

    // Method to retrieve MovieTimes by Movie ID
    public List<MovieTime> selectMovieTimesByMovieId(int movieId) {
        List<MovieTime> movieTimes = new ArrayList<>();
        try (Connection connection = dbconnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_MOVIETIMES_BY_MOVIE_ID)) {
            preparedStatement.setInt(1, movieId);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                MovieTime movieTime = new MovieTime(
                        resultSet.getInt("id"),
                        resultSet.getInt("movie_id"),
                        resultSet.getInt("location_id"),
                        resultSet.getString("time"),
                        resultSet.getDate("date").toLocalDate()
                );
                movieTimes.add(movieTime);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return movieTimes;
    }

    // Method to retrieve MovieTimes by Movie ID and Date
    public List<MovieTime> selectMovieTimesByMovieIdAndDate(int movieId, java.time.LocalDate date) {
        List<MovieTime> movieTimes = new ArrayList<>();
        try (Connection connection = dbconnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_MOVIETIMES_BY_MOVIE_ID_AND_DATE)) {
            preparedStatement.setInt(1, movieId);
            preparedStatement.setDate(2, Date.valueOf(date));
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                MovieTime movieTime = new MovieTime(
                        resultSet.getInt("id"),
                        resultSet.getInt("movie_id"),
                        resultSet.getInt("location_id"),
                        resultSet.getString("time"),
                        resultSet.getDate("date").toLocalDate()
                );
                movieTimes.add(movieTime);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return movieTimes;
    }

    // Update and Delete methods can be implemented similarly
}
