package com.company.Db;

import java.net.PasswordAuthentication;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	
	private static Connection con;
	private static final String url =  "jdbc:postgresql://127.0.0.1:5432/enotes";
	private static final String username = "postgres";
	private static final String  password = "root";
	
	public static Connection getConnection() {
		
		try {
			if(con == null) {
				Class.forName("org.postgresql.Driver");
				System.out.println("connection build ho raha h..");
				con = DriverManager.getConnection(url, username, password);
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return con;
	}

}
