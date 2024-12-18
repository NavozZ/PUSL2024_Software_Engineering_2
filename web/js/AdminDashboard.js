// Data arrays to hold movies and theaters
let movies = [
    { id: 1, title: "Movie 1", genre: "Genre 1", language: "English", duration: 120 },
    { id: 2, title: "Movie 2", genre: "Genre 2", language: "Spanish", duration: 110 }
];

let theaters = [
    { id: 1, name: "Theater 1", location: "Location 1", seats: 200, facilities: "3D" },
    { id: 2, name: "Theater 2", location: "Location 2", seats: 150, facilities: "IMAX" }
];

// Helper to render lists
function renderList(dataArray, listElementId, type) {
    const listElement = document.getElementById(listElementId);
    listElement.innerHTML = ""; // Clear existing items
    dataArray.forEach(item => {
        const li = document.createElement("li");
        li.setAttribute("data-id", item.id);

        if (type === "movies") {
            li.innerHTML = `
                <span>${item.title} - ${item.genre}</span>
                <button class="edit-${type}" onclick="editMovie(${item.id})">Edit</button>
                <button class="delete-${type}" onclick="deleteMovie(${item.id})">Delete</button>
            `;
        } else if (type === "theaters") {
            li.innerHTML = `
                <span>${item.name} - ${item.location}</span>
                <button class="edit-${type}" onclick="editTheater(${item.id})">Edit</button>
                <button class="delete-${type}" onclick="deleteTheater(${item.id})">Delete</button>
            `;
        }
        listElement.appendChild(li);
    });
}

// Initial rendering
renderList(movies, "movie-list", "movies");
renderList(theaters, "theater-list", "theaters");

// Add Movie
document.getElementById("add-movie-form").addEventListener("submit", function (e) {
    e.preventDefault();
    const newMovie = {
        id: Date.now(),
        title: document.getElementById("movie-title").value,
        genre: document.getElementById("movie-genre").value,
        language: document.getElementById("movie-language").value,
        duration: document.getElementById("movie-duration").value
    };
    movies.push(newMovie);
    renderList(movies, "movie-list", "movies");
    this.reset();
});

// Edit Movie
function editMovie(id) {
    const movie = movies.find(m => m.id === id);
    if (movie) {
        document.getElementById("edit-movie-title").value = movie.title;
        document.getElementById("edit-movie-genre").value = movie.genre;
        document.getElementById("edit-movie-language").value = movie.language;
        document.getElementById("edit-movie-duration").value = movie.duration;

        document.getElementById("edit-movie-form").onsubmit = function (e) {
            e.preventDefault();
            movie.title = document.getElementById("edit-movie-title").value;
            movie.genre = document.getElementById("edit-movie-genre").value;
            movie.language = document.getElementById("edit-movie-language").value;
            movie.duration = document.getElementById("edit-movie-duration").value;
            renderList(movies, "movie-list", "movies");
            document.getElementById("edit-movie-section").classList.remove("active");
        };

        document.getElementById("edit-movie-section").classList.add("active");
    }
}

// Delete Movie
function deleteMovie(id) {
    movies = movies.filter(m => m.id !== id);
    renderList(movies, "movie-list", "movies");
}

// Add Theater
document.getElementById("add-theater-form").addEventListener("submit", function (e) {
    e.preventDefault();
    const newTheater = {
        id: Date.now(),
        name: document.getElementById("theater-name").value,
        location: document.getElementById("theater-location").value,
        seats: document.getElementById("theater-seats").value,
        facilities: document.getElementById("theater-facilities").value
    };
    theaters.push(newTheater);
    renderList(theaters, "theater-list", "theaters");
    this.reset();
});

// Edit Theater
function editTheater(id) {
    const theater = theaters.find(t => t.id === id);
    if (theater) {
        document.getElementById("edit-theater-name").value = theater.name;
        document.getElementById("edit-theater-location").value = theater.location;
        document.getElementById("edit-theater-seats").value = theater.seats;
        document.getElementById("edit-theater-facilities").value = theater.facilities;

        document.getElementById("edit-theater-form").onsubmit = function (e) {
            e.preventDefault();
            theater.name = document.getElementById("edit-theater-name").value;
            theater.location = document.getElementById("edit-theater-location").value;
            theater.seats = document.getElementById("edit-theater-seats").value;
            theater.facilities = document.getElementById("edit-theater-facilities").value;
            renderList(theaters, "theater-list", "theaters");
            document.getElementById("edit-theater-section").classList.remove("active");
        };

        document.getElementById("edit-theater-section").classList.add("active");
    }
}

// Delete Theater
function deleteTheater(id) {
    theaters = theaters.filter(t => t.id !== id);
    renderList(theaters, "theater-list", "theaters");
}
