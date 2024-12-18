<!DOCTYPE html>
<html>
    <head>
        <title>Log In</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/Login.css">
    </head>
    <body>
        <%@ include file="NavBar.jsp" %>
        <div class="container">
            <!-- Login Title -->
            <h1 class="login-title">Enter your login details</h1>
            
            <!-- Display Error Message -->
            <c:if test="${not empty errorMessage}">
                <div class="error-message" style="color: red; margin-bottom: 10px;">
                    ${errorMessage}
                </div>
            </c:if>

            <!-- Login Form -->
            <form action="LoginServlet" method="POST">
                <div class="input-container">
                    <input type="text" name="email" class="input-box" placeholder="Email Address" required>
                </div>
                <div class="input-container">
                    <input type="password" name="password" class="input-box" placeholder="Password" required>
                </div>
                
                <!-- Forgot Password -->
                <div class="forgot-password-container">
                    <a href="#" class="forgot-password">Forgot Password?</a>
                </div>

                <!-- Login Button -->
                <div>
                    <button type="submit" class="login-button">LOGIN</button>
                </div>
            </form>
            
            <!-- Create Account -->
            <div class="create-account">
                Don't you have an account yet? 
                <span class="create-new">
                    <a href="Signup.jsp" style="text-decoration: none; color: inherit;">CREATE NEW</a>
                </span>
            </div>
        </div>
                
    </body>
</html>
