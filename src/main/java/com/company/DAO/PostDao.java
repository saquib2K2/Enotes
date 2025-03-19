package com.company.DAO;
import com.company.user.PostDetails;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.swing.text.html.HTMLDocument.HTMLReader.PreAction;

import com.company.user.PostDetails;

public class PostDao {
	
	private Connection con;

	public PostDao(Connection con) {
		super();
		this.con = con;
	}
	
	public boolean addNotes(String ti, String cont , int id){
		
		try {
			
			String query = "INSERT INTO post(title , content , uid) VALUES(?,?,?)";
			
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1,ti );
			pstmt.setString(2, cont);
			pstmt.setInt(3, id);
			
			
			int row = pstmt.executeUpdate();
			
			return row >0;
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
		
	}
	
	
	
	public List<PostDetails> getData(int id){
		List<PostDetails> list = new ArrayList<PostDetails>();
		
		PostDetails pd = null;
		
		try {
			String query = "SELECT * FROM post WHERE uid = ?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, id);
			
			ResultSet set = pstmt.executeQuery();
			
			while(set.next()) {
				pd = new PostDetails();
				pd.setId(set.getInt("id"));
				pd.setTitle(set.getString("title"));
				pd.setContent(set.getString("content"));
				pd.setDate(set.getDate(4));
				list.add(pd);
			}
			
			
		} catch (Exception e) {

			e.printStackTrace();
		}
		
		
		
		return list;
	}
	
	
	
	
	
	public PostDetails getDataById(int id) {
		
		PostDetails p = null;
		
		try {
			
			String query = "SELECT * FROM post WHERE id = ?";
			
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, id);
			
			ResultSet set = pstmt.executeQuery();
			
			if(set.next()) {
				p = new PostDetails();
				p.setId(set.getInt(1));
				p.setTitle(set.getString(2));
				p.setContent(set.getString(3));
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return p;
	}
	
	
	
	
	
	public boolean postUpdate(int nid , String ti , String cont) {
		
		try {
			String query = "UPDATE post SET title=? , content = ? WHERE id = ?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, ti);
			pstmt.setString(2, cont);
			pstmt.setInt(3, nid);
			
			
			
			int row = pstmt.executeUpdate();
			return row>0;
		} catch (Exception e) {
			
			e.printStackTrace();
			return false;
		}
		
		
		
	}
	
	
	public boolean deleteNotes(int id) {
		
		try {
			
			String query = "DELETE FROM post WHERE id=?";
			
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, id);
			
			int row = pstmt.executeUpdate();
			
			return row>0;
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
		
	
	}
	
	
	
	
	
	
	
	
	
	
	
	

}
