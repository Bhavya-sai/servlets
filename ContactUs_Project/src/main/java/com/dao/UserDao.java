package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao 
{
	private static String url = "jdbc:postgresql://localhost:5432/postgres";
	private static String username = "postgres";
	private static String pwd = "postgres";

	private static final String query = "SELECT * FROM Admin_Login_Credentials WHERE username=? and password=?";

	public static boolean getData(String email, String password) {

		try {
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection(url, username, pwd);
			PreparedStatement stmt = con.prepareStatement(query);
			
			stmt.setString(1, email);
			stmt.setString(2, password);
			
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

}
