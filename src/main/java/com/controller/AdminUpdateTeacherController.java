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
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AdminUpdateTeacherController extends HttpServlet {

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
				user.put("contact_no", rs.getString("phone"));
				user.put("password", rs.getString("password"));
				user.put("role", rs.getString("role"));
				user.put("class_id", rs.getInt("class_id"));

				request.setAttribute("user", user);
			}

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("AdminTeacherUpdate.jsp");
		dispatcher.forward(request, response);
	}

	// Process the form submission
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    String userId = request.getParameter("user_id");
	    String name = request.getParameter("name");
	    String email = request.getParameter("email");
	    String contactNo = request.getParameter("contact_no");
	    String password = request.getParameter("password");
	    String classId = request.getParameter("class_id");

	    try {
	        Connection con = DBConnection.getConnection();
	        PreparedStatement ps = con.prepareStatement(
	                "UPDATE users SET name = ?, email = ?, phone = ?, password = ?, role = ?, class_id = ? WHERE user_id = ?");

	        ps.setString(1, name);
	        ps.setString(2, email);
	        ps.setString(3, contactNo);
	        ps.setString(4, password);
	        ps.setString(5, "Teacher");
	        ps.setInt(6, Integer.parseInt(classId)); 
	        ps.setInt(7, Integer.parseInt(userId));  

	        int rowsAffected = ps.executeUpdate();
	        con.close();

	        if (rowsAffected > 0) {
	            System.out.println("Teacher updated successfully");
	        } else {
	            System.out.println("No teacher found with ID: " + userId);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	        request.setAttribute("error", "Error updating teacher: " + e.getMessage());
	    }

	    response.sendRedirect("AdminUserController");
	}
}