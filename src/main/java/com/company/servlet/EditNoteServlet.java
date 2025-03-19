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


public class EditNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditNoteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			Integer noteid =  Integer.parseInt(request.getParameter("nid"));
			
			
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			
			PostDao ob = new PostDao(DBConnection.getConnection());
			boolean update = ob.postUpdate(noteid, title, content);
			
			
			if(update) {
				HttpSession session = request.getSession();
				System.out.println("note updated");
				response.sendRedirect("showNotes.jsp");
				session.setAttribute("updateMsg", "Note updated successfully.....");
			}else {
				System.out.println("error in update");
				response.sendRedirect("edit.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
