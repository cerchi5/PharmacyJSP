package com.classes;

import java.util.Date;

public class Drug {

    private int id;
    private String name;
    private int recommendedDose;
    private String category;
    private String specs;
    private double price;
    private double actualPrice;
    private int stock;
    private Date exp;
    private int quantity;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getRecommendedDose() {
        return recommendedDose;
    }

    public void setRecommendedDose(int recommendedDose) {
        this.recommendedDose = recommendedDose;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getSpecs() {
        return specs;
    }

    public void setSpecs(String specs) {
        this.specs = specs;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getActualPrice() {
        return actualPrice;
    }

    public void setActualPrice(double actualPrice) {
        this.actualPrice = actualPrice;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public Date getExp() {
        return exp;
    }

    public void setExp(Date exp) {
        this.exp = exp;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String toString(){
        return id + " " + name + " " + category + " " + specs + " " + price + " " + actualPrice + " " + stock + " " + exp;
    }

    public Drug(int id, String name, int rd, String category, String specs, double price, double ap, int stock, Date exp){
        setId(id);
        setName(name);
        setRecommendedDose(rd);
        setCategory(category);
        setSpecs(specs);
        setPrice(price);
        setActualPrice(ap);
        setStock(stock);
        setExp(exp);
        quantity = 0;
    }

    public Drug(){}
}
