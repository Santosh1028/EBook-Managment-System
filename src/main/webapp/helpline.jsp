<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Help Line Page</title>
<%@include file="all_components/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="all_components/navbar.jsp"%>

	<div class="container text-center">
		<div class="row p-5">
			<div class="col-md-4 offset-md-4">
				<div class="text-success">
					<i class="fa-sharp fa-solid fa-phone-volume fa-5x"></i>
				</div>
				<h3>24*7 Service</h3>
				<h3>Help Line</h3>
				<h5>0987654321</h5>

				<a class="btn btn-primary text-white" href="index.jsp">Home</a>
			</div>
		</div>
	</div>

	<%-- <%@include file="all_components/footer.jsp"%> --%>
</body>
</html>