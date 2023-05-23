<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBConnected"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:Add Books</title>
<%@include file="allcss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="nav.jsp"%>
	<div class="container">
		<div class="row p-3">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Books</h4>
						
						
						<%
					int id=Integer.parseInt(request.getParameter("id"));
						BookDAOImpl dao=new BookDAOImpl(DBConnected.getConn());
						BookDtls b=dao.getBookById(id);
						%>
						<form action="../edit_books" method="post">
							<input type="hidden" name="id" value="<%=b.getId()%>">

							<div class="form-group">
								<label for="exampleInputEmail1">Book Name*</label> <input
									name="bname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required" value="<%=b.getBookName()%>">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Author Name*</label> <input
									name="author" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									required="required"value="<%=b.getAuthor()%>">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Price*</label> <input
									name="price" type="number" class="form-control"
									id="exampleInputEmail1" required="required"value="<%=b.getPrice()%>">
							</div>


							<div class="form-group">
								<label for="inputState">Book Status</label> <select
									id="inputStatus" name="status" class="form-control"
									required="required">
									<%if("Active".equals(b.getStatus()))
									{
									%>
									<option value="Active">Active</option>
										<option value="Inactive">Inactive</option>										
									<%
									}else{
									%>
									<option value="Inactive">Inactive</option>	
										<option value="Active">Active</option>
									<%
									 }
									%>
							</select>			
							</div>
							<button type="submit" class="btn btn-primary">Update</button>
						</form>


					</div>
				</div>
			</div>
		</div>

	</div>
<div style="margin-top: 40px;">
<%@ include file="footer.jsp" %>
</div>
</body>
</html>