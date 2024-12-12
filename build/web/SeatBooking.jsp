
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="CSS/SBstyle.css" />
    <title>Seat Booking page</title>
  </head>
  <body>
      <header>
      <h4 id="page-title">SEAT SELECT</h4>
      <h1 id="film-title">Venom</h1>
      <p id="film-details">
        <span id="date">Tue, 26 Nov</span>, <span id="location">Location: Kiribathgoda</span>
      </p>
      <hr>
      <p id="showtime">SHOWTIME: <span id="time">05:00 PM TO 8.00PM</span></p>
      <hr>
    </header>

    <div class="movie-container">
      <label> Select a movie:</label>
      <label>Select a movie:</label>
    <select id="movie">
      <option value="2000" data-title="Venom-Last Dance" data-date="Tue, 26 Nov" data-location="Colombo" data-time="05:00 PM">Venom-Last Dance (RS.2000)</option>
      <option value="1000" data-title="Wisal Adare Sanchitha and Dinuri" data-date="Wed, 27 Nov" data-location="Makola" data-time="07:30 PM">Suriya Arana(RS.1000)</option>
      <option value="2500" data-title="Nai Kaida Rose pan" data-date="Thu, 28 Nov" data-location="NSBM" data-time="03:00 PM">Nai Kaida Rose pan (RS.2500)</option>
      <option value="2600" data-title="Mathale Tikiri Katha Wasthuwa" data-date="Fri, 29 Nov" data-location="Mathale" data-time="09:00 PM">Ali patiyo oyai mamai (RS.2600 )</option>
    </select>
    </div>

    <ul class="showcase">
      <li>
        <div class="seat"></div>
        <small>AVAILABLE</small>
      </li>
      <li>
        <div class="seat selected"></div>
        <small>SELECTED</small>
      </li>
      <li>
        <div class="seat sold"></div>
        <small>UNAVAILABLE</small>
      </li>
    </ul>
    <div class="container">
      <div class="screen">
      </div>
      
      <p class="screen-text">SCREEN THIS WAY</p>

      <div class="row">
        <span class="row-number">A</span>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
      </div>

      <div class="row">
        <span class="row-number">B</span>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
      </div>

      <div class="row">
        <span class="row-number">C</span>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
      </div>

      <div class="row">
        <span class="row-number">D</span>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat sold"></div>
        <div class="seat"></div>
        <div class="seat sold"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
      </div>

      <div class="row">
        <span class="row-number-f">E</span>
        <div class="seat"></div>
        <div class="seat sold"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat soldt"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat sold"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
      </div>

      <div class="row">
        <span class="row-number-f">F</span>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat soldt"></div>
        <div class="seat"></div>
        <div class="seat sold"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
      </div>

      <div class="row">
        <span class="row-number">G</span>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat sold"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat sold"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
      </div>

      <div class="row">
        <span class="row-number">H</span>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat sold"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat sold"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
      </div> 
      <span><br></span>  
      <div class="row">
        <span class="row-number-i">I</span>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat sold"></div>
        <div class="seat sold"></div>
        <div class="seat sold"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
        <div class="seat"></div>
      </div>
    </div>

    

    <p class="text">
      You have selected <span id="count">0</span> seat for a price of RS.<span
        id="total"
        >0</span
      >
    </p>
   
    <p class="payment">Pay for the Tickets: <button class="pay-btn">Pay</button></p>
   
    <script src="SBscript.js"></script>
    
  </body>
</html>
