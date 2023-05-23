package com.admin.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.BookDAO;
import com.DAO.BookDAOImpl;
import com.DB.DBConnected;
import com.entity.BookDtls;
@WebServlet("/Add_books")
@MultipartConfig
public class BooksAdd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		try {
			 String bookName =req.getParameter("bname");
			 String author =req.getParameter("author");
			 String price=req.getParameter("price");
			 String categori =req.getParameter("categoris");
			 String status =req.getParameter("status");
			 Part part=req.getPart("bimg");
			 String fileName =part.getSubmittedFileName();
			 BookDtls b = new BookDtls(bookName, author, price, categori, status, fileName,"email");
			BookDAOImpl dao = new BookDAOImpl(DBConnected.getConn());
			
			
			boolean f=dao.addBooks(b);
		  HttpSession session=	req.getSession();
		  
		  if(f)
		  {
			  String path =getServletContext().getRealPath("")+"book";
				File file = new File(path);
				part.write(path+File.separator+fileName);
			
			  session.setAttribute("succMsg", "Book Added Succesfully");
			  resp.sendRedirect("Admin/add_books.jsp");
		  }else {			  
			  session.setAttribute("failedMsg", "Something went wrong");
			  resp.sendRedirect("Admin/add_books.jsp");
		  }
			 
		} catch (Exception e) {
          e.printStackTrace();
		}
	}
}
