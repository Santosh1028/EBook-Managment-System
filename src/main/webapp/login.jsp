<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<%@include file="all_components/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="all_components/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-5 offset-md-4">
				<div class="card mt-2">

					<div class="card-header text-center">
						<h4>Login Form</h4>

						<c:if test="${not empty invalidUser }">
							<p class="text-center text-danger">${invalidUser }</p>
							<c:remove var="invalidUser" scope="session" />
						</c:if>

						<c:if test="${not empty logoutMsg }">
							<h6 class="text-center text-success">${logoutMsg }</h6>
							<c:remove var="logoutMsg" scope="session" />
						</c:if>
					</div>
					<div class="card-body">
						<form action="loginUser" method="post">
							<div class="form-group">
								<label for="email">Email Email Address</label> <input
									type="email" class="form-control" id="Email" name="email"
									aria-describedby="emailHelp" placeholder="Enter email" required>

							</div>
							<div class="form-group">
								<label for="password">Enter Password</label> <input
									type="password" class="form-control" id="password"
									name="password" placeholder="Password" required>
							</div>
							<div class="container text-center">
								<button type="submit" class="btn btn-primary">Login</button>
								<button type="reset" class="btn btn-warning">Reset</button>
								<br> <a href="register.jsp">Create Account</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="all_components/footer.jsp"%>
</body>
</html>