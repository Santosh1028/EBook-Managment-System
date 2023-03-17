<%@page import="com.ebook.entity.Book"%>
<%@page import="java.util.List"%>
<%@page import="com.ebook.db.DBConnection"%>
<%@page import="com.ebook.daoImpl.BookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Old Books</title>
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
<body>
	<%@include file="all_components/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<%
			BookDaoImpl bookDaoImpl = new BookDaoImpl(DBConnection.getConnection());
			List<Book> recentBooks = bookDaoImpl.getAllOldBooks();

			for (Book book1 : recentBooks) {
			%>

			<div class="col-md-3">
				<div class="card crd-ho mt-2">
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

							<a href="view_books.jsp?bid=<%=book1.getId() %>" class="btn btn-success btn-sm ml-5"><i
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
							<a href="" class="btn btn-danger btn-sm ml-2"><i
								class="fa-solid fa-cart-shopping"></i> Cart</a> <a href=""
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



	</div>
</body>
</html>