package com.user.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnected;
import com.entity.BookDtls;
import com.entity.Cart;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int bid = Integer.parseInt(req.getParameter("bid"));
		int uid = Integer.parseInt(req.getParameter("uid"));
		
		BookDAOImpl dao = new BookDAOImpl(DBConnected.getConn());
		BookDtls b = dao.getBookById(bid);
		
		Cart c= new Cart();
		c.setBid(bid);
		c.setUid(uid);
		c.setBookName(b.getBookName());
		c.setAuthor(b.getAuthor());
		c.setPrice(Double.parseDouble(b.getPrice()));
		c.setTotalPrice(Double.parseDouble(b.getPrice()));
		
		CartDAOImpl dao2 = new CartDAOImpl(DBConnected.getConn());
		boolean f = dao2.addCart(c);
		
		HttpSession session = req.getSession(); 
		
		if(f)
		{
			session.setAttribute("addCart", "Book Added to cart");
			resp.sendRedirect("all_New_books.jsp");
		}else
		{
			session.setAttribute("failed", "Something wrong on server");
			resp.sendRedirect("all_New_books.jsp");
		}

	}

}
