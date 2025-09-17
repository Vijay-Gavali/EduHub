package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.dbconnection.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        try {
            Connection connection = DBConnection.getConnection();
            String query = "SELECT * FROM users WHERE email=? AND password=? AND role=?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            ps.setString(3, role);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // User found, create session
                HttpSession session = request.getSession();
                session.setAttribute("user_id", rs.getInt("user_id"));
                session.setAttribute("name", rs.getString("name"));
                session.setAttribute("role", rs.getString("role"));

                // Redirect to respective dashboard
                if ("Admin".equals(role)) {
                    response.sendRedirect("AdminDashboard.jsp");
                } else if ("Parent".equals(role)) {
                    response.sendRedirect("UserDashboard.jsp");
                } else if ("Teacher".equals(role)) {
                    response.sendRedirect("TeacherDashboard.jsp");
                }
            } else {
                // Invalid login
                response.getWriter().println("<h3>Invalid email/password/role combination</h3>");
            }

            connection.close();

        } catch (Exception e) {
            e.printStackTrace(response.getWriter());
        }
    }
}
