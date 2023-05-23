<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User:Address</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/nav.jsp"%>
	<div class="container p-5">
	
		<div class="row p-2">
			<div class="col-md-6 offset-md-3">
				<div class="card ">
					<div class="card-body">
					<h4 class="text-center text-primary p-3">Edit Address </h4>
					<form action="">
					<div class="form-row">
					            <div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text"
										class="form-control" id="inputPassword4">
								</div>
					
								<div class="form-group col-md-6">
									<label for="inputEmail4">Land Mark</label> <input type="text"
										class="form-control" id="inputEmail4">
								</div>
								
							</div>


							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">City</label> <input type="text"
										class="form-control" id="inputEmail4">
								</div>
								<div class="form-group col-md-3">
									<label for="inputPassword4">State</label> <input
										type="text" class="form-control" id="inputPassword4">
								</div>
								<div class="form-group col-md-3">
									<label for="inputPassword4">Zip Code</label> <input
										type="number" class="form-control" id="inputPassword4">
								</div>
							</div>
					
					  <div class="text-center ">
					  <button class="btn btn-success">Add Address</button>
					  </div>
					
					</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@include file="all_component/footer.jsp"%>
</body>
</html>