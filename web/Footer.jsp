<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Footer</title>
        <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Footer.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    </head>
    <body>
        <footer id="footer">
            <div class="footer-container">
                <div class="footer-row">
                    <!-- Logo and About Section -->
                    <div class="footer-col">
                        <a href="Home.jsp">
                            <img src="<%= request.getContextPath() %>/src/logo.png" alt="Logo" class="logo-footer">
                        </a>
                        <div class="footer-about">
                            <p>Future Cinema is your ultimate destination for exploring the latest blockbusters, timeless classics, and hidden gems. 
                                Experience the magic of cinema with personalized recommendations, detailed reviews, and exclusive trailers.</p>
                        </div>
                    </div>
                    <!-- Useful Links Section -->
                    <div class="footer-col">
                        <div class="useful-link">
                            <h2>Useful Links</h2>
                            <div class="use-links">
                                <ul>
                                    <li><a href="Home.jsp"><i class="fas fa-angle-right"></i> Home</a></li>
                                    <li><a href="AboutUs.jsp"><i class="fas fa-angle-right"></i> About Us</a></li>
                                    <li><a href="Movies.jsp"><i class="fas fa-angle-right"></i> Movies</a></li>
                                    <li><a href="Location.jsp"><i class="fas fa-angle-right"></i> Locations</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="footer-col">
                        <div class="other-links">
                            <span><br></span>
                            <div class="other-icons">
                                <ul>
                                    <li><a href="ContactUs.jsp"><i class="fas fa-angle-right"></i> Contact Us</a></li>
                                    <li><a href="Disclaimer.jsp"><i class="fas fa-angle-right"></i> Disclaimer</a></li>
                                    <li><a href="T&C.jsp"><i class="fas fa-angle-right"></i> Terms And Conditions</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- Address and Subscribe Section -->
                    <div class="footer-col">
                        <div class="address">
                            <h2>Address</h2>
                            <ul>
                                <li><i class="fas fa-map-marker-alt"></i> xxxx xxxxx, xxxxx xxxx, xxx</li>
                                <li><a href="#"><i class="fas fa-phone"></i> +94 909045001</a></li>
                                <li><a href="Feedback.jsp"><i class="fas fa-envelope"></i> futurecinema@hotmail.com</a></li>
                            </ul>
                        </div>
                        <div class="subscribe">
                            <h2>Subscribe to Our Newsletter</h2>
                            <form action="#" method="POST">
                                <input type="email" placeholder="Enter your email" required>
                                <button type="submit">Subscribe</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <section id="copy-right">
            <div class="copy-right-sec">
                <p><i class="fas fa-copyright"></i> 2024 Powered By <a href="#">Future Cinema</a></p>
            </div>
        </section>
    </body>
</html>
