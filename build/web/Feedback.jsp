<%-- 
    Document   : Feedback
    Created on : Dec 20, 2024, 10:45:03 PM
    Author     : navod
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Feedback</title>
        <style>
            body {
    font-family: Arial, sans-serif;
    background-color: #111;
    color: #fff;
    line-height: 1.6;
} 
        
  .login-container {
    
   
    background-position: center;
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
    height: 70vh; /* Increased height */
}

.login-box {
    background: linear-gradient(135deg, #0b0b0b, #202020);
    padding: 50px 40px; /* Increased padding */
    border-radius: 15px;
    text-align: center;
   
    width: 600px; /* Increased width */
    max-width: 90%; /* Ensures responsiveness on smaller screens */
}

.login-box h2 {
    color: #D81F26;
    font-size: 30px; /* Increased font size */
    margin-bottom: 30px; /* Increased margin */
}

form input, form textarea {
    width: 100%;
    padding: 15px; /* Increased padding */
    margin: 15px 0; /* Increased margin */
    background: rgba(255, 255, 255, 0.1);
    border: 2px solid #D81F26;
    border-radius: 8px;
    color: white;
    font-size: 16px; /* Increased font size */
}

form button {
    width: 100%;
    padding: 15px; /* Increased padding */
    background-color: #D81F26;
    border: none;
    border-radius: 8px;
    color: black;
    font-weight: bold;
    font-size: 16px; /* Increased font size */
}

.create-account {
    color: #D81F26;
    font-size: 16px; /* Increased font size */
    text-decoration: none;
    display: block;
    margin-top: 30px; /* Increased margin */
}
        </style>
    </head>
    <body>
        <div class="login-container">
        <div class="login-box">
            <h2>Customer Feedback</h2>
            <form method="post" action="feedback.jsp">
                <input type="text" placeholder="Name" name="name" value=""required>
                <input type="email" placeholder="Email" name="email" value=""required>
                <textarea placeholder="Write your feedback here..." name="feedback" required></textarea>
                <button type="submit" name="submit">Submit Feedback</button>
            </form>
            <a href="homepage.jsp" class="create-account">Back to Home</a>
        </div>
    </div>
         <%@ include file="Footer.jsp" %>
    </body>
</html>
