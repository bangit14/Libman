package com.example.librian.servlet;

import com.example.librian.dao.BorrowingSlipDAO;
import com.example.librian.dao.ReaderDAO;
import com.example.librian.dao.UserDAO;
import com.example.librian.model.Reader;
import com.example.librian.model.BorrowingSlip;

import com.example.librian.model.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

@WebServlet("/loan-detail")
public class LoanDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            response.sendRedirect("login");
            return;
        }

        String readerIdParam = request.getParameter("readerId");
        String startDateParam = request.getParameter("startDate");
        String endDateParam = request.getParameter("endDate");

        if (readerIdParam == null || readerIdParam.trim().isEmpty()) {
            request.getRequestDispatcher("/LoanDetails.jsp").forward(request, response);
            return;
        }

        Timestamp startDate = null;
        Timestamp endDate = null;

        try {
            if (startDateParam != null && !startDateParam.isEmpty()) {
                startDate = Timestamp.valueOf(startDateParam + " 00:00:00");
            }
            if (endDateParam != null && !endDateParam.isEmpty()) {
                endDate = Timestamp.valueOf(endDateParam + " 23:59:59");
            }
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
        }

        try {
            int readerId = Integer.parseInt(readerIdParam);

            BorrowingSlipDAO borrowingSlipDAO = new BorrowingSlipDAO();
            List<BorrowingSlip> borrowingSlips = borrowingSlipDAO.getBorrowingSlipByReader(readerId, startDate, endDate);

            ReaderDAO readerDAO = new ReaderDAO();
            Reader reader = readerDAO.getReaderById(readerId);

            request.setAttribute("borrowingSlips", borrowingSlips);
            request.setAttribute("readerId", readerId);
            request.setAttribute("startDate", startDateParam);
            request.setAttribute("endDate", endDateParam);

            if (reader != null) {
                request.setAttribute("readerName", reader.getName());
                request.setAttribute("readerPhone", reader.getPhone());
            }

            request.getRequestDispatcher("/LoanDetails.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            request.getRequestDispatcher("/LoanDetails.jsp").forward(request, response);
        }
    }
}
