package com.example.librian.dao;

import com.example.librian.model.Document;
import com.example.librian.util.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DocumentDAO {

    public List<Document> getDocumentByKeyword(String keyword) {
        List<Document> documents = new ArrayList<>();
        String sql = "SELECT * FROM tblDocument WHERE name LIKE ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            String searchPattern = "%" + keyword + "%";
            ps.setString(1, searchPattern);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Document document = new Document(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("type"),
                        rs.getString("author"),
                        rs.getInt("quantity"));
                documents.add(document);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return documents;
    }

    public List<Document> getAllDocuments() {
        List<Document> documents = new ArrayList<>();
        String sql = "SELECT * FROM tblDocument";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Document document = new Document(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("type"),
                        rs.getString("author"),
                        rs.getInt("quantity"));
                documents.add(document);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return documents;
    }

    public Document getDetailedInformation(int id) {
        String sql = "SELECT * FROM tblDocument WHERE id = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return new Document(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("type"),
                        rs.getString("author"),
                        rs.getInt("quantity"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
