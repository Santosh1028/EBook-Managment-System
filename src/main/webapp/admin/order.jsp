<%@page import="com.ebook.entity.BookOrder"%>
<%@page import="java.util.List"%>
<%@page import="com.ebook.db.DBConnection"%>
<%@page import="com.ebook.daoImpl.OrderDaoImpl"%>
<%@page import="com.ebook.dao.OrderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Order</title>
<%@include file="allCss.jsp"%>


</head>
<body>
	<%@include file="navbar.jsp"%>
	
	<c:if test="${empty loggedUser }">
		<c:redirect url="../login.jsp" />
	</c:if>
	<h3 class="text-center">All Order</h3>

	<table class="table table-striped">
		<thead class="bg-dark text-white">
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Order Name</th>
				<th scope="col">Order Email</th>
				<th scope="col">Address</th>
				<th scope="col">Phone Number</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Payment Type</th>
			</tr>
		</thead>
		<tbody>
			<%
			OrderDao orderDao = new OrderDaoImpl(DBConnection.getConnection());
			List<BookOrder> blist = orderDao.getBookAllOrders();

			for (BookOrder bookOrder : blist) {
			%>
			<tr>
				<th scope="row"><%=bookOrder.getOrderIdS()%></th>
				<td><%=bookOrder.getUsername()%></td>
				<td><%=bookOrder.getEmail()%></td>
				<td><%=bookOrder.getFullAdd()%></td>
				<td><%=bookOrder.getPhone()%></td>
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


	<div style="margin-top: 200px;">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>