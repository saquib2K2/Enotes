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


	<%
	Integer noteId = Integer.parseInt(request.getParameter("note_id"));
	PostDao ob = new PostDao(DBConnection.getConnection());
	PostDetails p = ob.getDataById(noteId);
	%>

	<%@ include file="all_component/navbar.jsp"%>


	<div class="container py-4 ">
		<div class="row">
			<div class="col-md-8 offset-md-2">
				<h2 class="text-center">Edit Your Notes</h2>



				<form action="EditNoteServlet" method="post">
					<input type="hidden" value="<%=noteId%>" name="nid">
					<div class="form-group">
						<label for="exampleInputEmail1">Title</label> <input type="text"
							name="title" value="<%=p.getTitle()%>" class="form-control"
							placeholder="Add a tile">
					</div>

					<div class="form-group">
						<label for="exampleInputEmail1">Note</label>
						<textarea name="content" rows="9" cols="7" class="form-control"><%=p.getContent()%></textarea>
					</div>

					<button type="submit" class="btn btn-primary">Submit</button>
				</form>

			</div>
		</div>

	</div>

	<%@ include file="all_component/footer.jsp"%>

</body>
</html>