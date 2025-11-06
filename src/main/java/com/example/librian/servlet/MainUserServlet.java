package com.example.librian.servlet;

import com.example.librian.util.RoleChecker;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/main-user")
public class MainUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        if (!RoleChecker.isLoggedIn(session)) {
            response.sendRedirect("login");
            return;
        }

        if (!RoleChecker.isReader(session)) {
            response.sendRedirect("MainManagementStaff.jsp");
            return;
        }

        request.getRequestDispatcher("/MainReader.jsp").forward(request, response);
    }
}
