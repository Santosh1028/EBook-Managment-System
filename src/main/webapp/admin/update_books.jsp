<%@page import="com.ebook.entity.Book"%>
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

	<div class="container">
		<div class="row mt-2">
			<div class="col-md-5 offset-md-4">
				<div class="card">
					<div class="card-header text-center">
						<h3>Update Book</h3>


					</div>
					<div class="card-body">

						<%
						int id = Integer.parseInt(request.getParameter("book_id"));
						BookDao bookDao = new BookDaoImpl(DBConnection.getConnection());
						Book book = bookDao.getBookById(id);
						%>
						<form action="../updateBook" method="post">

							<input type="hidden" value="<%=book.getId()%>" name="book_id">

							<div class="form-group">
								<label for="username">Enter Book Name</label> <input type="text"
									class="form-control" id="username" name="bname"
									aria-describedby="emailHelp" placeholder="Book Name"
									value="<%=book.getBname()%>">

							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Enter Author Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									name="bauthor" aria-describedby="emailHelp"
									placeholder="Book Author" value="<%=book.getAuthor()%>">

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Enter Book Price</label> <input
									type="number" class="form-control" id="exampleInputPassword1"
									name="price" placeholder="Book Price"
									value="<%=book.getPrice()%>">
							</div>


							<div class="form-group">
								<label for="phone">Enter Book Status</label> <select id=""
									name="bstatus" class="form-control">

									<%
									if ("Active".equals(book.getStatus())) {
									%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>

									<%
									}

									else {
									%>
									<option value="Inactive">Active</option>
									<option value="Active">Inactive</option>
									<%
									}
									%>


								</select>

							</div>
							<div class="container text-center">
								<button type="submit" class="btn btn-primary">Update
									Book</button>
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