
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnected"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook : Index</title>
<%@include file="all_component/allcss.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/hp.jpeg");
	height: 50vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.crd-ho:hover {
	background-color: #c2bdbc;
}
</style>
</head>
<body style="background-color: #f7f7f7;">
	<%@include file="all_component/nav.jsp"%>

	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<div class="container-fuild back-img">
		<h2 class="text-center text-success">Welcome To Ebook Store</h2>
	</div>


	<!-- Start Recent Book -->

	<div class="container">
		<h3 class="text-center">Recent Book</h3>
		<div class="row">
			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnected.getConn());
			List<BookDtls> list2 = dao2.getRecentBook();

			for (BookDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>

						<% 
						if(b.getBookCategori().equals("Old"))
						{
						%>
						Cetagoris:<%=b.getBookCategori()%></p>
						<div class="row">
						<a href="view_details.jsp?bid=<%=b.getId()%>"
								class="btn btn-success btn-sm ml-5">Details <i
								class="fa-solid fa-eye"></i></a>
								
						    <a href=""class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%> <i
								class="fa-solid fa-indian-rupee-sign"> </i></a>
						<%	
						}else{
							%>
								Cetagoris:<%=b.getBookCategori()%></p>
						      <div class="row">
						      <a href="Login.jsp" class="btn btn-danger btn-sm ml-2">Add
								cart <i class="fas fa-cart-plus"></i>
							</a>
						      
							<a href="view_details.jsp?bid=<%=b.getId()%>"
								class="btn btn-success btn-sm ml-1">Details <i
								class="fa-solid fa-eye"></i></a>
								
						    <a href=""class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%> <i
								class="fa-solid fa-indian-rupee-sign"> </i></a>
							
						<%	
						}
						%>
							
						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>

		</div>
		<div class="text-center mt-2">
			<a href="all_Recent_book.jsp"
				class="btn btn-danger btn-sm text-white">View All</a>
		</div>

	</div>
	<!-- End Recent Book -->
	<hr>
	<!-- Start New Book -->

	<div class="container">
		<h3 class="text-center">New Book</h3>
		<div class="row">

			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnected.getConn());
			List<BookDtls> list = dao.getNewBook();

			for (BookDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookName()%>
						</p>
						<p><%=b.getAuthor()%></p>
						<p>Cetagoris:<%=b.getBookCategori()	%></p>

						<div class="row">
							<%
							if (u == null) {
							%>
							<a href="Login.jsp" class="btn btn-danger btn-sm ml-2">Add
								cart <i class="fas fa-cart-plus"></i>
							</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getId()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-2">Add cart <i
								class="fas fa-cart-plus"></i></a>
							<%
							}
							%>
							 <a href="view_details.jsp?bid=<%=b.getId()%>"
								class="btn btn-success btn-sm ml-1">Details <i
								class="fa-solid fa-eye"></i></a>
								
							<a href=""class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%> <i
								class="fa-solid fa-indian-rupee-sign"> </i></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-center mt-2">
			<a href="all_New_books.jsp" class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>
	<!-- End New Book -->
	<hr>
	<!-- Start Old Book -->

	<div class="container">
		<h3 class="text-center">Old Book</h3>
		<div class="row">

			<%
			BookDAOImpl dao3 = new BookDAOImpl(DBConnected.getConn());
			List<BookDtls> list3 = dao3.getOldBook();
			for (BookDtls b : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Cetagoris:<%=b.getBookCategori()%></p>
						<div class="row">
							<a href="view_details.jsp?bid=<%=b.getId()%>"
								class="btn btn-success btn-sm ml-5">Details <i
								class="fa-solid fa-eye"></i></a> 
								
							<a href=""	class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%> <i
								class="fa-solid fa-indian-rupee-sign"> </i></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>


		</div>

		<div class="text-center mt-2">
			<a href="all_Old_books.jsp" class="btn btn-danger btn-sm text-white">View All</a>

		</div>

	</div>
	<!-- End Old Book -->

	<%@include file="all_component/footer.jsp"%>
</body>
</html>