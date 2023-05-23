<%@page import="com.entity.BookOrder"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnected"%>
<%@page import="com.DAO.BookOrderDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:Order List</title>
<%@include file="allcss.jsp"%>
</head>
<body>
<%@include file="nav.jsp"%>

<c:if test="${empty userobj }">
 <c:redirect url="../Login.jsp"/>	
 </c:if>

<div class="container-fuild">
<table class="table table-striped">
  <thead class="bg-primary">
    <tr>
      <th scope="col">Order Id</th>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Address</th>
      <th scope="col">Phno</th>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Payment Type</th>
    </tr>
  </thead>
  <tbody>
  
  <%
  BookOrderDAOImpl dao = new BookOrderDAOImpl(DBConnected.getConn());
  List<BookOrder> blist=dao.getAllOrder();
  for(BookOrder b:blist){
  %>
	 <tr>
      <th scope="row"><%=b.getOrderid() %></th>
      <td><%=b.getUserName() %></td>
      <td><%=b.getEmail() %></td>
      <td><%=b.getFulladdress() %></td>
      <td><%=b.getPhno() %></td>
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
<div style="margin-top: 230px;">
<%@ include file="footer.jsp" %>
</div>
</body>
</html>