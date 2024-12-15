/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package FC.Dao;

import FC.Model.Location;
import FC.connection.dbconnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LocationDao {
    // SQL query to fetch all locations
    private static final String SELECT_ALL_LOCATIONS = "SELECT * FROM locations";

    // Method to fetch all locations from the database
    public List<Location> selectAllLocations() throws SQLException {
        List<Location> locations = new ArrayList<>();
        try (Connection connection = dbconnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_LOCATIONS);
             ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                // Creating a Location object based on the result set
                Location location = new Location(
                        resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getString("location"),
                        resultSet.getString("image_url")
                );
                locations.add(location);
            }
        }
        return locations;
    }
}

