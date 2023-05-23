<%@page import="com.entity.BookOrder"%>
<%@page import="com.DAO.BookOrderDAOImpl"%>

<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnected"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User:order</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">

<c:if test="${empty userobj}">
		<c:redirect url="Login.jsp"></c:redirect>
	</c:if>
	<%@include file="all_component/nav.jsp"%>

	<div class="container p-2">
	<h4 class="text-center text-warning">Your Order</h4>
		<table class="table table-striped mt-3">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Order Id</th>
					<th scope="col">Name</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Mode</th>
				</tr>
			</thead>
			<tbody>
				<%
				User u=(User)session.getAttribute("userobj");
				BookOrderDAOImpl dao=new BookOrderDAOImpl(DBConnected.getConn());
				List<BookOrder> blist=dao.getBook(u.getEmail());
				
				for(BookOrder b:blist){
					%>
					<tr>
					<th scope="row"><%=b.getOrderid() %></th>
					<td><%=b.getUserName() %></td>
					<td><%=b.getBookName() %></td>
					<td><%=b.getAuthor() %></td>
					<td><%=b.getPrice() %></td>
					<td><%=b.getPaymentType() %></td>
				</tr>	
					
				<%	
				}
				%>
			</tbody>
		</table>
	</div>

</body>
</html>