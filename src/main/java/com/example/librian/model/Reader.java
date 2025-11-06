package com.example.librian.model;

public class Reader extends User {

    private int borrowCount;

    public Reader() {
        super();
    }

    public int getBorrowCount() {
        return borrowCount;
    }

    public void setBorrowCount(int borrowCount) {
        this.borrowCount = borrowCount;
    }
}
