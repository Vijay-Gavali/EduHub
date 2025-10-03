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

@WebServlet("/TeacherStudentList")  // ✅ This is the URL
public class TecherShowStudentList extends HttpServlet {

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
            String sql = "SELECT s.user_id AS student_id, s.name AS student_name, s.admission_no, s.grade, c.class_name " +
                         "FROM users s " +
                         "JOIN class c ON s.class_id = c.class_id " +
                         "WHERE s.role = 'Student' AND c.user_id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, teacherId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Teacher t = new Teacher();
                t.setStudentId(rs.getInt("student_id"));
                t.setStudentName(rs.getString("student_name"));
                t.setAdmissionNo(rs.getString("admission_no"));
                t.setGrade(rs.getString("grade"));
                t.setClassName(rs.getString("class_name"));
                students.add(t);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("students", students);
        // ✅ make sure JSP name matches actual file
        request.getRequestDispatcher("TeacherShowstudentList.jsp").forward(request, response);
    }
}