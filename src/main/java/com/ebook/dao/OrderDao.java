package com.ebook.dao;

import java.util.List;

import com.ebook.entity.BookOrder;

public interface OrderDao {
	
	
	public boolean saveOrder(List<BookOrder> bookOrder);
	
	public List<BookOrder> getBook(String email); 
	
	public List<BookOrder> getBookAllOrders(); 

}
