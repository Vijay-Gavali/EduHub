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

public class AdminTeacherRegistration extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String contact_no = request.getParameter("contact_no");
			String role = request.getParameter("role");
			String age = request.getParameter("age");
			String grade = request.getParameter("grade");
			String class_id = request.getParameter("class_id");

			Connection connection = DBConnection.getConnection();

            String insertQuery = "INSERT INTO users (name, email, password, contact_no, role, age, grade, class_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(insertQuery);
            
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, contact_no);
            ps.setString(5, role);
            ps.setString(6, age);
            ps.setString(7, grade);
            ps.setString(8, class_id);
            
            ps.executeUpdate();
            connection.close();
			
			PrintWriter out = response.getWriter();
			out.println("<h3>User registered successfully!</h3>");
			
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
