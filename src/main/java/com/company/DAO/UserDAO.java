package com.company.DAO;

import java.security.interfaces.RSAKey;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.company.user.UserDetails;

public class UserDAO {
	
	private Connection con;

	public UserDAO(Connection con) {
		super();
		this.con = con;
	}

	public boolean addUser(UserDetails us) {
		
		try {
			String query = "INSERT INTO users(name , email , password) VALUES(?,?,?)";
			
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, us.getName());
			pstmt.setString(2, us.getEmail());
			pstmt.setString(3, us.getPassword());
			
			int rows = pstmt.executeUpdate();
			System.out.println("bc user add hogaya..");
			return rows >0;
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
		
	}
	
	
	public UserDetails isValidUser(UserDetails us) {
			
			UserDetails users = null;
		try {
			String  query = "SELECT * FROM users WHERE email=? AND password=?";
			
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, us.getEmail());
			pstmt.setString(2, us.getPassword());
			
			
			
			ResultSet set = pstmt.executeQuery();
			
			if(set.next()) {
				users = new UserDetails();
				users.setId(set.getInt("id"));
				users.setName(set.getString("name"));
				users.setEmail(set.getString("email"));
				users.setPassword(set.getString("password"));
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("user nai h bhai....");
			
		}
		
		return users;
	}
	

}
