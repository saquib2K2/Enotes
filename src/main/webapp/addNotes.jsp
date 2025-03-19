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

	<!-- including nav bar -->
	<%@ include file="all_component/navbar.jsp"%>

	<div class="container py-4 ">
		<div class="row">
			<div class="col-md-8 offset-md-2">
				<h2 class="text-center">Add Your Notes</h2>
				<form action="AddNotesServlet" method="post">
					<div class="form-group">

						<%
						UserDetails us = (UserDetails) session.getAttribute("userD");
						%>
						<%
						if (user1 != null) {
						%>
						<input type="hidden" name="uid" value="<%=us.getId()%>">
						<%
						}
						%>




						<label for="exampleInputEmail1">Title</label> <input type="text"
							name="title" class="form-control" placeholder="Add a tile">
					</div>

					<div class="form-group">
						<label for="exampleInputEmail1">Note</label>
						<textarea name="content" rows="9" cols="7" class="form-control"></textarea>
					</div>

					<button type="submit" class="btn btn-primary">Submit</button>
				</form>

			</div>
		</div>

	</div>

	<%@ include file="all_component/footer.jsp"%>

</body>
</html>