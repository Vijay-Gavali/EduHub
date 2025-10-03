package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dbconnection.DBConnection;
import com.model.Teacher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/TeacherAssignedClasses")
public class TeacherAssignedClasses extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user_id") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int teacherId = (int) session.getAttribute("user_id");
        List<Teacher> classList = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT c.class_id, c.class_name, COUNT(u.user_id) AS total_students " +
                         "FROM class c " +
                         "LEFT JOIN users u ON c.class_id = u.class_id AND u.role = 'Student' " +
                         "WHERE c.user_id = ? " +
                         "GROUP BY c.class_id, c.class_name";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, teacherId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("class_id");
                String name = rs.getString("class_name");
                int count = rs.getInt("total_students");

                classList.add(new Teacher(id, name, count));
            }

            request.setAttribute("classList", classList);
            request.getRequestDispatcher("TeacherAssignedClasses.jsp").forward(request, response);


        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error fetching class info");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
