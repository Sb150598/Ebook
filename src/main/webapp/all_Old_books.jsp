<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnected"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Old Books</title>
<%@include file="all_component/allcss.jsp"%>
<style type="text/css">
.crd-ho:hover
{
   background-color:#c2bdbc; 

}
</style>

</head>
<body>

	<%@include file="all_component/nav.jsp"%>
	<h4 class="text-center bg-light p-3"> Old Books </h4>

	<div class="container">
		<div class="row">
		<%
		BookDAOImpl dao3=new BookDAOImpl(DBConnected.getConn());
		List<BookDtls> list3=dao3.getAllOldBook();
		for(BookDtls b:list3)
		{%>
			<div class="col-md-3">
				<div class="card crd-ho mt-2">
				  <div class="card-body text-center">
				     <img alt="" src="book/<%=b.getPhotoName() %>" style="width:100px; height:150px" class="img-thumblin">
				     <p><%=b.getBookName() %></p>
				     <p><%=b.getAuthor() %></p>
				     <p>Cetagoris:<%=b.getBookCategori() %></p>
				     <div class="row">
				     <a href="view_details.jsp?bid=<%=b.getId()%>" class="btn btn-success btn-sm ml-5">Details
				     <i class="fa-solid fa-eye"></i></a>
				     <a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice() %>
				     <i class="fa-solid fa-indian-rupee-sign"> </i></a>
				     </div>
				  </div>
				</div>
			</div>
		<%	
		}
		%>
		</div>
	</div>
	<%@include file="all_component/footer.jsp" %>

</body>
</html>