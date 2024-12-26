<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Future Cinema</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #1E1E1E;
            color: #ffffff;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .container {
            max-width: 900px;
            margin: 50px auto;
            background: #1E1E1E;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        h1 {
            text-align: center;
            color: #E50914;
        }

        p {
            line-height: 1.6;
            margin-bottom: 20px;
        }

        img {
            display: block;
            max-width: 100%;
            height: auto;
            margin: 20px auto;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        footer {
            text-align: center;
            
            font-size: 0.9em;
            color: #777;
            margin-top: auto;
        }
    </style>
</head>
<body>
    <%@ include file="NavBar.jsp" %>
    <div class="container">
        <h1>Welcome to Future Cinema!</h1>

        <p>At Future Cinema, we are dedicated to revolutionizing the way you experience movies. Our mission is to combine cutting-edge technology with the magic of storytelling to create an unforgettable cinematic journey for every visitor.</p>

        <p>Whether you?re a fan of blockbuster hits, indie gems, or timeless classics, Future Cinema offers a curated selection of films that cater to every taste. Our user-friendly platform ensures seamless browsing, ticket booking, and personalized recommendations to make your movie-watching experience effortless and enjoyable.</p>
        <img src="https://via.placeholder.com/800x400" alt="Future Cinema Experience" />

        <p>Join us as we redefine entertainment for the future. Sit back, relax, and let Future Cinema take you on an adventure beyond the screen.</p>

         
    </div>
    <footer>
    <%@ include file="Footer.jsp" %>
</footer>

</body>

</html>
