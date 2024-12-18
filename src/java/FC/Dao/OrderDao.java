package FC.Dao;

import FC.Model.Order;
import FC.connection.dbconnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Data Access Object for Order
 */
public class OrderDao {

    private final Connection connection;

    // Constructor
    public OrderDao() {
        this.connection = dbconnection.getConnection(); // Use the provided dbconnection
    }

    // Create a new order
    public void createOrder(Order order) throws SQLException {
        String query = "INSERT INTO Orders (movie_time_id, customer_id, seat_number) VALUES (?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, order.getMovieTime());
            statement.setInt(2, order.getCustomer());
            statement.setString(3, String.join(",", order.getSeatNumbers())); // Convert List<String> to a comma-separated string
            statement.executeUpdate();
        }
    }

    // Retrieve an order by ID
    public Order getOrderById(int id) throws SQLException {
        String query = "SELECT * FROM Orders WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    int movieTime = resultSet.getInt("movie_time_id");
                    int customer = resultSet.getInt("customer_id");
                    List<String> seatNumbers = parseSeatNumbers(resultSet.getString("seat_number"));
                    return new Order(id, movieTime, customer, seatNumbers);
                }
            }
        }
        return null;
    }

    // Retrieve orders by movie time ID
    public List<Order> getOrdersByMovieTimeId(int movieTimeId) throws SQLException {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM Orders WHERE movie_time_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, movieTimeId);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    int customer = resultSet.getInt("customer_id");
                    List<String> seatNumbers = parseSeatNumbers(resultSet.getString("seat_number"));
                    orders.add(new Order(id, movieTimeId, customer, seatNumbers));
                }
            }
        }
        return orders;
    }

    // Retrieve orders by customer ID
    public List<Order> getOrdersByCustomerId(int customerId) throws SQLException {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM Orders WHERE customer_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, customerId);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    int movieTime = resultSet.getInt("movie_time_id");
                    List<String> seatNumbers = parseSeatNumbers(resultSet.getString("seat_number"));
                    orders.add(new Order(id, movieTime, customerId, seatNumbers));
                }
            }
        }
        return orders;
    }

    // Retrieve all orders
    public List<Order> getAllOrders() throws SQLException {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM Orders";
        try (PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                int movieTime = resultSet.getInt("movie_time_id");
                int customer = resultSet.getInt("customer_id");
                List<String> seatNumbers = parseSeatNumbers(resultSet.getString("seat_number"));
                orders.add(new Order(id, movieTime, customer, seatNumbers));
            }
        }
        return orders;
    }

    // Update an order
    public void updateOrder(Order order) throws SQLException {
        String query = "UPDATE Orders SET movie_time_id = ?, customer_id = ?, seat_number = ? WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, order.getMovieTime());
            statement.setInt(2, order.getCustomer());
            statement.setString(3, String.join(",", order.getSeatNumbers())); // Convert List<String> to a comma-separated string
            statement.setInt(4, order.getId());
            statement.executeUpdate();
        }
    }

    // Delete an order
    public void deleteOrder(int id) throws SQLException {
        String query = "DELETE FROM Orders WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        }
    }

    // Helper method to parse seat numbers from a comma-separated string into a list
    private List<String> parseSeatNumbers(String seatNumbersString) {
        if (seatNumbersString == null || seatNumbersString.isEmpty()) {
            return new ArrayList<>();
        }
        return Arrays.asList(seatNumbersString.split(","));
    }
}
