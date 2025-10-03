package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;

import com.dbconnection.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/Teachersaveattendance")
public class TeacherMarkAttendance extends HttpServlet { 


    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String studentIdStr = request.getParameter("studentId");
        String status = request.getParameter("status");

        if (studentIdStr == null || status == null) {
            response.sendRedirect("TeacherAttendance?msg=Invalid+Request");
            return;
        }

        int studentId = Integer.parseInt(studentIdStr);
        Date today = new Date(System.currentTimeMillis());

        try (Connection con = DBConnection.getConnection()) {

            // ✅ Check if attendance already exists for today
            String checkSql = "SELECT * FROM attendance WHERE user_id=? AND attendance_date=?";
            try (PreparedStatement ps = con.prepareStatement(checkSql)) {
                ps.setInt(1, studentId);
                ps.setDate(2, today);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        // ✅ Update existing record
                        String updateSql = "UPDATE attendance SET status=? WHERE user_id=? AND attendance_date=?";
                        try (PreparedStatement upd = con.prepareStatement(updateSql)) {
                            upd.setString(1, status);
                            upd.setInt(2, studentId);
                            upd.setDate(3, today);
                            upd.executeUpdate();
                        }
                        response.sendRedirect("TeacherAttendance?msg=Attendance+updated+to+" + status);
                        return;
                    }
                }
            }

            // ✅ Insert new record if not exists
            String insertSql = "INSERT INTO attendance (user_id, attendance_date, status) VALUES (?, ?, ?)";
            try (PreparedStatement ps = con.prepareStatement(insertSql)) {
                ps.setInt(1, studentId);
                ps.setDate(2, today);
                ps.setString(3, status);
                ps.executeUpdate();
            }

            response.sendRedirect("TeacherAttendance?msg=Attendance+marked+" + status);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("TeacherAttendance?msg=Error+while+saving");
        }
    }
}
