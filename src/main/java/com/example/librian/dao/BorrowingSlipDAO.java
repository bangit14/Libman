package com.example.librian.dao;

import com.example.librian.model.BorrowingSlip;
import com.example.librian.util.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BorrowingSlipDAO {

    public List<BorrowingSlip> getBorrowingSlipByReader(int readerId, Timestamp startDate, Timestamp endDate) {
        List<BorrowingSlip> borrowingSlips = new ArrayList<>();

        String sql = "SELECT * FROM tblBorrowingSlip WHERE ReadertblUserid = ?";
        if (startDate != null && endDate != null) {
            sql += " AND loanDate BETWEEN ? AND ?";
        }
        sql += " ORDER BY id ASC";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, readerId);

            // Chỉ set thêm nếu có ngày
            if (startDate != null && endDate != null) {
                ps.setTimestamp(2, startDate);
                ps.setTimestamp(3, endDate);
            }

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
