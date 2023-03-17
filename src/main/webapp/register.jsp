<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Page</title>
<%@include file="all_components/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="all_components/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card mt-2">

					<div class="card-header text-center">
						<h4>Registration Form</h4>

						<c:if test="${not empty regMsgSuccess }">
							<p class="text-center text-success">${regMsgSuccess }</p>
							<c:remove var="regMsgSuccess" scope="session"/>
						</c:if>

						<c:if test="${not empty regMsgError }">
							<p class="text-center text-danger">${regMsgError }</p>
							<c:remove var="regMsgError" scope="session"/>
						</c:if>
						
						<c:if test="${not empty checkMsg }">
							<p class="text-center text-danger">${checkMsg }</p>
							<c:remove var="checkMsg" scope="session"/>
						</c:if>

					</div>
					<div class="card-body">
						<form action="registerUser" method="post">

							<div class="form-group">
								<label for="username">Email Username</label> <input type="text"
									class="form-control" id="username" name="name"
									aria-describedby="emailHelp" placeholder="Enter Username">

							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Email Email Address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									name="email" aria-describedby="emailHelp"
									placeholder="Enter email">

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Enter Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									name="password" placeholder="Password">
							</div>

							<div class="form-group">
								<label for="phone">Enter Phone</label> <input type="phone"
									class="form-control" id="phone" name="phone"
									aria-describedby="emailHelp" placeholder="Enter Phone">

							</div>
							<div class="form-check">
								<input type="checkbox" class="form-check-input"
									id="exampleCheck1" name="check"> <label
									class="form-check-label" for="exampleCheck1">Agree
									Conditions</label>
							</div>
							<div class="container text-center">
								<button type="submit" class="btn btn-primary">Submit</button>
								<button type="reset" class="btn btn-warning">Reset</button>
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