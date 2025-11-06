package com.example.librian.servlet;

import com.example.librian.dao.DocumentDAO;
import com.example.librian.model.Document;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/detail")
public class DetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            response.sendRedirect("login");
            return;
        }

        String idParam = request.getParameter("id");
        if (idParam == null || idParam.trim().isEmpty()) {
            request.getRequestDispatcher("/DocumentDetail.jsp").forward(request, response);
            return;
        }

        try {
            int id = Integer.parseInt(idParam);
            DocumentDAO documentDAO = new DocumentDAO();
            Document document = documentDAO.getDetailedInformation(id);

            request.setAttribute("document", document);
            request.getRequestDispatcher("/DocumentDetail.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            request.getRequestDispatcher("/DocumentDetail.jsp").forward(request, response);
        }
    }
}
