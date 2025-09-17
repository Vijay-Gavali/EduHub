package com.controller;

import java.awt.Taskbar.State;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.dbconnection.DBConnection;
import com.model.Classes;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AdminViewClassesController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<Classes> classList = new ArrayList<>();

		try {
			Connection connection = DBConnection.getConnection();
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery("SELECT * FROM class");

			while (resultSet.next()) {
				Classes cls = new Classes();
				cls.setClassId(resultSet.getInt("class_id"));
				cls.setClassName(resultSet.getString("class_name"));
				cls.setTeacherId(resultSet.getInt("user_id"));
				cls.setFees(resultSet.getInt("fees"));

				classList.add(cls);
			}
			connection.close();
			request.setAttribute("classList", classList);
			RequestDispatcher dispatcher = request.getRequestDispatcher("AdminViewClasses.jsp");
			dispatcher.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
