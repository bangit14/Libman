package com.example.librian.servlet;

import com.example.librian.dao.ReaderDAO;
import com.example.librian.model.Reader;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

@WebServlet("/reader")
public class ReaderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            response.sendRedirect("login");
            return;
        }

        String startDateStr = request.getParameter("startDate");
        String endDateStr = request.getParameter("endDate");

        ReaderDAO readerDAO = new ReaderDAO();
        List<Reader> readers = new java.util.ArrayList<>();
        int totalBorrowed = 0;

        if (startDateStr != null && endDateStr != null &&
                !startDateStr.trim().isEmpty() && !endDateStr.trim().isEmpty()) {

            try {
                Timestamp startDate = Timestamp.valueOf(startDateStr + " 00:00:00");
                Timestamp endDate = Timestamp.valueOf(endDateStr + " 23:59:59");
                readers = readerDAO.getReaderByTime(startDate, endDate);
                request.setAttribute("startDate", startDateStr);
                request.setAttribute("endDate", endDateStr);
                for (Reader reader : readers) {
                    totalBorrowed = totalBorrowed + reader.getBorrowCount();
                }
            } catch (Exception e) {
                readers = new java.util.ArrayList<>();
                totalBorrowed = 0;
            }
        }

        request.setAttribute("readers", readers);
        request.setAttribute("totalBorrowed", totalBorrowed);
        request.getRequestDispatcher("/ViewReaderStatistic.jsp").forward(request, response);
    }
}
