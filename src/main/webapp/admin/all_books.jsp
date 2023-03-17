<%@page import="com.ebook.entity.Book"%>
<%@page import="java.util.List"%>
<%@page import="com.ebook.db.DBConnection"%>
<%@page import="com.ebook.dao.BookDao"%>
<%@page import="com.ebook.daoImpl.BookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Books</title>
<%@include file="allCss.jsp"%>


</head>
<body>
	<%@include file="navbar.jsp"%>

	<c:if test="${empty loggedUser }">
		<c:redirect url="../login.jsp" />
	</c:if>

	<h3 class="text-center">Hello Admin</h3>

	<c:if test="${not empty updateBSuccess }">
		<p class="text-success text-center">${updateBSuccess}</p>
		<c:remove var="updateBSuccess" scope="session" />
	</c:if>

	<c:if test="${not empty updateBError }">
		<p class="text-danger text-center">${updateBError}</p>
		<c:remove var="updateBError" scope="session" />
	</c:if>

	<c:if test="${not empty delBSuccess }">
		<p class="text-success text-center">${delBSuccess}</p>
		<c:remove var="delBSuccess" scope="session" />
	</c:if>

	<c:if test="${not empty delBError }">
		<p class="text-danger text-center">${delBError}</p>
		<c:remove var="delBError" scope="session" />
	</c:if>

	<table class="table table-striped">
		<thead class="bg-dark text-white">
			<tr>
				<th scope="col">ID</th>
				<!-- <th scope="col">Image</th> -->
				<th scope="col">Book Name</th>
				<th scope="col">Author Name</th>
				<th scope="col">Price</th>
				<th scope="col">Book Category</th>
				<th scope="col">Status</th>
				<th scope="col">User Email</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>

			<%
			BookDao bookDao = new BookDaoImpl(DBConnection.getConnection());
			List<Book> books = bookDao.getAllBooks();

			for (Book b : books) {
			%>
			<tr>
				<td><%=b.getId()%></td>
				<%-- <td><img src="../book/<%=b.getPhotoName()%>"
					style="width: 50px; height: 50px" /></td> --%>
				<td><%=b.getBname()%></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getCategory()%></td>
				<td><%=b.getStatus()%></td>
				<td><%=b.getUser_email()%></td>
				<td><a class="btn btn-success text-center"
					href="update_books.jsp?book_id=<%=b.getId()%>"><i
						class="fa-solid fa-pen-to-square"></i> Update</a> <a
					class="btn btn-danger text-center"
					href="../deleteBook?book_id=<%=b.getId()%>"><i
						class="fa-solid fa-trash"></i> Delete</a></td>

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