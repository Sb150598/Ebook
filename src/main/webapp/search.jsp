<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
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
<title>All Recent Books</title>
<%@include file="all_component/allcss.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #c2bdbc;
}
</style>
</head>
<body>

	 <%
	User u = (User) session.getAttribute("userobj");
	%>

	<%@include file="all_component/nav.jsp"%>
	

	<div class="container">
		<div class="row">
			<%
			String ch=request.getParameter("ch");
			BookDAOImpl dao2 = new BookDAOImpl(DBConnected.getConn());
			List<BookDtls> list2 = dao2.getBookBySearch(ch);

			for (BookDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 100px; height: 150px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
					
						<% 
						if(b.getBookCategori().equals("Old")){
							%>
						<p>Cetagoris:<%=b.getBookCategori()%></p>
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
						
						<a href="view_details.jsp?bid=<%=b.getId()%>" class="btn btn-success btn-sm ml-5">Details <i
								class="fa-solid fa-eye"></i></a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%> <i
								class="fa-solid fa-indian-rupee-sign"> </i></a>
						</div>
						
						<%
						}else{
						%>
						<p>Cetagoris:<%=b.getBookCategori()%></p>
						<div class="row">
						<a href="cart?bid=<%=b.getId()%>&&uid=<%=u.getId()%>" 
							class="btn btn-danger btn-sm ml-2">Add cart <i
								class="fas fa-cart-plus"></i></a>
							
				  					 <a href="view_details.jsp?bid=<%=b.getId()%>" class="btn btn-success btn-sm ml-1">Details <i
								class="fa-solid fa-eye"></i></a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%> <i
								class="fa-solid fa-indian-rupee-sign"> </i></a>
						</div>
						<%
						}
						%>				
					</div>
				</div>
			</div>

			<%
			}
			%>

		</div>
	</div>
	<div>
	<%@include file="all_component/footer.jsp" %>
	</div>
	
</body>
</html>