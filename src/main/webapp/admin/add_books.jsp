<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
<%@include file="allCss.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: black;
}
</style>
</head>
<body style="background-color: #f0f2f2;">
	<%@include file="navbar.jsp"%>

	<c:if test="${empty loggedUser }">
		<c:redirect url="../login.jsp" />
	</c:if>
	
	<div class="container">
		<div class="row mt-2">
			<div class="col-md-5 offset-md-4">
				<div class="card">
					<div class="card-header text-center">
						<h3>Add New Book</h3>

						<c:if test="${not empty addBSuccess }">
							<p class="text-success text-center">${addBSuccess}</p>
							<c:remove var="addBSuccess" scope="session" />
						</c:if>

						<c:if test="${not empty addBError }">
							<p class="text-danger text-center">${addBError}</p>
							<c:remove var="addBError" scope="session" />
						</c:if>
					</div>
					
					
					<div class="card-body">
						<form action="../addBook" method="post"
							enctype="multipart/form-data">

							<div class="form-group">
								<label for="username">Enter Book Name</label> <input type="text"
									class="form-control" id="username" name="bname"
									aria-describedby="emailHelp" placeholder="Book Name">

							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Enter Author Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									name="bauthor" aria-describedby="emailHelp"
									placeholder="Book Author">

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Enter Book Price</label> <input
									type="number" class="form-control" id="exampleInputPassword1"
									name="price" placeholder="Book Price">
							</div>

							<div class="form-group">
								<label for="phone">Enter Book Category</label> <select id=""
									name="btype" class="form-control">
									<option selected>--Select--</option>
									<option value="New">New Book</option>
								</select>

							</div>

							<div class="form-group">
								<label for="phone">Enter Book Status</label> <select id=""
									name="bstatus" class="form-control">
									<option selected>--Select--</option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
								</select>

							</div>

							<div class="form-group">
								<label for="phone">Upload Photo</label> <input name="bimage"
									type="file" class="form-control-file">
							</div>

							<div class="container text-center">
								<button type="submit" class="btn btn-primary">Add Book</button>
								<button type="reset" class="btn btn-warning">Reset</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div style="margin-top: 20px;">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>