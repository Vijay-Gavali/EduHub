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

public class AdminUserController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Map<String, Object>> teacherList = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();
            Statement stmt = con.createStatement();
            
            // Fetch only teachers
            ResultSet rs = stmt.executeQuery("SELECT * FROM users WHERE role = 'Teacher'");

            while (rs.next()) {
                Map<String, Object> teacher = new HashMap<>();

                teacher.put("user_id", rs.getInt("user_id"));
                teacher.put("name", rs.getString("name"));
                teacher.put("email", rs.getString("email"));
                teacher.put("contact_no", rs.getString("phone"));
                teacher.put("role", rs.getString("role"));
                teacher.put("age", rs.getInt("age"));
                teacher.put("grade", rs.getString("grade"));
                teacher.put("class_id", rs.getInt("class_id"));

                teacherList.add(teacher);
            }

            rs.close();
            stmt.close();
            con.close();

            request.setAttribute("teacherList", teacherList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("AdminViewUsers.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error fetching teacher data: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("AdminViewUsers.jsp");
            dispatcher.forward(request, response);
        }
    }
}