<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="all_components/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="all_components/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-5 offset-md-4">
				<div class="card">
					<div class="card-header">
						<h3 class="text-center">Your Address</h3>
					</div>

					<div class="card-body">
						<form>

							<div class="form-group">
								<label for="inputPassword4">Address</label> <input type="text"
									class="form-control" id="inputPassword4" placeholder="Address"
									value="">
							</div>

							<div class="form-group">
								<label for="inputPassword4">Landmark</label> <input type="text"
									class="form-control" id="inputPassword4" placeholder="Landmark"
									value="">
							</div>

							<div class="form-group">
								<label for="inputPassword4">City</label> <input type="text"
									class="form-control" id="inputPassword4" placeholder="City"
									value="">
							</div>

							<div class="form-group">
								<label for="inputPassword4">State</label> <input type="text"
									class="form-control" id="inputPassword4" placeholder="State"
									value="">
							</div>


							<div class="form-group">
								<label for="inputPassword4">Pincode</label> <input type="text"
									class="form-control" id="inputPassword4" placeholder="Pincode"
									value="">
							</div>

							<div class="text-center">
								<a href="" class="btn btn-warning text-white">Add Address</a>
							</div>


						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>