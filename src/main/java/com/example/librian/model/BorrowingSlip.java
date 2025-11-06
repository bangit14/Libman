package com.example.librian.model;

import java.sql.Timestamp;

public class BorrowingSlip {

    private int id;
    private Timestamp loanDate;
    private Timestamp dueDate;
    private String status;
    private int readerTblUserId;
    private int staffTblUserId;

    // Constructors
    public BorrowingSlip() {
    }

    public BorrowingSlip(Timestamp loanDate, Timestamp dueDate, String status, int readerTblUserId,
            int staffTblUserId) {
        this.loanDate = loanDate;
        this.dueDate = dueDate;
        this.status = status;
        this.readerTblUserId = readerTblUserId;
        this.staffTblUserId = staffTblUserId;
    }

    public BorrowingSlip(int id, Timestamp loanDate, Timestamp dueDate, String status, int readerTblUserId,
            int staffTblUserId) {
        this.id = id;
        this.loanDate = loanDate;
        this.dueDate = dueDate;
        this.status = status;
        this.readerTblUserId = readerTblUserId;
        this.staffTblUserId = staffTblUserId;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Timestamp getLoanDate() {
        return loanDate;
    }

    public void setLoanDate(Timestamp loanDate) {
        this.loanDate = loanDate;
    }

    public Timestamp getDueDate() {
        return dueDate;
    }

    public void setDueDate(Timestamp dueDate) {
        this.dueDate = dueDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getReaderTblUserId() {
        return readerTblUserId;
    }

    public void setReaderTblUserId(int readerTblUserId) {
        this.readerTblUserId = readerTblUserId;
    }

    public int getStaffTblUserId() {
        return staffTblUserId;
    }

    public void setStaffTblUserId(int staffTblUserId) {
        this.staffTblUserId = staffTblUserId;
    }
}
