package com.ebook.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.ebook.dao.UserDao;
import com.ebook.entity.User;

public class UserDaoImpl implements UserDao {

	private Connection conn;

	public UserDaoImpl(Connection conn) {
		this.conn = conn;
	}

	public boolean registeUser(User user) {
		boolean f = false;

		try {
			String query = "insert into users(name, email, password, phone) values(?,?,?,?)";
			PreparedStatement psmt = conn.prepareStatement(query);
			psmt.setString(1, user.getName());
			psmt.setString(2, user.getEmail());
			psmt.setString(3, user.getPassword());
			psmt.setString(4, user.getPhone());

			int i = psmt.executeUpdate();
			
			if(i==1) {
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public User login(String email, String password) {
		User user=null;
		
		try {
			String sql="select * from users where email=? and password=?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, email);
			psmt.setString(2, password);
			ResultSet rs = psmt.executeQuery();
			
			while(rs.next()) {
				user=new User();
				user.setId(rs.getInt(1));
				user.setName(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setPassword(rs.getString(4));
				user.setPhone(rs.getString(5));
				user.setAddress(rs.getString(6));
				user.setLandmark(rs.getString(7));
				user.setCity(rs.getString(8));
				user.setState(rs.getString(9));
				user.setPincode(rs.getString(10));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}

	public boolean checkPassword(int id,String password) {
		boolean f=false;
		
		try {
			String query="select * from users where id=? and password=?";
			PreparedStatement psmt = conn.prepareStatement(query);
			psmt.setInt(1, id);
			psmt.setString(2, password);
			
			ResultSet rs = psmt.executeQuery();
			
			while(rs.next()) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

	public boolean updateUser(User user) {
		
		boolean f = false;

		try {
			String query = "update users set name=? , email=?, phone=? where id=?";
			PreparedStatement psmt = conn.prepareStatement(query);
			psmt.setString(1, user.getName());
			psmt.setString(2, user.getEmail());
			psmt.setString(3, user.getPhone());
			psmt.setInt(4, user.getId());

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
