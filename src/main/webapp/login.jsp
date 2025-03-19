<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="all_component/allcss.jsp"%>
</head>
<body>

	<%@ include file="all_component/navbar.jsp"%>

	<div class="container-fluid div-color">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-5 md-5">
					<div class="card-header text-center bg-custom">
						<i class="fa-solid fa-user-plus fa-3x"></i>
						<h3>Login</h3>
					</div>

					<!-- alert messages -->
					<!-- if registration successful -->

					<!-- if not successful  -->

					<%
					String failedMsg = (String) session.getAttribute("failed");
					if (failedMsg != null) {
					%>
					<div class="alert alert-success" role="alert"><%=failedMsg%></div>
					<%
					session.removeAttribute("failed");
					}
					%>

					<% 
					String logError = (String) session.getAttribute("login-error");
					if (logError != null) {
					%>
					<div class="alert alert-success" role="alert"><%=logError%></div>
					<%
					
					session.removeAttribute("login-error");
					}
					%>
						
						
					<%
					String logoutmsg = (String) session.getAttribute("logout");
					if(logoutmsg != null){
					%>
					<div class="alert alert-success" role="alert"><%= logoutmsg %></div>
					<%
					session.removeAttribute("logout");
					}
					%>

					<div class="card-body">
						<form action="loginservlet" method="post">

							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" name="uEmail" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" name="uPassword" class="form-control"
									id="exampleInputPassword1" placeholder="Password">
							</div>

							<button type="submit"
								class="btn btn-primary badge-pill btn-block">Register</button>
						</form>
					</div>
				</div>

			</div>
		</div>


	</div>

	<%@ include file="all_component/footer.jsp"%>



</body>
</html>