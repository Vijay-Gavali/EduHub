package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.dbconnection.DBConnection;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AdminStudentViewController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Map<String, Object>> studentList = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();
            Statement stmt = con.createStatement();
            
            // Fetch only student
            ResultSet rs = stmt.executeQuery("SELECT * FROM users WHERE role = 'Student'");

            while (rs.next()) {
                Map<String, Object> student = new HashMap<>();

                student.put("user_id", rs.getInt("user_id"));
                student.put("name", rs.getString("name"));
                student.put("email", rs.getString("email"));
                student.put("contact_no", rs.getString("contact_no"));
                student.put("role", rs.getString("role"));
                student.put("age", rs.getInt("age"));
                student.put("grade", rs.getString("grade"));
                student.put("class_id", rs.getInt("class_id"));

                studentList.add(student);
            }

            rs.close();
            stmt.close();
            con.close();

            request.setAttribute("studentList", studentList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("AdminStudentView.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error fetching teacher data: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("AdminStudentView.jsp");
            dispatcher.forward(request, response);
        }
    }
}