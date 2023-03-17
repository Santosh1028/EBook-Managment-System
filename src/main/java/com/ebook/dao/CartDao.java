package com.ebook.dao;

import java.util.List;

import com.ebook.entity.Book;
import com.ebook.entity.Cart;

public interface CartDao {
	
	public boolean addCart(Cart cart);
	
	public List<Cart> getBookByUser(int userId);
	
	public boolean deleteBook(int  bid, int uid, int cid);

}
