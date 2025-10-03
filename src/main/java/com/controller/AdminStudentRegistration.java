package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.dbconnection.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AdminStudentRegistration extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		Connection connection = null;
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		ResultSet rs = null;

		try {
			// Collect form data
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
			String ageStr = request.getParameter("age");
			String grade = request.getParameter("grade");
			String address = request.getParameter("address");
			String class_id_str = request.getParameter("class_id");

			if (class_id_str == null || class_id_str.isEmpty()) {
				out.println("<script>alert('⚠ Please select a class for the student');"
						+ "window.location='AdminStudentRegistration.jsp';</script>");
				return;
			}

			int class_id = Integer.parseInt(class_id_str);
			int age = (ageStr != null && !ageStr.isEmpty()) ? Integer.parseInt(ageStr) : 0;

			connection = DBConnection.getConnection();
			java.sql.Date admission_date = new java.sql.Date(System.currentTimeMillis());

			String insertQuery = "INSERT INTO users (admission_date, name, father_name, mother_name, dob, "
					+ "aadhar_no, parent_aadhar, phone, address, email, password, contact_no, role, age, grade, class_id) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

			ps = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);

			ps.setDate(1, admission_date);
			ps.setString(2, name);
			ps.setString(3, father_name);
			ps.setString(4, mother_name);
			ps.setString(5, dob);
			ps.setString(6, aadhar_no);
			ps.setString(7, parent_aadhar);
			ps.setString(8, phone);
			ps.setString(9, address);
			ps.setString(10, email);
			ps.setString(11, password);
			ps.setString(12, contact_no);
			ps.setString(13, "Student");
			ps.setInt(14, age);
			ps.setString(15, grade);
			ps.setInt(16, class_id);

			int rowsAffected = ps.executeUpdate();

			if (rowsAffected > 0) {
				rs = ps.getGeneratedKeys();
				int userId = 0;
				String admissionNo = "";
				if (rs.next()) {
					userId = rs.getInt(1);
					admissionNo = "ADM" + String.format("%05d", userId);

					String updateQuery = "UPDATE users SET admission_no = ? WHERE user_id = ?";
					ps2 = connection.prepareStatement(updateQuery);
					ps2.setString(1, admissionNo);
					ps2.setInt(2, userId);
					ps2.executeUpdate();
				}

				// Redirect to print page with data in URL parameters
				String url = "AdminStudentRegistrationPrint.jsp?name=" + name + "&email=" + email + "&contact_no="
						+ contact_no + "&father_name=" + father_name + "&mother_name=" + mother_name + "&dob=" + dob
						+ "&aadhar_no=" + aadhar_no + "&parent_aadhar=" + parent_aadhar + "&phone=" + phone
						+ "&address=" + address + "&age=" + age + "&grade=" + grade + "&class_id=" + class_id
						+ "&admission_no=" + admissionNo + "&password=" + password;

				out.println("<script>" + "alert('Student registered successfully! Admission No: " + admissionNo + "');"
						+ "window.location='" + url + "';" + "</script>");

			} else {
				out.println("<script>" + "alert('❌ Registration failed!');"
						+ "window.location='AdminStudentRegistration.jsp';" + "</script>");
			}

		} catch (Exception e) {
			e.printStackTrace();
			out.println("<script>" + "alert('❌ Error during registration!');"
					+ "window.location='AdminStudentRegistration.jsp';" + "</script>");
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (ps2 != null)
					ps2.close();
				if (connection != null)
					connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
