package FC.Dao;

import FC.Model.User;
import FC.connection.dbconnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Data Access Object for User operations
 */
public class UserDao {

    // Insert a new user into the database
    public boolean saveUser(User user) {
        boolean isSaved = false;
        String sql = "INSERT INTO users (first_name, last_name, email, gender, nic_number, address, phone, password, user_role, created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = dbconnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, user.getFirstName());
            stmt.setString(2, user.getLastName());
            stmt.setString(3, user.getEmail());
            stmt.setString(4, user.getGender());
            stmt.setString(5, user.getNicNumber());
            stmt.setString(6, user.getAddress());
            stmt.setString(7, user.getPhone());
            stmt.setString(8, user.getPassword());
            stmt.setString(9, user.getUserRole());
            stmt.setString(10, user.getCreatedAt());
            stmt.setString(11, user.getUpdatedAt());

            int rowsInserted = stmt.executeUpdate();
            isSaved = rowsInserted > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return isSaved;
    }

    // Retrieve user by email
    public User getUserByEmail(String email) {
        User user = null;
        String sql = "SELECT * FROM users WHERE email = ?";

        try (Connection conn = dbconnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                user = new User(
                        rs.getInt("id"),
                        rs.getString("first_name"),
                        rs.getString("last_name"),
                        rs.getString("email"),
                        rs.getString("gender"),
                        rs.getString("nic_number"),
                        rs.getString("password"),
                        rs.getString("phone"),
                        rs.getString("address"),
                        rs.getString("user_role"),
                        rs.getString("created_at"),
                        rs.getString("updated_at")
                );
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }

    // Retrieve all users
    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM users";

        try (Connection conn = dbconnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                User user = new User(
                        rs.getInt("id"),
                        rs.getString("first_name"),
                        rs.getString("last_name"),
                        rs.getString("email"),
                        rs.getString("gender"),
                        rs.getString("nic_number"),
                        rs.getString("password"),
                        rs.getString("phone"),
                        rs.getString("address"),
                        rs.getString("user_role"),
                        rs.getString("created_at"),
                        rs.getString("updated_at")
                );
                users.add(user);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return users;
    }

    // Delete user by ID
    public boolean deleteUserById(int userId) {
        boolean isDeleted = false;
        String sql = "DELETE FROM users WHERE id = ?";

        try (Connection conn = dbconnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            int rowsDeleted = stmt.executeUpdate();
            isDeleted = rowsDeleted > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return isDeleted;
    }

    // Update user details
    public boolean updateUser(User user) {
        boolean isUpdated = false;
        String sql = "UPDATE users SET first_name = ?, last_name = ?, email = ?, gender = ?, nic_number = ?, address = ?, phone = ?, user_role = ?, updated_at = ? WHERE id = ?";

        try (Connection conn = dbconnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, user.getFirstName());
            stmt.setString(2, user.getLastName());
            stmt.setString(3, user.getEmail());
            stmt.setString(4, user.getGender());
            stmt.setString(5, user.getNicNumber());
            stmt.setString(6, user.getAddress());
            stmt.setString(7, user.getPhone());
            stmt.setString(8, user.getUserRole());
            stmt.setString(9, user.getUpdatedAt());
            stmt.setInt(10, user.getUserId());

            int rowsUpdated = stmt.executeUpdate();
            isUpdated = rowsUpdated > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return isUpdated;
    }
}
