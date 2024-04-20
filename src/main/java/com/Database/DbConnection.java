package com.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {
private static Connection con = null;
	
//	@SuppressWarnings("deprecation")
	public static Connection getConnection() throws SQLException, ClassNotFoundException {
		if(con==null) {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Successfully connected with database");
			con = DriverManager.getConnection("jdbc:mysql://localhost", "root", "1234");
		}
		return con;
	}
}
