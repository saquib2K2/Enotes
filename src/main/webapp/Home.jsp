<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
UserDetails user1 = (UserDetails) session.getAttribute("userD");

if (user1 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("login-error", "please login ");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="all_component/allcss.jsp" %>
</head>
<body>
	
	<!-- including nav bar -->
	<%@ include file="all_component/navbar.jsp" %>
	
	
	
<div class="container-fluid back-img ">

	<div class="text-center " style=' margin:100px;'>
		<h1 >Create Your Notes</h1>
		<a href="addNotes.jsp" class="btn btn-light"><i class="fa-solid fa-plus"></i></i> Create</a>
		
	</div>

</div>


	<%@ include file="all_component/footer.jsp" %>
</body>
</html>