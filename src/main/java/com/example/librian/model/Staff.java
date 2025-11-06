package com.example.librian.model;

public class Staff extends User{

    private int id;
    private String position;

    public Staff() {
        super();
    }

    public Staff (String position) {
        super();
        this.position = position;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }
}
