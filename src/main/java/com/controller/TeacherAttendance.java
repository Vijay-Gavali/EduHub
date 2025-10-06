package com.controller;

import com.dbconnection.DBConnection;
import com.model.Teacher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/TeacherAttendance")
public class TeacherAttendance extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || !"Teacher".equals(session.getAttribute("role"))) {
            response.sendRedirect("login.jsp");
            return;
        }

        int teacherId = (int) session.getAttribute("user_id");
        List<Teacher> students = new ArrayList<>();

        try (Connection con = DBConnection.getConnection()) {
            String sql = """
                    SELECT 
                        s.user_id AS student_id,
                        s.name AS student_name,
                        c.class_name
                    FROM users s
                    JOIN class c ON s.class_id = c.class_id
                    WHERE s.role = 'Student'
                      AND c.class_id = (
                          SELECT class_id FROM users WHERE user_id = ? AND role = 'Teacher'
                      )
                    ORDER BY s.name
                    """;

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, teacherId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int studentId = rs.getInt("student_id");

                // Check if attendance already marked today
                String checkSql = "SELECT 1 FROM attendance WHERE user_id=? AND date=?";
                PreparedStatement psCheck = con.prepareStatement(checkSql);
                psCheck.setInt(1, studentId);
                psCheck.setDate(2, new java.sql.Date(System.currentTimeMillis()));
                ResultSet rsCheck = psCheck.executeQuery();
                boolean attendanceMarkedToday = rsCheck.next();

                Teacher t = new Teacher();
                t.setStudentId(studentId);
                t.setStudentName(rs.getString("student_name"));
                t.setClassName(rs.getString("class_name"));
                t.setAttendanceMarkedToday(attendanceMarkedToday); // ✅ Add this field in Teacher model
                students.add(t);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("students", students);
        request.getRequestDispatcher("TeacherAttendance.jsp").forward(request, response);
    }
}
