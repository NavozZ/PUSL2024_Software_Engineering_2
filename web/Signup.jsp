<!DOCTYPE html>
<html>
    <head>
        <title>SIGN UP</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/Signup.css">
    </head>
    <body>
        <div class="container">
            <div class="heading">Enter your details below to register</div>

            <!-- Form to collect user data -->
            <form action="SignUpServlet" method="POST">
                <div class="input-container">
                    <label class="label">First Name</label>
                    <input type="text" name="firstName" class="input-field" required>
                </div>

                <div class="input-container">
                    <label class="label">Last Name</label>
                    <input type="text" name="lastName" class="input-field" required>
                </div>

                <div class="input-container">
                    <label class="label">Email Address</label>
                    <input type="email" name="email" class="input-field" required>
                </div>

                <div class="gender-container">
                    <span class="label">Gender:</span>
                    <div class="gender-option">
                        <input type="radio" name="gender" id="male" value="Male" required>
                        <label for="male">Male</label>
                    </div>
                    <div class="gender-option">
                        <input type="radio" name="gender" id="female" value="Female">
                        <label for="female">Female</label>
                    </div>
                </div>

                <div class="input-container">
                    <label class="label">NIC Number</label>
                    <input type="text" name="nicNumber" class="input-field" required>
                </div>

                <div class="input-container">
                    <label class="label">Address</label>
                    <input type="text" name="address" class="input-field" required>
                </div>

                <div class="input-container">
                    <label class="label">Mobile Number</label>
                    <input type="tel" name="phone" class="input-field" required>
                </div>

                <div class="input-container">
                    <label class="label">Password</label>
                    <input type="password" name="password" class="input-field" required>
                </div>

                <div class="input-container">
                    <label class="label">Confirm Password</label>
                    <input type="password" name="confirmPassword" class="input-field" required>
                </div>

                <button type="submit" class="create-button">CREATE</button>
            </form>

            <div class="footer">
                <span>Existing User?</span>
                <a href="login.jsp">LOGIN</a>
            </div>
        </div>
    </body>
</html>
