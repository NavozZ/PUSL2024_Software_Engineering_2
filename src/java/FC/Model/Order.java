/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package FC.Model;

import java.util.List;

/**
 * @author navod
 */
public class Order {
    private int id;
    private int movieTime;
    private int customer;
    private List<String> seatNumbers;

    public Order(int id, int movieTime, int customer, List<String> seatNumbers) {
        this.id = id;
        this.movieTime = movieTime;
        this.customer = customer;
        this.seatNumbers = seatNumbers;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMovieTime() {
        return movieTime;
    }

    public void setMovieTime(int movieTime) {
        this.movieTime = movieTime;
    }

    public int getCustomer() {
        return customer;
    }

    public void setCustomer(int customer) {
        this.customer = customer;
    }

    public List<String> getSeatNumbers() {
        return seatNumbers;
    }

    public void setSeatNumbers(List<String> seatNumbers) {
        this.seatNumbers = seatNumbers;
    }

}
   