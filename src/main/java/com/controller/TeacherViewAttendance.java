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

@WebServlet("/TeacherViewAttendance")
public class TeacherViewAttendance extends HttpServlet {

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
        List<Teacher> attendanceList = new ArrayList<>();

        try (Connection con = DBConnection.getConnection()) {

            // SQL: fetch attendance of students belonging to the logged-in teacher's class
        	String sql = """
        		    SELECT u.user_id, u.name AS student_name, a.date AS attendance_date, a.status
        		    FROM users u
        		    JOIN class c ON u.class_id = c.class_id
        		    LEFT JOIN attendance a ON u.user_id = a.user_id
        		    WHERE u.role = 'Student'
        		      AND u.class_id = (SELECT class_id FROM users WHERE user_id = ? AND role='Teacher')
        		    ORDER BY a.date DESC, u.name
        		    """;


            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, teacherId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Teacher t = new Teacher();
                t.setStudentId(rs.getInt("user_id"));
                t.setStudentName(rs.getString("student_name"));
                t.setAttendanceDate(rs.getString("attendance_date"));
                t.setStatus(rs.getString("status"));
                attendanceList.add(t);
            }

            rs.close();
            ps.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("attendanceList", attendanceList);
        request.getRequestDispatcher("TeacherViewAttendance.jsp").forward(request, response);
    }
}
