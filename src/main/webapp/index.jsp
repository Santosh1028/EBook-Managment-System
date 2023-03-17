<%@page import="com.ebook.entity.User"%>
<%@page import="com.ebook.entity.Book"%>
<%@page import="java.util.List"%>
<%@page import="com.ebook.daoImpl.BookDaoImpl"%>
<%@page import="com.ebook.dao.BookDao"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.ebook.db.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook Homepage..</title>
<%@include file="all_components/allCss.jsp"%>

<style type="text/css">
.back-img {
	background: url("img/bg.jpg");
	height: 55vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>
</head>
<body style="background-color: #f7f7f7;">

	<%
	User loggedUser = (User) session.getAttribute("loggedUser");
	%>

	<%@include file="all_components/navbar.jsp"%>
	<div class="container-fluid back-img">
		<h2 class="text-center mt-3">EBook Management System</h2>
	</div>

	<!-- Recent Books -->
	<div class="container mt-1">
		<h3 class="text-center">Recent Books</h3>
		<div class="row text-center">

			<%
			BookDaoImpl bookDao1 = new BookDaoImpl(DBConnection.getConnection());
			List<Book> list1 = bookDao1.getRecentBooks();

			for (Book book1 : list1) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=book1.getPhotoName()%>"
							style="width: 150px; height: 200px;" class="img-thumblin">
						<p><%=book1.getBname()%></p>
						<p><%=book1.getAuthor()%></p>
						<p>

							<%
							if (book1.getCategory().equals("Old")) {
							%>
							Categories:
							<%=book1.getCategory()%></p>
						<div class="row">

							<a href="view_books.jsp?bid=<%=book1.getId()%>"
								class="btn btn-success btn-sm ml-5"><i
								class="fa-solid fa-circle-info"></i> Details</a> <a href=""
								class="btn btn-danger btn-sm ml-2"><i
								class="fa-sharp fa-solid fa-indian-rupee-sign"></i> <%=book1.getPrice()%></a>
						</div>

						<%
						} else {
						%>
						Categories:
						<%=book1.getCategory()%></p>
						<div class="row">

							<%
							if (loggedUser == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i
								class="fa-solid fa-cart-shopping"></i> Cart</a>
							<%
							}

							else {
							%>
							<a
								href="cart?bid=<%=book1.getId()%>&&uid=<%=loggedUser.getId()%>"
								class="btn btn-danger btn-sm ml-2"><i
								class="fa-solid fa-cart-shopping"></i> Cart</a>
							<%
							}
							%>
							<a href="view_books.jsp?bid=<%=book1.getId()%>"
								class="btn btn-success btn-sm ml-2"><i
								class="fa-solid fa-circle-info"></i> Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-sharp fa-solid fa-indian-rupee-sign"></i> <%=book1.getPrice()%></a>
						</div>
						<%
						}
						%>



					</div>
				</div>
			</div>

			<%
			}
			%>

		</div>
		<div class="text-center mt-1">
			<a href="all_recent_books.jsp" class="btn btn-danger btn-sm">View
				All</a>
		</div>
	</div>

	<!-- End Recent Books -->

	<hr>

	<!-- Old Books -->
	<div class="container mt-1">
		<h3 class="text-center">Old Book</h3>
		<div class="row">
			<%
			BookDaoImpl bookDao = new BookDaoImpl(DBConnection.getConnection());
			List<Book> list = bookDao.getOldBooks();

			for (Book book : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=book.getPhotoName()%>"
							style="width: 150px; height: 200px;" class="img-thumblin">
						<p><%=book.getBname()%></p>
						<p><%=book.getAuthor()%></p>
						<p>
							Categories:
							<%=book.getCategory()%></p>
						<div class="row">
							<a href="view_books.jsp?bid=<%=book.getId()%>"
								class="btn btn-success btn-sm ml-5"><i
								class="fa-solid fa-circle-info"></i> Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-sharp fa-solid fa-indian-rupee-sign"></i> <%=book.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>
		</div>

		<div class="text-center mt-1">
			<a href="all_old_books.jsp" class="btn btn-danger btn-sm">View
				All</a>
		</div>
	</div>

	<!-- End Old Books -->

	<hr>

	<!-- New Books -->


	<div class="container mt-1">
		<h3 class="text-center">New Book</h3>
		<div class="row">
			<%
			BookDaoImpl bookDao2 = new BookDaoImpl(DBConnection.getConnection());
			List<Book> list3 = bookDao2.getNewBook();

			for (Book book3 : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=book3.getPhotoName()%>"
							style="width: 150px; height: 200px;" class="img-thumblin">
						<p><%=book3.getBname()%></p>
						<p><%=book3.getAuthor()%></p>
						<p>
							Categories:
							<%=book3.getCategory()%></p>
						<div class="row">

							<%
							if (loggedUser == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i
								class="fa-solid fa-cart-shopping"></i> Cart</a>
							<%
							}

							else {
							%>
							<a
								href="cart?bid=<%=book3.getId()%>&&uid=<%=loggedUser.getId()%>"
								class="btn btn-danger btn-sm ml-2"><i
								class="fa-solid fa-cart-shopping"></i> Cart</a>
							<%
							}
							%>
							<a href="view_books.jsp?bid=<%=book3.getId()%>"
								class="btn btn-success btn-sm ml-1"><i
								class="fa-solid fa-circle-info"></i> Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-sharp fa-solid fa-indian-rupee-sign"></i> <%=book3.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>

		</div>

		<div class="text-center mt-1">
			<a href="all_new_books.jsp" class="btn btn-danger btn-sm">View
				All</a>
		</div>
	</div>

	<!-- End New Books -->


	<%@include file="all_components/footer.jsp"%>

</body>
</html>