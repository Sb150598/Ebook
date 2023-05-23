<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnected"%>
<%@page import="com.DAO.BookDAOImpl"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:All Books</title>
<%@include file="allcss.jsp"%>
</head>
<body>
	<%@include file="nav.jsp"%>
	
	<c:if test="${empty userobj }">
     <c:redirect url="../Login.jsp"/>	
	</c:if>

	<c:if test="${not empty succMsg}">
		<h4 class="text-center text-success">${succMsg}</h4>
		<c:remove var="succMsg" scope="session" />
	</c:if>
	<c:if test="${not empty failedMsg}">
		<h4 class="text-center text-danger">${failedMsg}</h4>
		<c:remove var="failedMsg" scope="session" />
	</c:if>
	<div class="container-fuild">
		<table class="table table-striped">
			<thead class="bg-primary">
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Image</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Book Categoris</th>
					<th scope="col">Status</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>

				<%
				BookDAOImpl dao = new BookDAOImpl(DBConnected.getConn());
				List<BookDtls> list = dao.getAllBooks();
				for (BookDtls b : list) {
				%>

				<tr>
					<td><%=b.getId()%></td>
					<td><img src="../book/<%=b.getPhotoName()%>"
						style="width: 50px; height: 50px;"></td>
					<td><%=b.getBookName()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getBookCategori()%></td>
					<td><%=b.getStatus()%></td>
					<td><a href="edit_books.jsp?id=<%=b.getId()%>"
						class="btn btn-sm btn-success"><i class="fa-solid fa-pen-to-square"></i>Edit</a> 
						<a href="../delete?id=<%=b.getId() %>"
						class="btn btn-sm btn-danger"><i class="fa-sharp fa-solid fa-trash"></i>Delete</a></td>
				</tr>
				<%
				}
				%>

			</tbody>
		</table>
	</div>
	<div style="margin-top: 210px;">
		<%@ include file="footer.jsp"%>
	</div>
</body>
</html>