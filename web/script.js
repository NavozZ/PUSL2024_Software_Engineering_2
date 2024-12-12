const container = document.querySelector(".container");
const seats = document.querySelectorAll(".row .seat:not(.sold)");
const count = document.getElementById("count");
const total = document.getElementById("total");
const movieSelect = document.getElementById("movie");
const filmTitle = document.getElementById("film-title");
const filmDate = document.getElementById("date");
const filmLocation = document.getElementById("location");
const filmTime = document.getElementById("time");

let ticketPrice = +movieSelect.value;

// Save selected movie index and price
function setMovieData(movieIndex, moviePrice) {
  localStorage.setItem("selectedMovieIndex", movieIndex);
  localStorage.setItem("selectedMoviePrice", moviePrice);
}

// Update total and count
function updateSelectedCount() {
  const selectedSeats = document.querySelectorAll(".row .seat.selected");

  const selectedSeatsCount = selectedSeats.length;

  count.innerText = selectedSeatsCount;
  total.innerText = selectedSeatsCount * ticketPrice;

  const seatsIndex = [...selectedSeats].map(seat => [...seats].indexOf(seat));
  localStorage.setItem("selectedSeats", JSON.stringify(seatsIndex));
}

// Update header details
movieSelect.addEventListener("change", (e) => {
  const selectedOption = e.target.options[e.target.selectedIndex];
  filmTitle.textContent = selectedOption.dataset.title;
  filmDate.textContent = selectedOption.dataset.date;
  filmLocation.textContent = `Location: ${selectedOption.dataset.location}`;
  filmTime.textContent = selectedOption.dataset.time;

  ticketPrice = +selectedOption.value;
  updateSelectedCount();
});

// Seat selection event
container.addEventListener("click", (e) => {
  if (e.target.classList.contains("seat") && !e.target.classList.contains("sold")) {
    e.target.classList.toggle("selected");
    updateSelectedCount();
  }
});

// Initialize totals
updateSelectedCount();
