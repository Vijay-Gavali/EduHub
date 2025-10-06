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

		response.setContentType("text/html;charset=UTF-8");

		final String ROLE_TEACHER = "Teacher";
		PrintWriter out = response.getWriter();

		try {

			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String contact_no = request.getParameter("contact_no");
			String class_id = request.getParameter("class_id");

			if (class_id == null || class_id.isEmpty()) {
				out.println("<script>alert('⚠ Please select a class for the teacher');"
						+ "window.location='AdminTeacherRegistration.jsp';</script>");
				return;
			}

			Connection connection = DBConnection.getConnection();

			String insertQuery = "INSERT INTO users (name, email, password, phone, role, class_id) VALUES (?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = connection.prepareStatement(insertQuery);
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, password);
			ps.setString(4, contact_no);
			ps.setString(5, ROLE_TEACHER);
			ps.setInt(6, Integer.parseInt(class_id));

			int rowsAffected = ps.executeUpdate();

			ps.close();
			connection.close();

			if (rowsAffected > 0) {
				out.println("<script>" + "alert('Teacher registered successfully!');"
						+ "window.location='AdminTeacherRegistrationPrint.jsp?name=" + name + "&email=" + email
						+ "&contact_no=" + contact_no + "&class_id=" + class_id + "';"
						+ "</script>");
			} else {
				out.println("<script>" + "alert('Failed to register teacher!');"
						+ "window.location='AdminTeacherRegistration.jsp';" + "</script>");
			}

		} catch (Exception e) {
			System.out.println(e);
			out.println("<script>" + "alert('Failed to register teacher!');"
					+ "window.location='AdminTeacherRegistration.jsp';" + "</script>");
		}
	}
}
