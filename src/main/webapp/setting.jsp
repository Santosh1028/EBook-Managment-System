<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Setting Page..</title>
<%@include file="all_components/allCss.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
}
</style>
</head>
<body style="background-color: #f7f7f7;">
	<c:if test="${empty loggedUser }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<%@include file="all_components/navbar.jsp"%>

	<div class="container">

		<h1 class="text-center">${loggedUser.name}</h1>

		<div class="row p-5">
			<div class="col-md-4">
				<a href="sell_book.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-book fa-3x"></i>
							</div>
							<h3>Sell Old Book..</h3>

						</div>
					</div>
				</a>
			</div>
			
			
			<div class="col-md-4">
				<a href="old_book.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-book fa-3x"></i>
							</div>
							<h3>Edit Old Book..</h3>

						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4">
				<a href="edit_profile.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-user-pen fa-3x"></i>
							</div>
							<h4>Edit Profile</h4>

						</div>
					</div>
				</a>
			</div>


			<div class="col-md-6 mt-3">
				<a href="order.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-danger">
								<i class="fa-solid fa-gift fa-3x"></i>
							</div>
							<h4>My Orders</h4>
							<p>Track Your Order</p>

						</div>
					</div>
				</a>
			</div>

			<div class="col-md-6 mt-3">
				<a href="helpline.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-success">
								<i class="fa-sharp fa-solid fa-phone-volume fa-3x"></i>
							</div>
							<h4>Help Center</h4>
							<p>24*7 Service</p>

						</div>
					</div>
				</a>
			</div>

			<!-- <div class="col-md-4 mt-3">
				<a href="user_address.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-warning">
								<i class="fa-solid fa-location-dot fa-3x"></i>
							</div>
							<h4>Your Address</h4>
							<p>Edit Address</p>

						</div>
					</div>
				</a>
			</div> -->

		</div>

	</div>

	<%@include file="all_components/footer.jsp"%>

</body>
</html>