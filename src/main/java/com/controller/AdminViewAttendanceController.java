package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dbconnection.DBConnection;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AdminViewAttendanceController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int studentId = Integer.parseInt(request.getParameter("studentId"));
        List<String[]> attendanceList = new ArrayList<>();
        String studentName = null;

        try (Connection con = DBConnection.getConnection()) {
            String studentQuery = "SELECT name FROM users WHERE user_id = ?";
            try (PreparedStatement ps1 = con.prepareStatement(studentQuery)) {
                ps1.setInt(1, studentId);
                try (ResultSet rs = ps1.executeQuery()) {
                    if (rs.next()) {
                        studentName = rs.getString("name");
                    }
                }
            }

            // ✅ Get attendance records
            String sql = "SELECT date, status FROM attendance WHERE user_id = ? ORDER BY date DESC";
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setInt(1, studentId);
                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        String[] record = new String[2];
                        record[0] = rs.getDate("date").toString();
                        record[1] = rs.getString("status");
                        attendanceList.add(record);
                    }
                }
            }

            request.setAttribute("studentId", studentId);
            request.setAttribute("studentName", studentName);
            request.setAttribute("attendanceList", attendanceList);

            RequestDispatcher rd = request.getRequestDispatcher("AdminViewAttendance.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
