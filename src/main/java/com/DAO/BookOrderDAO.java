package com.DAO;

import java.util.List;

import com.entity.BookOrder;

public interface BookOrderDAO {
	
	public int getOrder();
	
	public boolean saveOrder(List<BookOrder> blist);
	
	public List<BookOrder> getBook(String email);

	
	public List<BookOrder> getAllOrder();

}
