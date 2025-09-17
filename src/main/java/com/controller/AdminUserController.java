package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.dbconnection.DBConnection;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AdminUserController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<Map<String, Object>> userList = new ArrayList<>();

		try {
			Connection con = DBConnection.getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM users;");

			while (rs.next()) {

				Map<String, Object> user = new HashMap<>();
				
				user.put("user_id", rs.getInt("user_id"));
				user.put("name", rs.getString("name"));
				user.put("email", rs.getString("email"));
				user.put("contact_no", rs.getString("contact_no"));
				user.put("role", rs.getString("role"));
				user.put("age", rs.getInt("age"));
				user.put("grade", rs.getString("grade"));
				user.put("class_id", rs.getInt("class_id"));

				userList.add(user);
			}

			con.close();

			request.setAttribute("userList", userList);
			RequestDispatcher dispatcher = request.getRequestDispatcher("AdminViewUsers.jsp");
			dispatcher.forward(request, response);

		} catch (Exception e) {
			System.out.println(e);
		}
	}
}