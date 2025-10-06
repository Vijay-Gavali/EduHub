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

@WebServlet("/TeacherStudentList") // URL mapping
public class TecherShowStudentList extends HttpServlet {

	 
	 @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        // ✅ Validate session
	        HttpSession session = request.getSession(false);
	        if (session == null || !"Teacher".equals(session.getAttribute("role"))) {
	            response.sendRedirect("login.jsp");
	            return;
	        }

	        int teacherId = (int) session.getAttribute("user_id"); // Logged-in teacher ID
	        List<Teacher> students = new ArrayList<>();

	        // ✅ SQL Query
	        String sql = """
	            SELECT 
	                s.user_id AS student_id,
	                s.name AS student_name,
	                s.admission_no,
	                s.grade,
	                c.class_name
	            FROM users s
	            JOIN class c ON s.class_id = c.class_id
	            WHERE s.role = 'Student'
	              AND c.class_id = (
	                  SELECT class_id FROM users WHERE user_id = ? AND role = 'Teacher'
	              )
	            ORDER BY s.name
	        """;

	        try (Connection con = DBConnection.getConnection();
	             PreparedStatement ps = con.prepareStatement(sql)) {

	            ps.setInt(1, teacherId);

	            try (ResultSet rs = ps.executeQuery()) {
	                while (rs.next()) {
	                    Teacher t = new Teacher();
	                    t.setStudentId(rs.getInt("student_id"));
	                    t.setStudentName(rs.getString("student_name"));
	                    t.setAdmissionNo(rs.getString("admission_no"));
	                    t.setGrade(rs.getString("grade"));
	                    t.setClassName(rs.getString("class_name"));
	                    students.add(t);
	                }
	            }

	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

        request.setAttribute("students", students);
        request.getRequestDispatcher("TeacherShowstudentList.jsp").forward(request, response);
    }
}
