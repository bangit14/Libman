package com.example.librian.servlet;

import com.example.librian.dao.DocumentDAO;
import com.example.librian.model.Document;
import com.example.librian.util.RoleChecker;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/main")
public class MainServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        if (!RoleChecker.isLoggedIn(session)) {
            response.sendRedirect("login");
            return;
        }

        if (RoleChecker.isReader(session)) {
            response.sendRedirect("main-user");
            return;
        } else if (RoleChecker.isManagerStaff(session)) {
            response.sendRedirect("management-staff");
            return;
        }

        DocumentDAO documentDAO = new DocumentDAO();
        List<Document> documents = documentDAO.getAllDocuments();

        request.setAttribute("documents", documents);
        request.getRequestDispatcher("/MainReader.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
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
        request.getRequestDispatcher("/MainReader.jsp").forward(request, response);
    }
}
