/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package FC.Model;

import java.util.List;

public class Movie {
    private int id;
    private String title;
    private String genre;
    private String language;
    private String description;
    private List<Cast> cast;
    private String trailerLink;
    private String imageUrl;
    private int duration;
    private double rating;
    

    // New fields for the team and additional images
    private String director;
    private String producer;
    private String writer;
    private String musicBy;
    private Enum status;
    private String carouselImg; // For carousel_img
    private String image2;

    public Movie(int id, String title, String genre, String language, String description, List<Cast> cast, String trailerLink, String imageUrl, int duration, double rating, String director, String producer, String writer, String musicBy, Enum status, String carouselImg, String image2) {
        this.id = id;
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
        this.status = status;
        this.carouselImg = carouselImg;
        this.image2 = image2;
    }

    public Movie(int id, String title, String genre, String language, String description, List<Cast> cast, String trailerLink, String imageUrl, int duration, double rating, String director, String producer, String writer, String musicBy, String carouselImg, String image2) {
        this.id = id;
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
        this.carouselImg = carouselImg;
        this.image2 = image2;
    }

    
    
    // Full Constructor with all fields, including id
    public Movie(int id, String title, String genre, String language, String description, List<Cast> cast,
                 String trailerLink, String imageUrl, int duration, double rating, String director, 
                 String producer, String writer, String musicBy, String carouselImg) {
        this.id = id;
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
        
        this.carouselImg = carouselImg;
    }

    // Constructor without id (useful for new movie entries)
    public Movie(String title, String genre, String language, String description, List<Cast> cast,
                 String trailerLink, String imageUrl, int duration, double rating, String director,
                 String producer, String writer, String musicBy, String carouselImg) {
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
        
        this.carouselImg = carouselImg;
    }
     
     // Constructor for Manage Comingsoon Movies 

    public Movie(int id, String imageUrl ) {
        this.id = id;
        this.imageUrl = imageUrl;
        
    }
    // Constructor for Manage Carousel
    public Movie(int id,String title,int duration, double rating,String carouselImg){
        this.id = id;
        this.title = title;
        this.rating = rating;
        this.duration = duration;
        this.carouselImg = carouselImg;
        
    }
    

    // Simplified constructor for cases without cast and additional images
    public Movie(String title, String genre, String language, String description, String trailerLink,
                 String imageUrl, int duration, double rating, String director, String producer,
                 String writer, String musicBy) {
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

    // Getter and Setter for csImg

    public Enum getStatus() {
        return status;
    }

    public void setStatus(Enum status) {
        this.status = status;
    }
    

    // Getter and Setter for carouselImg
    public String getCarouselImg() {
        return carouselImg;
    }

    public void setCarouselImg(String carouselImg) {
        this.carouselImg = carouselImg;
    }

    // Getters and Setters for all fields
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

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

    public String getImage2() {
        return image2;
    }

    public void setImage2(String image2) {
        this.image2 = image2;
    }
    
    

    // toString method for debugging and logging
    @Override
    public String toString() {
        return "Movie{" +
                "id=" + id +
                ", title='" + title + '\'' +
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
                
                ", carouselImg='" + carouselImg + '\'' +
                '}';
    }
}
