<%@page import="com.ebook.entity.User"%>
<%@page import="com.ebook.entity.Book"%>
<%@page import="java.util.List"%>
<%@page import="com.ebook.db.DBConnection"%>
<%@page import="com.ebook.daoImpl.BookDaoImpl"%>
<%@page import="com.ebook.dao.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Old Page</title>
<%@include file="all_components/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="all_components/navbar.jsp"%>

	<div class="container p-5">

		<c:if test="${not empty succMsg }">
			<p class="text-center text-success">${succMsg }</p>
			<c:remove var="succMsg" scope="session" />
		</c:if>

		<c:if test="${not empty errMsg }">
			<p class="text-center text-danger">${errMsg }</p>
			<c:remove var="errMsg" scope="session" />
		</c:if>
		<table class="table">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>


				<%
				User user = (User) session.getAttribute("loggedUser");

				BookDao bookDao = new BookDaoImpl(DBConnection.getConnection());
				List<Book> oldBooks = bookDao.getBookByOld(user.getEmail(), "Old");

				for (Book book : oldBooks) {
				%>
				<tr>
					<th scope="row"><%=book.getBname()%></th>
					<td><%=book.getAuthor()%></td>
					<td><%=book.getPrice()%></td>
					<td><a href="deleteOldBook?em=<%=user.getEmail()%>&&id=<%=book.getId() %>"
						class="btn btn-sm btn-danger">Delete</a></td>
				</tr>
				<%
				}
				%>


			</tbody>
		</table>
	</div>


</body>
</html>