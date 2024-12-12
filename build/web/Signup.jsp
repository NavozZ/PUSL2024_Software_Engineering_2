<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <head>
        <title>SIGN UP</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="CSS\Signup.css">
    </head>
    <body>
         <div class="container">
        <div class="heading">Enter your details below to register</div>

        <div class="input-container">
            <label class="label">First Name</label>
            <input type="text" class="input-field" placeholder="">
        </div>

        <div class="input-container">
            <label class="label">Last Name</label>
            <input type="text" class="input-field" placeholder="">
        </div>

        <div class="input-container">
            <label class="label">Email Address</label>
            <input type="email" class="input-field" placeholder="">
        </div>

        <div class="gender-container">
            <span class="label">Gender:</span>
            <div class="gender-option">
                <input type="radio" name="gender" id="male">
                <label for="male">Male</label>
            </div>
            <div class="gender-option">
                <input type="radio" name="gender" id="female">
                <label for="female">Female</label>
            </div>
        </div>

        <div class="input-container">
            <label class="label">Nic Number</label>
            <input type="text" class="input-field" placeholder="">
        </div>

        <div class="input-container">
            <label class="label">Address</label>
            <input type="text" class="input-field" placeholder="">
        </div>

        <div class="input-container">
            <label class="label">Mobile Number</label>
            <input type="tel" class="input-field" placeholder="">
        </div>

        <div class="input-container">
            <label class="label">Password</label>
            <input type="password" class="input-field" placeholder="">
        </div>

        <div class="input-container">
            <label class="label">Confirm Password</label>
            <input type="password" class="input-field" placeholder="">
        </div>

        <button class="create-button">CREATE</button>

        <div class="footer">
            <span>Existing User?</span>
            <a href="#">LOGIN</a>
        </div>
    </div>
    </body>
</html>
