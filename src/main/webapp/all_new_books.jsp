<%@page import="com.ebook.entity.User"%>
<%@page import="com.ebook.entity.Book"%>
<%@page import="java.util.List"%>
<%@page import="com.ebook.db.DBConnection"%>
<%@page import="com.ebook.daoImpl.BookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All New Books</title>
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

#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@
keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>
</head>
<body>

	<%
	User loggedUser = (User) session.getAttribute("loggedUser");
	%>


	<c:if test="${not empty addCart }">
		<div id="toast">${addCart }</div>

		<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>

		<c:remove var="addCart" scope="session" />
	</c:if>
	<%@include file="all_components/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<%
			BookDaoImpl bookDaoImpl = new BookDaoImpl(DBConnection.getConnection());
			List<Book> recentBooks = bookDaoImpl.getAllNewBooks();

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


							<a href="" class="btn btn-success btn-sm ml-2"><i
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