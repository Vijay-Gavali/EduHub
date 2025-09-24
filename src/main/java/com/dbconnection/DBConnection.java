package com.dbconnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Scanner;

public class DBConnection {

	public static Connection getConnection() {

		Connection con = null;
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eduhub", "root", "root123");
			System.out.println("Connection successfull !!\n");

		} catch (Exception e) {
			System.err.println(e);
		}

		return con;
	}
}