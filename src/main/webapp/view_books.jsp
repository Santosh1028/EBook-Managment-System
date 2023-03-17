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
	<%@include file="all_components/navbar.jsp"%>

	<%
	int bid = Integer.parseInt(request.getParameter("bid"));

	BookDao bookDao = new BookDaoImpl(DBConnection.getConnection());
	Book b = bookDao.getBookById(bid);
	%>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img alt="" src="book/<%=b.getPhotoName()%>"
					style="height: 150px; width: 150px">
				<h2 class="mt-3">
					Book Name:<span class="text-success"><%=b.getBname()%></span>
				</h2>
				<h4>
					Author Name: <span class="text-success"><%=b.getAuthor()%></span>
				</h4>
				<h4>
					Category:<span class="text-success"><%=b.getCategory()%></span>
				</h4>
			</div>

			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=b.getBname()%></h2>


				<%
				if ("Old".equals(b.getCategory())) {
				%>
				<h5 class="text-primary">Contact to Seller:</h5>
				<h5 class="text-danger">
					<i class="fa-solid fa-envelope"></i> Email:
					<%=b.getUser_email()%></h5>
				<%
				}
				%>

				<div class="row">
					<div class="col-md-4 text-danger p-2">
						<i class="fa-solid fa-money-bill-wave fa-2x"></i>
						<p>Cash on Delivery</p>
					</div>
					<div class="col-md-4 text-danger p-2">
						<i class="fa-solid fa-rotate-left fa-2x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-danger p-2">
						<i class="fas fa-truck-moving fa-2x"></i>
						<p>Free Available</p>
					</div>
				</div>


				<%
				if ("Old".equals(b.getCategory())) {
				%>
				<div class="text-center text-white">
					<a href="index.jsp" class="btn btn-success"> Continue Shopping</a> <a
						class="btn btn-danger ml-2">Price: <i
						class="fa-sharp fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%>
					</a>
				</div>

				<%
				}

				else {
				%>
				<div class="text-center text-white">
					<a class="btn btn-primary"><i class="fa-solid fa-cart-plus"></i>
						Add to Cart</a> <a class="btn btn-success ml-2">Price: <i
						class="fa-sharp fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%>
					</a>
				</div>
				<%
				}
				%>

			</div>
		</div>
	</div>

</body>
</html>