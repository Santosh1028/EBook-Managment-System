<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>

<div class="container-fluid"
	style="height: 10px; background-color: #303f9f;"></div>

<div class="container-fluid p-3 bg-light">
	<div class="row">
		<div class="col-md-3 text-success">
			<h1>
				<i class="fa-solid fa-book"></i> EBooks
			</h1>
		</div>

		<div class="col-md-6">
			<form class="form-inline my-2 my-lg-0" type="search" name="ch" action="search_book.jsp" method="post">
				<input class="form-control mr-sm-2" 
					placeholder="Search" aria-label="Search">
				<button class="btn btn-primary my-2 my-sm-0" type="submit">
					<i class="fa-solid fa-magnifying-glass"></i> Search
				</button>
			</form>
		</div>

		<c:if test="${ not empty loggedUser }">
			<div class="col-md-3">
				<a href="checkout.jsp" class="ml-1"><i class="fa-solid fa-cart-shopping fa-2x mt-1"></i></a> <a
					href="login.jsp" class="btn btn-success"><i
					class="fa-solid fa-user"></i> ${loggedUser.name}</a> <a href="logout"
					class="btn btn-primary"><i
					class="fa-solid fa-right-from-bracket"></i> Logout</a>
			</div>
		</c:if>

		<c:if test="${ empty loggedUser }">
			<div class="col-md-3">
				<a href="login.jsp" class="btn btn-success"><i
					class="fa-solid fa-right-to-bracket"></i> Login</a> <a
					href="register.jsp" class="btn btn-primary"><i
					class="fa-solid fa-user-plus"></i> Register</a>
			</div>
		</c:if>


	</div>
</div>


<nav class="navbar navbar-expand-lg navbar-dark bg-custom">

	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp"><i
					class="fa-solid fa-house"></i> Home </a></li>
			<li class="nav-item active"><a class="nav-link"
				href="all_new_books.jsp"><i class="fa-solid fa-book"></i> New
					Book</a></li>

			<li class="nav-item active"><a class="nav-link"
				href="all_old_books.jsp"><i class="fa-solid fa-book-open"></i>
					Old Book</a></li>

			<li class="nav-item active"><a class="nav-link"
				href="all_recent_books.jsp"><i class="fa-solid fa-book-bookmark"></i>
					Recent Book</a></li>
		</ul>
		<form class="form-inline my-2 my-lg-0">

			<a class="btn btn-light my-2 my-sm-0" href="setting.jsp">
				<i class="fa-solid fa-gear"></i> Setting
			</a>
			<button class="btn btn-light my-2 my-sm-0 ml-1" type="submit">
				<i class="fa-solid fa-square-phone-flip"></i> Contact Us
			</button>
		</form>
	</div>
</nav>