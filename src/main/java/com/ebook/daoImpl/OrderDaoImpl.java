package com.ebook.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ebook.dao.OrderDao;
import com.ebook.entity.BookOrder;

public class OrderDaoImpl implements OrderDao{
	
	private Connection conn;
	
	

	public OrderDaoImpl(Connection conn) {
		super();
		this.conn = conn;
	}



	public int getOrderNo() {
		int i=1;
		try {
			String sql="select * from book_order";
			PreparedStatement psmt = conn.prepareStatement(sql);
			ResultSet rs = psmt.executeQuery();
			
			while(rs.next()) {
				i++;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return i;
	}



	public boolean saveOrder(List<BookOrder> blist) {
		boolean f=false;
		try {
			
			String query="insert into book_order(order_id, user_name, email, address, phone, book_name, author, price, payment) values(?,?,?,?,?,?,?,?,?)";
			conn.setAutoCommit(false);
			PreparedStatement psmt = conn.prepareStatement(query);
		
			for(BookOrder b: blist) {
				psmt.setString(1, b.getOrderIdS());
				psmt.setString(2, b.getUsername());
				psmt.setString(3, b.getEmail());
				psmt.setString(4, b.getFullAdd());
				psmt.setString(5, b.getPhone());
				psmt.setString(6, b.getBookname());
				psmt.setString(7, b.getAuthpr());
				psmt.setString(8, b.getPrice());
				psmt.setString(9, b.getPaymentType());
				psmt.addBatch();
			}
			
			int[] count = psmt.executeBatch();
			conn.commit();
			f=true;
			conn.setAutoCommit(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}



	public List<BookOrder> getBook(String email) {
		
		List<BookOrder> list=new ArrayList<BookOrder>();
		BookOrder order=null;
		
		try {
			String query="select * from book_order where email=?";
			PreparedStatement psmt = conn.prepareStatement(query);
			psmt.setString(1, email);
			ResultSet rs = psmt.executeQuery();
			
			while(rs.next()) {
				order=new BookOrder();
				order.setId(rs.getInt(1));
				order.setOrderIdS(rs.getString(2));
				order.setUsername(rs.getString(3));
				order.setEmail(rs.getString(4));
			    order.setFullAdd(rs.getString(5));
				order.setBookname(rs.getString(6));
				order.setPhone(rs.getString(7));
				order.setBookname(rs.getString(8));
				order.setAuthpr(rs.getString(9));
				order.setPrice(rs.getString(10));
				order.setPaymentType(rs.getString(11));
				list.add(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}



	public List<BookOrder> getBookAllOrders() {
		List<BookOrder> list=new ArrayList<BookOrder>();
		BookOrder order=null;
		
		try {
			String query="select * from book_order";
			PreparedStatement psmt = conn.prepareStatement(query);
			ResultSet rs = psmt.executeQuery();
			
			while(rs.next()) {
				order=new BookOrder();
				order.setId(rs.getInt(1));
				order.setOrderIdS(rs.getString(2));
				order.setUsername(rs.getString(3));
				order.setEmail(rs.getString(4));
			    order.setFullAdd(rs.getString(5));
				order.setBookname(rs.getString(6));
				order.setPhone(rs.getString(7));
				order.setAuthpr(rs.getString(8));
				order.setPrice(rs.getString(9));
				order.setPaymentType(rs.getString(10));
				list.add(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
