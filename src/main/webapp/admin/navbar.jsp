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
			
		</div>

		<div class="col-md-3">

			<c:if test="${not empty loggedUser }">
				<a class="btn btn-success text-white"><i
					class="fa-solid fa-user"></i> ${loggedUser.name}</a>
				<a href="logout" class="btn btn-danger" data-toggle="modal"
					data-target="#exampleModal"><i
					class="fa-solid fa-right-to-bracket"></i> Logout</a>

			</c:if>

			<c:if test="${empty loggedUser }">
				<a href="../login.jsp" class="btn btn-success"><i
					class="fa-solid fa-right-to-bracket"></i> Login</a>
				<a href="../register.jsp" class="btn btn-primary"><i
					class="fa-solid fa-user-plus"></i> Register</a>
			</c:if>

		</div>
	</div>
</div>

<!-- Logout Modal -->

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="text-center">
					<h4>Do you want to logout.?</h4>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">No</button>
					<a href="../logout" type="button" class="btn btn-primary">Logout</a>
				</div>
			</div>
			<div class="modal-footer"></div>
		</div>
	</div>
</div>
<!-- End of Logout Modal -->


<nav class="navbar navbar-expand-lg navbar-dark bg-custom">

	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="home.jsp"><i
					class="fa-solid fa-house"></i> Home </a></li>

		</ul>

	</div>
</nav>

