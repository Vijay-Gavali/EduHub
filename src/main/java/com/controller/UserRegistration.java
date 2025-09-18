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

public class UserRegistration extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		try {

			String admission_no = request.getParameter("admission_no");
			String admission_date = request.getParameter("admission_date");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String father_name = request.getParameter("father_name");
			String mother_name = request.getParameter("mother_name");
			String dob = request.getParameter("dob");
			String aadhar_no = request.getParameter("aadhar_no");
			String parent_aadhar = request.getParameter("parent_aadhar");
			String phone = request.getParameter("phone");
			String contact_no = request.getParameter("contact_no");
			String role = request.getParameter("role");

			// Only Students will use these fields
			String ageStr = request.getParameter("age");
			int age = (ageStr != null && !ageStr.isEmpty()) ? Integer.parseInt(ageStr) : 0;
			String grade = request.getParameter("grade");

			Connection connection = DBConnection.getConnection();
			String insertQuery = "INSERT INTO users (admission_no, admission_date, name, father_name, mother_name, dob, "
					+ "aadhar_no, parent_aadhar, phone, email, password, contact_no, role, age, grade, class_id) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NULL)";

			PreparedStatement ps = connection.prepareStatement(insertQuery);
			ps.setString(1, admission_no);
			ps.setString(2, admission_date);
			ps.setString(3, name);
			ps.setString(4, father_name);
			ps.setString(5, mother_name);
			ps.setString(6, dob);
			ps.setString(7, aadhar_no);
			ps.setString(8, parent_aadhar);
			ps.setString(9, phone);
			ps.setString(10, email);
			ps.setString(11, password);
			ps.setString(12, contact_no);
			ps.setString(13, role);
			ps.setInt(14, age);
			ps.setString(15, grade);
//			ps.setNull(16, java.sql.Types.INTEGER);

			// Only set class_id if role is Student
//			if ("Student".equals(role)) {
//				String classIdStr = request.getParameter("class_id");
//				if (classIdStr != null && !classIdStr.isEmpty()) {
//					ps.setInt(16, Integer.parseInt(classIdStr));
//				} else {
//					ps.setNull(16, java.sql.Types.INTEGER);
//				}
//			} else {
//				ps.setNull(16, java.sql.Types.INTEGER); // Parents do not have class_id
//			}

			ps.executeUpdate();
			connection.close();

			// Display simple success message
			out.println("<h3>Registration Successful!</h3>");
			out.println("<p>User <strong>" + name + "</strong> has been registered.</p>");

		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
