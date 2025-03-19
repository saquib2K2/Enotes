package com.company.user;

import java.sql.Date;

public class PostDetails {
	
	
	private int id;
	private String title;
	private String content;
	private Date date;
	private UserDetails users;
	
	
	public PostDetails() {
		super();
		// TODO Auto-generated constructor stub
	}


	public PostDetails(int id, String title, String content, Date date, UserDetails users) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.date = date;
		this.users = users;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public Date getDate() {
		return date;
	}


	public void setDate(Date date) {
		this.date = date;
	}


	public UserDetails getUsers() {
		return users;
	}


	public void setUsers(UserDetails users) {
		this.users = users;
	}
	
	

}
