<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="FC.Model.Location" %>
<%@ page import="FC.Dao.LocationDao" %>

<%
    List<Location> getAllLocations = null;
    try {
        LocationDao locationDao = new LocationDao();
        getAllLocations = locationDao.selectAllLocations();
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>Error: " + e.getMessage() + "</p>");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cinema Halls</title>
    <link rel="stylesheet" href="css/Location.css">
</head>
<body>
    <%@ include file="NavBar.jsp" %>
    <div class="main">
        <div class="section-name">
            <p class="section-name-text">Our Cinema Halls</p>
        </div>
        <div class="cinema-grid">
            <% if (getAllLocations != null && !getAllLocations.isEmpty()) { %>
                <% for (Location location : getAllLocations) { %>
                    <div class="cinema-card">
                        <img src="<%= location.getImageUrl() %>" alt="<%= location.getName() %>">
                        <div class="cinema-info">
                            <h4><%= location.getName() %></h4>
                            <p><%= location.getAddress() %></p>
                        </div>
                    </div>
                <% } %>
            <% } else { %>
                <p>No cinema halls available.</p>
            <% } %>
        </div>
    </div>
</body>
</html>
