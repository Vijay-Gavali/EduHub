package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

import com.dbconnection.DBConnection;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AdminUpdateUserController extends HttpServlet {

	// Display the update form
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String userId = request.getParameter("userId");

		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE user_id = ?");
			ps.setInt(1, Integer.parseInt(userId));

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				Map<String, Object> user = new HashMap<>();
				user.put("user_id", rs.getInt("user_id"));
				user.put("name", rs.getString("name"));
				user.put("email", rs.getString("email"));
				user.put("contact_no", rs.getString("contact_no"));
				user.put("role", rs.getString("role"));
				user.put("age", rs.getInt("age"));
				user.put("grade", rs.getString("grade"));
				user.put("class_id", rs.getInt("class_id"));

				request.setAttribute("user", user);
			}

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("AdminUserUpdate.jsp");
		dispatcher.forward(request, response);
	}

	// Process the form submission
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    String userId = request.getParameter("user_id");
	    String name = request.getParameter("name");
	    String email = request.getParameter("email");
	    String contactNo = request.getParameter("contact_no");
	    String role = request.getParameter("role");
	    String age = request.getParameter("age");
	    String grade = request.getParameter("grade");
	    String classId = request.getParameter("class_id");

	    try {
	        Connection con = DBConnection.getConnection();
	        PreparedStatement ps = con.prepareStatement(
	            "UPDATE users SET name = ?, email = ?, contact_no = ?, role = ?, age = ?, grade = ?, class_id = ? WHERE user_id = ?");

	        ps.setString(1, name);
	        ps.setString(2, email);
	        ps.setString(3, contactNo);
	        ps.setString(4, role);
	        ps.setInt(5, Integer.parseInt(age));
	        ps.setString(6, grade);
	        ps.setInt(7, Integer.parseInt(classId));  
	        ps.setInt(8, Integer.parseInt(userId));

	        ps.executeUpdate();
	        con.close();

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    response.sendRedirect("AdminUserController");
	}
}