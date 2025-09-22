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

public class ParentRegistration extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            // Fetch parameters
            String parent_name = request.getParameter("parent_name");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            // DB connection
            Connection connection = DBConnection.getConnection();
            String insertQuery = "INSERT INTO parent (parent_name, phone, email, password) VALUES (?, ?, ?, ?)";

            PreparedStatement ps = connection.prepareStatement(insertQuery);
            ps.setString(1, parent_name);
            ps.setString(2, phone);
            ps.setString(3, email);
            ps.setString(4, password);

            int result = ps.executeUpdate();
            connection.close();

            if (result > 0) {
                out.println("<h3>Parent Registration Successful!</h3>");
                out.println("<p>Parent <strong>" + parent_name + "</strong> has been registered.</p>");
                out.println("<a href='login.jsp'>Go to Login</a>");
            } else {
                out.println("<h3>Registration failed. Please try again.</h3>");
            }

        } catch (Exception e) {
            if(e.getMessage().contains("Duplicate entry")) {
                out.println("<h3>Error: Phone or Email already exists!</h3>");
                out.println("<a href='ParentRegistration.jsp'>Try Again</a>");
            } else {
                e.printStackTrace(out);
            }
        }
    }
}
