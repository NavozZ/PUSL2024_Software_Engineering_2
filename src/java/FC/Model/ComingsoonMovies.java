/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package FC.Model;

public class ComingsoonMovies {
    private int id;
    private String title;
    private String description;
    private String imageUrl;
    private String duration;
    private double imdbRating;

    // Constructors
    public ComingsoonMovies() {}

    public ComingsoonMovies(int id, String title, String description, String imageUrl, String duration, double imdbRating) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.imageUrl = imageUrl;
        this.duration = duration;
        this.imdbRating = imdbRating;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }

    public String getDuration() { return duration; }
    public void setDuration(String duration) { this.duration = duration; }

    public double getImdbRating() { return imdbRating; }
    public void setImdbRating(double imdbRating) { this.imdbRating = imdbRating; }
    
    public String getDetailsPageUrl() {
        // Construct the URL based on your requirements, for example:
        return "movieDetails.jsp?id=" + id;
    }
}
