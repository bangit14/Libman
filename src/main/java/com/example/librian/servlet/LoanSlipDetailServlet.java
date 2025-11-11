package com.example.librian.servlet;

import com.example.librian.dao.LoanSlipDetailDAO;
import com.example.librian.dao.DocumentDAO;
import com.example.librian.model.Document;
import com.example.librian.model.LoanSlipDetail;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

@WebServlet("/loan-slip-detail")
public class LoanSlipDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            response.sendRedirect("login");
            return;
        }

        String borrowingSlipIdParam = request.getParameter("borrowingSlipId");
        if (borrowingSlipIdParam == null || borrowingSlipIdParam.trim().isEmpty()) {
            request.getRequestDispatcher("/LoanSlipDetail.jsp").forward(request, response);
            return;
        }

        try {
            int borrowingSlipId = Integer.parseInt(borrowingSlipIdParam);
            String loanDate = request.getParameter("loanDate");
            LoanSlipDetailDAO loanSlipDetailDAO = new LoanSlipDetailDAO();
            List<LoanSlipDetail> loanSlipDetails = loanSlipDetailDAO.getDocumentBorrowingSlip(borrowingSlipId);

            java.util.Map<Integer, String> documentNameMap = new java.util.HashMap<>();
            DocumentDAO documentDAO = new DocumentDAO();
            for (LoanSlipDetail d : loanSlipDetails) {
                if (!documentNameMap.containsKey(d.getDocumentId())) {
                    Document doc = documentDAO.getDetailedInformation(d.getDocumentId());
                    if (doc != null)
                        documentNameMap.put(d.getDocumentId(), doc.getName());
                }
            }

            request.setAttribute("loanSlipDetails", loanSlipDetails);
            request.setAttribute("documentNameMap", documentNameMap);
            request.setAttribute("borrowingSlipId", borrowingSlipId);
            request.setAttribute("loanDate", loanDate);
            request.getRequestDispatcher("/LoanSlipDetail.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            request.getRequestDispatcher("/LoanSlipDetail.jsp").forward(request, response);
        }
    }
}
