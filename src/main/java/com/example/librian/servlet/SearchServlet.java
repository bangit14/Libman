package com.example.librian.servlet;

import com.example.librian.dao.DocumentDAO;
import com.example.librian.model.Document;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            response.sendRedirect("login");
            return;
        }

        String keyword = request.getParameter("keyword");
        DocumentDAO documentDAO = new DocumentDAO();
        List<Document> documents;

        if (keyword != null && !keyword.trim().isEmpty()) {
            documents = documentDAO.getDocumentByKeyword(keyword.trim());
            request.setAttribute("searchKeyword", keyword);
        } else {
            documents = documentDAO.getAllDocuments();
        }

        request.setAttribute("documents", documents);
        request.getRequestDispatcher("/SearchDocument.jsp").forward(request, response);
    }

}
