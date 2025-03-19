package com.company.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.company.DAO.PostDao;
import com.company.Db.DBConnection;

/**
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Integer noteId =  Integer.parseInt(request.getParameter("note_id"));
		PostDao obDao = new PostDao(DBConnection.getConnection());
		
		boolean delete = obDao.deleteNotes(noteId);
		
		if(delete) {
			HttpSession session = request.getSession();
			System.out.println("note deleted successfully...");
			session.setAttribute("deleteMsg", "Note deleted Successfully....");
			response.sendRedirect("showNotes.jsp");
			
		}else {
			System.out.println("error aa gaya..");
		}
		
	}



}




















