package com.company.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.company.DAO.PostDao;
import com.company.Db.DBConnection;
import com.company.user.PostDetails;

/**
 * Servlet implementation class AddNotesServlet
 */
@WebServlet("/AddNotesServlet")
public class AddNotesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddNotesServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int uid = Integer.parseInt(request.getParameter("uid"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		/*
		 * PostDetails ps = new PostDetails();
		 * 
		 * ps.setTitle(title); ps.setContent(content);
		 */
		
		PostDao dao = new PostDao(DBConnection.getConnection());
		
		if(dao.addNotes(title ,content , uid)) {
			System.out.println("data inserted successfully");
			response.sendRedirect("showNotes.jsp");
		}else {
			System.out.println("failed....");
		}
	}

}
