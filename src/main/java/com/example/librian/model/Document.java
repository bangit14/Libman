package com.example.librian.model;

public class Document {

    private int id;
    private String name;
    private String type;
    private String author;
    private int quantity;

    // Constructors
    public Document() {
    }

    public Document(String name, String type, String author, int quantity) {
        this.name = name;
        this.type = type;
        this.author = author;
        this.quantity = quantity;
    }

    public Document(int id, String name, String type, String author, int quantity) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.author = author;
        this.quantity = quantity;
    }

    // Getters and Setters
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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
