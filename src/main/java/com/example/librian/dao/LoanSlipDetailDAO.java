package com.example.librian.dao;

import com.example.librian.model.LoanSlipDetail;
import com.example.librian.util.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LoanSlipDetailDAO {

    public List<LoanSlipDetail> getDocumentBorrowingSlip(int borrowingSlipId) {
        List<LoanSlipDetail> loanSlipDetails = new ArrayList<>();
        String sql = "SELECT lsd.*, d.name as documentName, d.type, d.author " +
                "FROM tblLoanSlipDetail lsd " +
                "JOIN tblDocument d ON lsd.Documentid = d.id " +
                "WHERE lsd.BorrowingSlipid = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, borrowingSlipId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                LoanSlipDetail loanSlipDetail = new LoanSlipDetail(
                        rs.getInt("id"),
                        rs.getInt("quantity"),
                        rs.getTimestamp("returnDate"),
                        rs.getInt("Documentid"),
                        rs.getInt("BorrowingSlipid"));
                loanSlipDetails.add(loanSlipDetail);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return loanSlipDetails;
    }

    public List<LoanSlipDetail> getAllLoanSlipDetails() {
        List<LoanSlipDetail> loanSlipDetails = new ArrayList<>();
        String sql = "SELECT * FROM tblLoanSlipDetail";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                LoanSlipDetail loanSlipDetail = new LoanSlipDetail(
                        rs.getInt("id"),
                        rs.getInt("quantity"),
                        rs.getTimestamp("returnDate"),
                        rs.getInt("Documentid"),
                        rs.getInt("BorrowingSlipid"));
                loanSlipDetails.add(loanSlipDetail);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return loanSlipDetails;
    }

    public LoanSlipDetail getLoanSlipDetailById(int id) {
        String sql = "SELECT * FROM tblLoanSlipDetail WHERE id = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return new LoanSlipDetail(
                        rs.getInt("id"),
                        rs.getInt("quantity"),
                        rs.getTimestamp("returnDate"),
                        rs.getInt("Documentid"),
                        rs.getInt("BorrowingSlipid"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
