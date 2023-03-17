package com.ebook.daoImpl;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ebook.dao.CartDao;
import com.ebook.entity.Book;
import com.ebook.entity.Cart;

public class CartDaoImpl implements CartDao {

	private Connection conn;

	public CartDaoImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addCart(Cart cart) {
		boolean f = false;

		try {

			String query = "insert into cart(bid ,uid, book_name , author , price , totalprice) values(?,?,?,?,?,?)";
			PreparedStatement psmt = conn.prepareStatement(query);
			psmt.setInt(1, cart.getBid());
			psmt.setInt(2, cart.getUid());
			
			psmt.setString(3, cart.getBook_name());
			psmt.setString(4, cart.getAuthor());
			psmt.setDouble(5, cart.getPrice());
			psmt.setDouble(6, cart.getTotalprice());
			

			int i = psmt.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Cart> getBookByUser(int userId) {
		
		List<Cart> cartList=new ArrayList<Cart>();
		Cart cart=null;
		double totalPrice=0.0;
		try {
			
			String query="select * from cart where uid=?";
			PreparedStatement psmt = conn.prepareStatement(query);
			psmt.setInt(1, userId);
			ResultSet rs = psmt.executeQuery();
			
			while(rs.next()) {
				cart=new Cart();
				cart.setBid(rs.getInt(2));
				cart.setCid(rs.getInt(1));
				cart.setUid(rs.getInt(3));
				cart.setBook_name(rs.getString(4));
				cart.setAuthor(rs.getString(5));
				cart.setPrice(rs.getDouble(6));
				
				totalPrice=totalPrice+rs.getDouble(7);
				cart.setTotalprice(totalPrice);
				
				cartList.add(cart);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cartList;
	}

	public boolean deleteBook(int bid, int uid, int cid) {
		boolean f=false;
		
		try {
			
			String query="delete from cart where bid=? and uid=? and cid=?";
			PreparedStatement psmt = conn.prepareStatement(query);
			psmt.setInt(1, bid);
			psmt.setInt(2, uid);
			psmt.setInt(3, cid);
			int i = psmt.executeUpdate();
			
			if(i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
		
	}

}
