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
        if (readerIdParam == null || readerIdParam.trim().isEmpty()) {
            request.getRequestDispatcher("/LoanDetails.jsp").forward(request, response);
            return;
        }

        try {
            int readerId = Integer.parseInt(readerIdParam);
            BorrowingSlipDAO borrowingSlipDAO = new BorrowingSlipDAO();
            List<BorrowingSlip> borrowingSlips = borrowingSlipDAO.getBorrowingSlipByReader(readerId);

            ReaderDAO readerDAO = new ReaderDAO();
            Reader reader = readerDAO.getReaderById(readerId);

            request.setAttribute("borrowingSlips", borrowingSlips);
            request.setAttribute("readerId", readerId);
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
