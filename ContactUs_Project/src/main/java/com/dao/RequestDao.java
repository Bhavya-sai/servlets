package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.model.Request;

public class RequestDao 
{
	private static String url = "jdbc:postgresql://localhost:5432/postgres";
	private static String username = "postgres";
	private static String password = "postgres";
	
	private static final String insertQuery = "INSERT INTO contact_messages (name, email, message, status) VALUES (?, ?, ?, ?)";
	private static final String requestQuery = "SELECT * FROM contact_messages";
	private static final String updateArchiveQuery = "UPDATE contact_messages SET status = 'archive' WHERE id=?";
	private static final String updateActiveQuery = "UPDATE contact_messages SET status = 'active' WHERE id=?";

	
	public static void insertContactData(String name, String email, String message) {
		try {
			Class.forName("org.postgresql.Driver");
			try(Connection con= DriverManager.getConnection(url, username, password);
				PreparedStatement preparedStatement= con.prepareStatement(insertQuery)) {
				
				preparedStatement.setString(1, name);
				preparedStatement.setString(2, email);
				preparedStatement.setString(3, message);
				preparedStatement.setString(4, "active");
				preparedStatement.executeUpdate();
			}
		}
		catch(ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void updateStatus(int id, String status) {
		String query = status.equals("archive") ? updateArchiveQuery : updateActiveQuery;
		try (Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement(query)) {
			st.setInt(1, id);
			st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static List<Request> getRequestsData() {
		List<Request> requests = new ArrayList<>();
		try (Connection con = DriverManager.getConnection(url, username, password);
			Statement statement = con.createStatement();) {
			ResultSet rs = statement.executeQuery(requestQuery);
			
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String message = rs.getString("message");
				String status = rs.getString("status");
				
				Request req = new Request();
				req.setId(id);
				req.setName(name);
				req.setEmail(email);
				req.setMessage(message);
				req.setStatus(status);
				requests.add(req);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return requests;
	}

}
