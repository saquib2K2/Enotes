<%@page import="jakarta.websocket.Session"%>
<%@page import="java.util.List, java.util.ArrayList"%>
<%@page import="com.company.user.PostDetails"%>
<%@page import="com.company.Db.DBConnection"%>
<%@page import="com.company.DAO.PostDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
UserDetails user1 = (UserDetails) session.getAttribute("userD");

if (user1 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("login-error", "please login");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="all_component/allcss.jsp"%>
</head>
<body>
	<%@ include file="all_component/navbar.jsp"%>
	
	<%
	String update = (String) session.getAttribute("updateMsg");
	if (update != null) {
	%>
	<div class="alert alert-success" role="alert"><%= update %></div>
	<%
	session.removeAttribute("updateMsg");
	}
	 
	%>
	
	<%
	String delete = (String) session.getAttribute("deleteMsg");
	if (delete != null) {
	%>
	<div class="alert alert-success" role="alert"><%= delete %></div>
	<%
	session.removeAttribute("deleteMsg");
	}
	 
	%>
	

	<div class="container mt-4">
		<div class="row">
			<!-- Example Note Card -->
			<div class="col-md-4">
			<%
						
						
						if (user1 != null) {

							PostDao ob = new PostDao(DBConnection.getConnection());
							List<PostDetails> post = ob.getData(user1.getId());
							
							for(PostDetails po:post){
								%>
								<div class="card shadow-sm">
								<div class="card-body">
										
									
									

									<h5 class="card-title"><%= po.getTitle() %></h5>
									<p class="card-text"><%=po.getContent() %></p>
									<div class="d-flex justify-content-end">
									<a href="edit.jsp?note_id=<%= po.getId() %>" class="btn btn-primary btn-sm me-2">Edit</a>
									<a  href="DeleteServlet?note_id=<%= po.getId() %>" class="btn btn-danger btn-sm">Delete</a>
									</div>
								</div>
							</div>
						<%		
							}
						}
						%>
				
			</div>

			<!-- Repeat the above card dynamically for each note -->
		</div>
	</div>


</body>
</html>