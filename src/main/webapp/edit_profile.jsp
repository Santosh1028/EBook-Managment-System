<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile..</title>
<%@include file="all_components/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">

	<c:if test="${not empty loggedUser }">

	</c:if>
	<%@include file="all_components/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card mt-2">

					<div class="card-header text-center">
						<h4>Edit Profile</h4>

						<c:if test="${not empty updtMsgSuccess }">
							<p class="text-center text-success">${updtMsgSuccess }</p>
							<c:remove var="updtMsgSuccess" scope="session" />
						</c:if>

						<c:if test="${not empty updtMsgError }">
							<p class="text-center text-danger">${updtMsgError }</p>
							<c:remove var="updtMsgError" scope="session" />
						</c:if>


						<c:if test="${not empty passtMsgError }">
							<p class="text-center text-danger">${passtMsgError }</p>
							<c:remove var="passtMsgError" scope="session" />
						</c:if>


					</div>
					<div class="card-body">
						<form action="updateUser" method="post">

							<input type="hidden" name="id" value="${loggedUser.id }">

							<div class="form-group">
								<label for="username">Email Username</label> <input type="text"
									class="form-control" id="username" name="name"
									aria-describedby="emailHelp" placeholder="Enter Username"
									value="${loggedUser.name }">

							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Email Email Address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									name="email" aria-describedby="emailHelp"
									placeholder="Enter email" value="${loggedUser.email }">

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Enter Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									name="password" placeholder="Password"
									value="${loggedUser.password }">
							</div>

							<div class="form-group">
								<label for="phone">Enter Phone</label> <input type="phone"
									class="form-control" id="phone" name="phone"
									aria-describedby="emailHelp" placeholder="Enter Phone"
									value="${loggedUser.phone }">

							</div>

							<div class="container text-center">
								<button type="submit" class="btn btn-primary">Update</button>
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