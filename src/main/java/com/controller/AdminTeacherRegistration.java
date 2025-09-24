package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.dbconnection.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;

public class AdminTeacherRegistration extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String contact_no = request.getParameter("contact_no");
            String class_id = request.getParameter("class_id");

            if (class_id == null || class_id.isEmpty()) {
                request.setAttribute("message", "Please select a class for the teacher.");
                RequestDispatcher rd = request.getRequestDispatcher("AdminTeacherRegistration.jsp");
                rd.forward(request, response);
                return;
            }

            Connection connection = DBConnection.getConnection();

            String insertQuery = "INSERT INTO users (name, email, password, contact_no, role, class_id) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(insertQuery);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, contact_no);
            ps.setString(5, "Teacher");
            ps.setInt(6, Integer.parseInt(class_id));

            int rowsAffected = ps.executeUpdate();

            ps.close();
            connection.close();

            if (rowsAffected > 0) {
                request.setAttribute("message", "Teacher registered successfully!");
            } else {
                request.setAttribute("message", "Failed to register teacher!");
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error: " + e.getMessage());
            request.setAttribute("messageType", "error");
        }

        RequestDispatcher rd = request.getRequestDispatcher("AdminTeacherRegistration.jsp");
        rd.forward(request, response);
    }
}
