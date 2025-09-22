package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dbconnection.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UserAttendanceController extends HttpServlet {

    public static class AttendanceRecord {
        private String date;
        private String status;

        public AttendanceRecord(String date, String status) {
            this.date = date;
            this.status = status;
        }

        public String getDate() { return date; }
        public String getStatus() { return status; }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user_id") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = (Integer) session.getAttribute("user_id");
        List<AttendanceRecord> attendanceList = new ArrayList<>();

        try (Connection connection = DBConnection.getConnection()) {
            String query = "SELECT date, status FROM attendance WHERE user_id = ? ORDER BY date DESC";
            try (PreparedStatement ps = connection.prepareStatement(query)) {
                ps.setInt(1, userId);
                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        attendanceList.add(new AttendanceRecord(
                                rs.getString("date"),
                                rs.getString("status")
                        ));
                    }
                }
            }

            session.setAttribute("attendanceList", attendanceList);
            response.sendRedirect("UserDashboard.jsp?view=attendance");

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("attendanceList", null);
            response.sendRedirect("UserDashboard.jsp?view=attendance");
        }
    }
}
