<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sell Book Page</title>
<%@include file="all_components/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="all_components/navbar.jsp"%>

	<c:if test="${empty loggedUser }">
		<c:redirect url="login.jsp" />
	</c:if>

	<div class="container">
		<div class="row">
			<div class="col-md-5 offset-md-4">
				<div class="card mt-2">

					<div class="card-header text-center">
						<h4>Sell Old Book</h4>

						<c:if test="${not empty addBSuccess }">
							<p class="text-success text-center">${addBSuccess}</p>
							<c:remove var="addBSuccess" scope="session" />
						</c:if>

						<c:if test="${not empty addBError }">
							<p class="text-danger text-center">${addBError}</p>
							<c:remove var="addBError" scope="session" />
						</c:if>
					</div>


				</div>
				<div class="card-body">
					<form action="sellOldBook" method="post"
						enctype="multipart/form-data">

						<input type="hidden" value="${loggedUser.email }" name="user" />

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
							<label for="phone">Upload Photo</label> <input name="bimage"
								type="file" class="form-control-file">
						</div>

						<div class="container text-center">
							<button type="submit" class="btn btn-primary">Sell Book</button>
							<button type="reset" class="btn btn-warning">Reset</button>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>


	<%@include file="all_components/footer.jsp"%>
</body>
</html>