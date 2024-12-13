/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package FC.Model;

import java.util.List;

public class Movie {
    private String title;
    private String genre;
    private String language;
    private String description;
    private List<Cast> cast;
    private String trailerLink;
    private String imageUrl;
    private int duration;
    private double rating;
    
    // New fields for the team
    private String director;
    private String producer;
    private String writer;
    private String musicBy;

    // Constructor
    public Movie(String title, String genre, String language, String description, List<Cast> cast, String trailerLink, String imageUrl, int duration, double rating, String director, String producer, String writer, String musicBy) {
        this.title = title;
        this.genre = genre;
        this.language = language;
        this.description = description;
        this.cast = cast;
        this.trailerLink = trailerLink;
        this.imageUrl = imageUrl;
        this.duration = duration;
        this.rating = rating;
        this.director = director;
        this.producer = producer;
        this.writer = writer;
        this.musicBy = musicBy;
    }

    public Movie(String title, String genre, String language, String description, String trailerLink, String imageUrl, int duration, double rating, String director, String producer, String writer, String musicBy) {
        this.title = title;
        this.genre = genre;
        this.language = language;
        this.description = description;
        this.trailerLink = trailerLink;
        this.imageUrl = imageUrl;
        this.duration = duration;
        this.rating = rating;
        this.director = director;
        this.producer = producer;
        this.writer = writer;
        this.musicBy = musicBy;
    }

    // Getters and Setters
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<Cast> getCast() {
        return cast;
    }

    public void setCast(List<Cast> cast) {
        this.cast = cast;
    }

    public String getTrailerLink() {
        return trailerLink;
    }

    public void setTrailerLink(String trailerLink) {
        this.trailerLink = trailerLink;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public String getProducer() {
        return producer;
    }

    public void setProducer(String producer) {
        this.producer = producer;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public String getMusicBy() {
        return musicBy;
    }

    public void setMusicBy(String musicBy) {
        this.musicBy = musicBy;
    }

    // ToString method
    @Override
    public String toString() {
        return "Movie{" +
                "title='" + title + '\'' +
                ", genre='" + genre + '\'' +
                ", language='" + language + '\'' +
                ", description='" + description + '\'' +
                ", cast=" + cast +
                ", trailerLink='" + trailerLink + '\'' +
                ", imageUrl='" + imageUrl + '\'' +
                ", duration=" + duration +
                ", rating=" + rating +
                ", director='" + director + '\'' +
                ", producer='" + producer + '\'' +
                ", writer='" + writer + '\'' +
                ", musicBy='" + musicBy + '\'' +
                '}';
    }
}
