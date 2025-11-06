package com.example.librian.servlet;

import com.example.librian.util.RoleChecker;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/management-staff")
public class MainManagementStaffServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        if (!RoleChecker.isLoggedIn(session)) {
            response.sendRedirect("login");
            return;
        }

        if (!RoleChecker.isManagerStaff(session)) {
            response.sendRedirect("main-user");
            return;
        }

        request.getRequestDispatcher("/MainManagementStaff.jsp").forward(request, response);
    }
}
