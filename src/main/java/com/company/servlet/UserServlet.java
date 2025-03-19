package com.company.servlet;

import java.io.IOException;

import com.company.DAO.UserDAO;
import com.company.Db.DBConnection;
import com.company.user.UserDetails;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UserServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String name = req.getParameter("uName");
		String email = req.getParameter("uEmail");
		String password = req.getParameter("uPassword");
		
		
		UserDetails us = new UserDetails();
		us.setName(name);
		us.setEmail(email);
		us.setPassword(password);
		
		UserDAO dao = new UserDAO(DBConnection.getConnection());
		
		HttpSession session;
		
		if(dao.addUser(us)) {
			session = req.getSession();
			session.setAttribute("success", "Registration successfull...");
			resp.sendRedirect("register.jsp");
		}else {
			session = req.getSession();
			session.setAttribute("failed", "Registration failed...");
			resp.sendRedirect("register.jsp");
		}
		
	}

}
