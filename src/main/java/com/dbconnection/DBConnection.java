package com.dbconnection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

	public static Connection getConnection() {
		
		Connection con = null;
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eduhub", "root", "root");
			System.out.println("Connection successfully");

		} catch (Exception e) {
			System.err.println(e);
		}
		return con;
	}
}