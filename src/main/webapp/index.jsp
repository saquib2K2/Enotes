<%@page import="com.company.Db.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
.back-img {
background: url("img/hero.jpg") no-repeat center center / cover;
width: 100%;
height: 100vh;
}
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="all_component/allcss.jsp" %>
</head>
<body>



<%@ include file="all_component/navbar.jsp" %>

<div class="container-fluid back-img ">

	<div class="text-center  ">
		<h1 >Create your notes</h1>
		<a href="login.jsp" class="btn btn-light"><i class="fa-solid fa-right-to-bracket fa-sm"></i> Login</a>
		<a href="register.jsp" class="btn btn-light"><i class="fa-solid fa-user fa-sm" ></i> Register</a>
	</div>

</div>

<%@ include file="all_component/footer.jsp" %>

</body>
</html>