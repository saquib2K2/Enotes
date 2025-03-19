<%@page import="com.company.user.UserDetails"%>
<%@page import="org.apache.catalina.UserDatabase"%>
<nav
	class="navbar navbar-expand-lg navbar-dark bg-custom  navbar-custom mt-20">
	<a class="navbar-brand ml-2" href="#">Navbar</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="Home.jsp"><i
					class="fa-solid fa-house fa-sm "></i> Home <span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="addNotes.jsp"><i
					class="fa-solid fa-plus fa-sm"></i> Add Notes</a></li>

			<li class="nav-item"><a class="nav-link " href="showNotes.jsp"><i
					class="fa-solid fa-book fa-sm"></i> Show Notes</a></li>
		</ul>
		<form class="form-inline my-2 my-lg-0">


			<%
			UserDetails user = (UserDetails) session.getAttribute("userD");

			if (user != null) {
			%>
			<a href="" class="btn btn-light my-2 my-sm-0 mr-2"
				data-toggle="modal" data-target="#exampleModal"> <i
				class="fa-solid fa-right-to-bracket fa-sm"></i> <%=user.getName()%></a>
			<a href="LogoutServlet" class="btn btn-light my-2 my-sm-0">
			 <i	class="fa-solid fa-user fa-sm"></i> Logout</a>

			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">

							<div class="container text-center">

								<i class="fa-solid fa-circle-user fa-3x"></i>
								<h5></h5>

								<table class="table">

									<tbody>
										<tr>
											<th>User Id</th>
											<td><%=user.getId()%></td>
										</tr>

										<tr>
											<th>Full Name</th>
											<td><%=user.getName()%></td>
										</tr>

										<tr>
											<th>Email Id</th>
											<td><%=user.getEmail()%></td>
										</tr>


									</tbody>
								</table>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
							</div>


						</div>
					</div>
				</div>
			</div>
			<%
			} else {
			%>
			<a href="login.jsp" class="btn btn-light my-2 my-sm-0 mr-2"> <i
				class="fa-solid fa-right-to-bracket fa-sm"></i> Login
			</a> <a href="register.jsp" class="btn btn-light my-2 my-sm-0"> <i
				class="fa-solid fa-user fa-sm"></i> Register
			</a>

			<%
			}
			%>


		</form>

	</div>


</nav>