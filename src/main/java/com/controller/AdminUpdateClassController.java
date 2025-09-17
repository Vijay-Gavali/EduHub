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

public class AdminUpdateClassController extends HttpServlet {

	// Display the update form
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String classId = request.getParameter("classId");

		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM class WHERE class_id = ?");
			ps.setInt(1, Integer.parseInt(classId));

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				Map<String, Object> cls = new HashMap<>();
				cls.put("classId", rs.getInt("class_id"));
				cls.put("className", rs.getString("class_name"));
				cls.put("teacherId", rs.getInt("user_id"));
				cls.put("fees", rs.getInt("fees"));

				request.setAttribute("class", cls);
			}

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("AdminClassUpdate.jsp");
		dispatcher.forward(request, response);
	}

	// Handle the form submission
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String classId = request.getParameter("classId");
		String className = request.getParameter("className");
		String teacherId = request.getParameter("teacherId");
		String fees = request.getParameter("fees");

		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con
					.prepareStatement("UPDATE class SET class_name = ?, user_id = ?, fees = ? WHERE class_id = ?");

			ps.setString(1, className);
			ps.setInt(2, Integer.parseInt(teacherId));
			ps.setInt(3, Integer.parseInt(fees));
			ps.setInt(4, Integer.parseInt(classId));

			ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		response.sendRedirect("AdminViewClassesController");
	}
}
