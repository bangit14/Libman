package com.example.librian.util;

import jakarta.servlet.http.HttpSession;

public class RoleChecker {

    private RoleChecker() {
    }

    public static boolean isReader(HttpSession session) {
        String role = (String) session.getAttribute("role");
        return "reader".equalsIgnoreCase(role) || "bạn đọc".equalsIgnoreCase(role);
    }

    public static boolean isManagerStaff(HttpSession session) {
        String role = (String) session.getAttribute("role");
        return "managerStaff".equalsIgnoreCase(role);
    }

    public static boolean isLibaryStaff(HttpSession session) {
        String role = (String) session.getAttribute("role");
        return "libraryStaff".equalsIgnoreCase(role);
    }

    public static boolean isLoggedIn(HttpSession session) {
        return session.getAttribute("user") != null;
    }

    public static String getRole(HttpSession session) {
        return (String) session.getAttribute("role");
    }

    public static String getUsername(HttpSession session) {
        return (String) session.getAttribute("username");
    }
}
