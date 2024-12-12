<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Future Cinemas</title>
    <link rel="stylesheet" href="css/ContactUsStyles.css">
</head>
<body>
  
  <main class="contact-container">
    <h1>Contact Us</h1>
    <p>We would love to hear from you. Please fill out the form below, and we’ll get back to you as soon as possible.</p>
    <form id="contact-form">
        <label for="name">Your Name</label>
        <input type="text" id="name" name="name" placeholder="Enter your name" required>
        
        <label for="email">Your Email</label>
        <input type="email" id="email" name="email" placeholder="Enter your email" required>
        
        <label for="message">Message</label>
        <textarea id="message" name="message" rows="5" placeholder="Write your message here" required></textarea>
        
        <div class="form-buttons">
          <button type="reset">Reset</button>
          <button type="submit">Submit</button>
        </div>
    </form>

      <div class="contact-details">
        <br></br>
          <p><strong>Address:</strong> Furure Cinema, Colombo 07</p>
          <p><strong>Phone:</strong> 0112083064 / 0112325266</p>
          <p><strong>Email:</strong> futurecinema@hotmail.com</p>
          <p><strong>Working Hours:</strong> Mon-Sun, 9:00 AM - 11:00 PM</p>
      </div>
  </main>
    <script src="js/ContactUsScripts.js"></script>
</body>
</html>