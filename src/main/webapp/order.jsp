<%@page import="java.util.List"%>
<%@page import="java.lang.System.Logger"%>
<%@page import="com.ebook.db.DBConnection"%>
<%@page import="com.ebook.daoImpl.OrderDaoImpl"%>
<%@page import="com.ebook.dao.OrderDao"%>
<%@page import="com.ebook.entity.BookOrder"%>
<%@page import="com.ebook.entity.User"%>
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

	<c:if test="${empty loggedUser }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	
	<div class="container mt-5">
		<h4 class="text-center">Your Orders...</h4>
		<table class="table">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Order ID</th>
					<th scope="col">Name</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
				</tr>
			</thead>
			<tbody>

				<%
				User user = (User) session.getAttribute("loggedUser");
				OrderDao orderDao = new OrderDaoImpl(DBConnection.getConnection());
				List<BookOrder> blist = orderDao.getBook(user.getEmail());

				for (BookOrder bookOrder : blist) {
				%>
				<tr>
					<th scope="row"><%=bookOrder.getOrderIdS()%></th>
					<td><%=bookOrder.getUsername()%></td>
					<td><%=bookOrder.getBookname()%></td>
					<td><%=bookOrder.getAuthpr()%></td>
					<td><%=bookOrder.getPrice()%></td>
					<td><%=bookOrder.getPaymentType()%></td>
				</tr>

				<%
				}
				%>


			</tbody>
		</table>
	</div>
</body>
</html>