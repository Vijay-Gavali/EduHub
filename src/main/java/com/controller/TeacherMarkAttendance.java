package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.dbconnection.DBConnection;

@WebServlet("/Teachersaveattendance")
public class TeacherMarkAttendance extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || !"Teacher".equals(session.getAttribute("role"))) {
            response.sendRedirect("login.jsp");
            return;
        }

        String studentIdStr = request.getParameter("studentId");
        String status = request.getParameter("status");

        if (studentIdStr == null || status == null || (!status.equals("Present") && !status.equals("Absent"))) {
            response.sendRedirect("TeacherAttendance?msg=Invalid+Request");
            return;
        }

        int studentId = Integer.parseInt(studentIdStr);
        Date today = new Date(System.currentTimeMillis());

        try (Connection con = DBConnection.getConnection()) {

            // ✅ Check if attendance already exists for today
            String checkSql = "SELECT 1 FROM attendance WHERE user_id=? AND date=?";
            try (PreparedStatement ps = con.prepareStatement(checkSql)) {
                ps.setInt(1, studentId);
                ps.setDate(2, today);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        response.sendRedirect("TeacherAttendance?msg=Attendance+already+marked+for+today");
                        return;
                    }
                }
            }

            // ✅ Insert new attendance
            String insertSql = "INSERT INTO attendance (user_id, date, status) VALUES (?, ?, ?)";
            try (PreparedStatement ps = con.prepareStatement(insertSql)) {
                ps.setInt(1, studentId);
                ps.setDate(2, today);
                ps.setString(3, status);
                int rows = ps.executeUpdate();
                if(rows > 0){
                    response.sendRedirect("TeacherAttendance?msg=Attendance+marked+" + status);
                } else {
                    response.sendRedirect("TeacherAttendance?msg=Failed+to+save+attendance");
                }
            }

        } catch (Exception e) {
            e.printStackTrace(); 
            response.sendRedirect("TeacherAttendance?msg=Error+while+saving+attendance");
        }
    }
}
