package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.dbconnection.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AdminDeleteUserController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String userId = request.getParameter("userId");

		try {
			Connection con = DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("DELETE FROM users WHERE user_id = ?");
			ps.setInt(1, Integer.parseInt(userId));
			ps.executeUpdate();

			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		response.sendRedirect("AdminStudentViewController");
	}
}
