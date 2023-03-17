
<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="com.ebook.entity.Cart"%>
<%@page import="com.ebook.entity.User"%>
<%@page import="com.ebook.db.DBConnection"%>
<%@page import="com.ebook.daoImpl.CartDaoImpl"%>
<%@page import="com.ebook.dao.CartDao"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>
<html>
<head>
<meta charset="UTF-8">
<title>Cart Page..</title>
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


	<c:if test="${empty loggedUser }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<c:if test="${not empty succMsg }">
		<div class="alert alert-success text-center" role="alert">${succMsg }</div>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty errMsg }">
		<div class="alert alert-danger text-center" role="alert">${errMsg }</div>
		<c:remove var="errMsg" scope="session" />
	</c:if>
	
	



	<div class="container p-3">
		<div class="row p-2">
			<div class="col-md-6 text-center p-5 border bg-white">

				<div class="card">
					<h3 class="text-center text-success">Your Items</h3>
					<div class="card-body">
						<table class="table">
							<thead>
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

								CartDao cartDao = new CartDaoImpl(DBConnection.getConnection());
								List<Cart> cartList = cartDao.getBookByUser(user.getId());
								double totalPrice = 0.0;

								for (Cart c : cartList) {
									totalPrice = c.getTotalprice();
								%>

								<tr>
									<th scope="row"><%=c.getBook_name()%></th>
									<td><%=c.getAuthor()%></td>
									<td><%=c.getPrice()%></td>
									<td><a
										href="removeBook?bid=<%=c.getBid()%>&&uid=<%=c.getUid()%>&&cid=<%=c.getCid()%>"
										class="btn btn-sm btn-danger">Remove</a></td>
								</tr>
								<%
								}
								%>

								<tr>
									<td>Total Price:</td>
									<td></td>
									<td></td>
									<td><%=totalPrice%></td>
								</tr>


							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<form action="order" method="post">

							<input type="hidden" value="${loggedUser.id }" name="id">
							<h3 class="text-center text-success">Your Order Details...</h3>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Name</label> <input type="text"
										class="form-control" id="inputEmail4" name="name"
										value="${loggedUser.name }" placeholder="Name">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Email</label> <input type="email"
										class="form-control" id="inputPassword4" name="email"
										placeholder="Email" value="${loggedUser.email }">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Mobile</label> <input type="number"
										class="form-control" id="inputEmail4" placeholder="Number"
										name="phone" value="${loggedUser.phone }">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text"
										class="form-control" id="inputPassword4" name="address"
										placeholder="Address" required>
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Land Mark</label> <input type="text"
										class="form-control" id="inputEmail4" name="landmark"
										placeholder="Land Mark" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">City</label> <input type="text"
										class="form-control" id="inputPassword4" name="city"
										placeholder="City" required>
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">State</label> <input type="text"
										class="form-control" id="inputEmail4" name="state"
										placeholder="State" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Zip</label> <input type="text"
										class="form-control" id="inputPassword4" placeholder="Pincode"
										name="pincode" required>
								</div>
							</div>

							<div class="form-group">
								<label for="inputPassword4">Payment Type</label> <select
									class="form-control" name="payment">
									<option value="noselect">--Select--</option>
									<option value="COD">Cash on Delivery</option>
								</select>
							</div>

							<div class="text-center">
							<button class="btn btn-warning" type="submit">Order Now</button>
								<a href="login.jsp" class="btn btn-success">Continue
									Shopping</a>
							</div>
						</form>
					</div>
				</div>


			</div>
		</div>
	</div>

</body>
</html>