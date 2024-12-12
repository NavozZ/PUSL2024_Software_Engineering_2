<%@ page import="java.sql.Connection" %>
<%@ page import="FC.connection.dbconnection" %>
<%
    // Display a message before testing
    out.println("<h2>Testing Database Connection...</h2>");

    // Get the connection
    Connection connection = dbconnection.getConnection();

    if (connection != null) {
        out.println("<p style='color:green;'>Database connection successful!</p>");
    } else {
        out.println("<p style='color:red;'>Failed to connect to the database.</p>");
    }
%>
