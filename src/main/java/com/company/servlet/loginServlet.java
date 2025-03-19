package com.company.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.company.DAO.UserDAO;
import com.company.Db.DBConnection;
import com.company.user.UserDetails;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("uEmail");
		String password= request.getParameter("uPassword");
		
		UserDetails us =new UserDetails();
		us.setEmail(email);
		us.setPassword(password);
		
		System.out.println("login "+email);
		System.out.println("login "+password);
		
		UserDAO dao = new UserDAO(DBConnection.getConnection());
		
		HttpSession session;
		
		UserDetails user = dao.isValidUser(us);
		
	
		if(user != null) {
			session = request.getSession();
			session.setAttribute("userD", user);
			response.sendRedirect("Home.jsp");
		}
		else {
			session =  request.getSession();
			session.setAttribute("failed", "Invalid username or Password");
			response.sendRedirect("login.jsp");
		}	
		
		
	}

}




















