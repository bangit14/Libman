package com.example.librian.dao;

import com.example.librian.model.BorrowingSlip;
import com.example.librian.util.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BorrowingSlipDAO {

    public List<BorrowingSlip> getBorrowingSlipByReader(int readerId, Timestamp startDate, Timestamp endDate) {
        List<BorrowingSlip> borrowingSlips = new ArrayList<>();
        String sql = "SELECT * FROM tblBorrowingSlip WHERE ReadertblUserid = ? and loanDate between ? and ? ORDER BY id ASC";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, readerId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                BorrowingSlip borrowingSlip = new BorrowingSlip(
                        rs.getInt("id"),
                        rs.getTimestamp("loanDate"),
                        rs.getTimestamp("dueDate"),
                        rs.getString("status"),
                        rs.getInt("ReadertblUserid"),
                        rs.getInt("StafftblUserid"));
                borrowingSlips.add(borrowingSlip);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return borrowingSlips;
    }
}
