<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User: Setting</title>
<%@include file="all_component/allcss.jsp"%>
<style type="text/css">
a{
text-decoration: none;
color:black;
}
a:hover
{
text-decoration: none;
}
</style>

</head>
<body style="background-color: #f7f7f7;">

   	<c:if test="${empty  userobj}">
   <c:redirect url="Login.jsp"></c:redirect>
   	</c:if>
	<%@include file="all_component/nav.jsp"%>
	<div class="container">
	
	 <h4 class="text-center p-2 text-warning">Hello! ${userobj.name}</h4>
	 
		<div class="row p-2">
			<div class="col-md-4">
				<a href="sell_book.jsp">
					<div class="card p-2">
						<div class="card-body text-center p-2">
							<div class="text-primary">
								<i class="fas fa-book-open fa-3x "></i>
							</div>
							<h4>Sell Your Old Book</h4>
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-4">
				<a href="old_book.jsp">
					<div class="card p-2">
						<div class="card-body text-center p-2">
							<div class="text-warning">
								<i class="fas fa-book-open fa-3x "></i>
							</div>
							<h4>Old Book</h4>
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-4">
				<a href="edit_profile.jsp">
					<div class="card p-2">
						<div class="card-body text-center p-2">
							<div class="text-success">
								<i class="fa-regular fa-address-card fa-3x"></i>
							</div>
							<h4>Login & Security</h4>
						</div>
					</div>
				</a>
			</div>
			
			
			<div class="col-md-6 p-2">
				<a href="order.jsp">
					<div class="card p-2">
						<div class="card-body text-center p-4">
							<div class="text-danger">
								<i class="fa-solid fa-box-open fa-3x"></i>
							</div>
							<h4>My Order</h4>
							<h6>Track Your Order</h6>
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-6 p-2">
				<a href="helpline.jsp">
					<div class="card p-2">
						<div class="card-body text-center p-4">
							<div class="text-primary">
								<i class="fa-regular fa-circle-user fa-3x"></i>
							</div>
							<h4>Help Center</h4>
							<h6>24*7 Service</h6>
						</div>
					</div>
				</a>
			</div>
			
		</div>
	</div>
<%@include file="all_component/footer.jsp"%>
</body>
</html>