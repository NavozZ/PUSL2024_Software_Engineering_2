package FC.Model;

import java.time.LocalDate;

public class MovieTime {
    private int id; // Unique identifier for the record
    private int movieId; // Foreign key to Movies table
    private int locationId; // Foreign key to Theaters table
    private String time; // Time in HH:mm:ss format
    private LocalDate date; // Date of the movie schedule

    // Full constructor
    public MovieTime(int id, int movieId, int locationId, String time, LocalDate date) {
        this.id = id;
        this.movieId = movieId;
        this.locationId = locationId;
        this.time = time;
        this.date = date;
    }

    // Constructor without id (for creating new records before insertion)
    public MovieTime(int movieId, int locationId, String time, LocalDate date) {
        this.movieId = movieId;
        this.locationId = locationId;
        this.time = time;
        this.date = date;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMovieId() {
        return movieId;
    }

    public void setMovieId(int movieId) {
        this.movieId = movieId;
    }

    public int getLocationId() {
        return locationId;
    }

    public void setLocationId(int locationId) {
        this.locationId = locationId;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    // ToString method for debugging and logging
    @Override
    public String toString() {
        return "MovieTime{" +
                "id=" + id +
                ", movieId=" + movieId +
                ", locationId=" + locationId +
                ", time='" + time + '\'' +
                ", date=" + date +
                '}';
    }
}
