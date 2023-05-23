<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBConnected"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User:view details</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">

<%
	User u = (User) session.getAttribute("userobj");
	%>
	<%@include file="all_component/nav.jsp"%>

	<%
	int bid = Integer.parseInt(request.getParameter("bid"));

	BookDAOImpl dao = new BookDAOImpl(DBConnected.getConn());
	BookDtls b = dao.getBookById(bid);
	%>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="book/<%=b.getPhotoName()%>"
					style="height: 150px; width: 150px;"><br>
				<h4 class="mt-3">
					Book Name: <span class="text-primary"><%=b.getBookName()%></span>
				</h4>
				<h4>
					Author Name: <span class="text-primary"><%=b.getAuthor()%></span>
				</h4>
				<h4>
					Cetagori: <span class="text-primary"><%=b.getStatus()%></span>
				</h4>
			</div>

			<div class="col-md-6 text-center p-5 border bg-white ">
				<h2><%=b.getBookName()%></h2>

				<%
				if ("Old".equals(b.getBookCategori())) {
				%>
				<h4 class="text-primary">Contract To Seller</h4>
				<h4 class="text-primary">
					<i class="fa-regular fa-envelope"></i><%=b.getEmail()%></h4>
				<%
				}
				%>


				<div class="row">
					<div class="col-md-4 text-center text-success p-2">
						<i class="fas fa-money-bill-wave fa-3x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-center text-danger p-2">
						<i class="fas fa-undo-alt fa-3x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-center text-success p-2">
						<i class="fas fa-truck-moving fa-3x"></i>
						<p>Free Shipping</p>
					</div>
				</div>

				<%
				if ("Old".equals(b.getBookCategori())) {
				%>
				<div class="text-center">
					<a href="index.jsp" class="btn btn-primary"> <i class="fas fa-cart-plus"></i>
						Continue Shopping
					</a> <a href="" class="btn btn-success"> <i
						class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%></a>
				</div>

				<%
				} else {
				%>
				<div class="text-center">
					<a href="cart?bid=<%=b.getId()%>&&uid=<%=u.getId()%>" 
							class="btn btn-danger  ml-2 mt-4">Add cart <i
								class="fas fa-cart-plus"></i></a>
					
					<a href="" class="btn btn-success ml-2 mt-4"> <i
						class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%></a>
				</div>
				<%
				}
				%>


			</div>

		</div>
	</div>
</body>
</html>