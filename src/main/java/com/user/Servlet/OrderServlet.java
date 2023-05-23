package com.user.Servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookOrderDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnected;
import com.entity.BookOrder;
import com.entity.Cart;
@WebServlet("/order")
public class OrderServlet  extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			HttpSession session = req.getSession();
			
			int id=Integer.parseInt(req.getParameter("id"));
			
			String name=req.getParameter("username");
			String email=req.getParameter("email");
			String phno=req.getParameter("phno");
			String address=req.getParameter("address");
			String landmark=req.getParameter("landmark");
			String city=req.getParameter("city");
			String state=req.getParameter("state");
			String 	zip=req.getParameter("zip");
			String 	paymentType=req.getParameter("payment");
			
			String fullAddress=address+","+landmark+","+city+","+state+","+zip;
			
			CartDAOImpl dao = new CartDAOImpl(DBConnected.getConn());
			List<Cart> list = dao.getBookByUser(id);
			
			if(list.isEmpty())
			{
				session.setAttribute("failedMsg", "Add Some Items");
				resp.sendRedirect("card.jsp");
			}
			else {
				
				BookOrderDAOImpl dao2= new BookOrderDAOImpl(DBConnected.getConn());
				int i = dao2.getOrder();
				
				BookOrder o= null;
				ArrayList<BookOrder> orderlist=new ArrayList<BookOrder>();
				for(Cart c:list)
				{
					o=new BookOrder();
					o.setOrderid("BOOK-ORD-00"+i);
					o.setUserName(name);
					o.setEmail(email);
					o.setPhno(phno);
					o.setFulladdress(fullAddress);
					o.setBookName(c.getBookName());
					o.setAuthor(c.getAuthor());
					o.setPrice(c.getPrice()+"");
					o.setPaymentType(paymentType);
					orderlist.add(o);
					i++;
				}
				
				if("noselect".equals(paymentType))
				{
					session.setAttribute("failedMsg", "Please Select Payment Option");
					resp.sendRedirect("card.jsp");
				}else {
					boolean f = dao2.saveOrder(orderlist);
					
					if(f)
					{
						resp.sendRedirect("order_success.jsp");
					}else {
						session.setAttribute("failedMsg", "Your Order is failed please try after Some time!");
						resp.sendRedirect("card.jsp");
					}
				}
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}
