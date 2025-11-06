package com.example.librian.dao;

import com.example.librian.model.Reader;
import com.example.librian.util.DatabaseConnection;
// import model.User; // removed unused import

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class ReaderDAO {

    public List<Reader> getReaderByTime(Timestamp startDate, Timestamp endDate) {
        List<Reader> readers = new ArrayList<>();
        String sql = "SELECT r.id AS reader_id, " +
                "       r.tblUserid AS user_id, " +
                "       u.name AS user_name, " +
                "       u.phone AS user_phone, " +
                "       COALESCE(COUNT(b.id), 0) AS borrow_count " +
                "FROM tblReader r " +
                "JOIN tblUser u ON r.tblUserid = u.id " +
                "INNER JOIN tblBorrowingSlip b " +
                "       ON b.ReadertblUserid = r.id " +
                "       AND b.loanDate BETWEEN ? AND ? " +
                "GROUP BY r.id, r.tblUserid, u.name, u.phone " +
                "ORDER BY borrow_count DESC";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setTimestamp(1, startDate);
            ps.setTimestamp(2, endDate);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Reader reader = new Reader();
                    reader.setId(rs.getInt("reader_id"));
                    reader.setBorrowCount(rs.getInt("borrow_count"));
                    reader.setName(rs.getString("user_name"));
                    reader.setPhone(rs.getString("user_phone"));
                    readers.add(reader);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return readers;
    }

    public Reader getReaderById(int id) {
        String sql = "SELECT r.id AS reader_id, r.borrowCount AS borrow_count, u.name AS user_name, u.phone AS user_phone "
                +
                "FROM tblReader r " +
                "JOIN tblUser u ON r.tblUserid = u.id " +
                "WHERE r.id = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Reader reader = new Reader();
                reader.setId(rs.getInt("reader_id"));
                reader.setBorrowCount(rs.getInt("borrow_count"));
                reader.setName(rs.getString("user_name"));
                reader.setPhone(rs.getString("user_phone"));
                return reader;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
