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

	<c:if test="${not empty succMsg }">
		<p class="text-center text-danger">${succMsg }</p>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<h2>Your order is successful</h2>
	<p>Your delivery willbe reached within 7 days.</p>

	<a class="btn btn-danger" href="index.jsp">Home</a>
	<a class="btn btn-primary" href="order.jsp">View Order</a>



	<%@include file="all_components/footer.jsp"%>
</body>
</html>