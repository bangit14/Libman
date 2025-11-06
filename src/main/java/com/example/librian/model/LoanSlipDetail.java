package com.example.librian.model;

import java.sql.Timestamp;

public class LoanSlipDetail {

    private int id;
    private int quantity;
    private Timestamp returnDate;
    private int documentId;
    private int borrowingSlipId;

    // Constructors
    public LoanSlipDetail() {
    }

    public LoanSlipDetail(int quantity, Timestamp returnDate, int documentId, int borrowingSlipId) {
        this.quantity = quantity;
        this.returnDate = returnDate;
        this.documentId = documentId;
        this.borrowingSlipId = borrowingSlipId;
    }

    public LoanSlipDetail(int id, int quantity, Timestamp returnDate, int documentId, int borrowingSlipId) {
        this.id = id;
        this.quantity = quantity;
        this.returnDate = returnDate;
        this.documentId = documentId;
        this.borrowingSlipId = borrowingSlipId;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Timestamp getReturnDate() {
        return returnDate;
    }

    public void setReturnDate(Timestamp returnDate) {
        this.returnDate = returnDate;
    }

    public int getDocumentId() {
        return documentId;
    }

    public void setDocumentId(int documentId) {
        this.documentId = documentId;
    }

    public int getBorrowingSlipId() {
        return borrowingSlipId;
    }

    public void setBorrowingSlipId(int borrowingSlipId) {
        this.borrowingSlipId = borrowingSlipId;
    }
}
