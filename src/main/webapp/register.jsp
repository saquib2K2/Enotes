
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

	<div class="container-fluid div-color ">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-5 md-5">
					<div class="card-header text-center bg-custom">
						<i class="fa-solid fa-user-plus fa-3x"></i>
						<h3>Registration</h3>
					</div>
					<!-- alert messages -->
					<!-- if registration successful -->

					<%
					String successMsg = (String) session.getAttribute("success");

					if (successMsg != null) {
					%>
					<div class="alert alert-success" role="alert"><%=successMsg%>..Please<a	href="login.jsp">Login</a>
					</div>

					<%
					session.removeAttribute("success");
					}
					%>

					<!-- if not successful  -->

					<%
					String failMsg = (String) session.getAttribute("failed");
					if (failMsg != null) {
					%>
					<div class="alert alert-success" role="alert"><%=failMsg%></div>
					<%
					session.removeAttribute("failed");
					}
					%>

					<div class="card-body custom">
						<form action="userServlet" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Enter name</label> <input
									type="text" name="uName" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">

							</div>
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