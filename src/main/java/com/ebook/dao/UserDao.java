package com.ebook.dao;

import com.ebook.entity.User;

public interface UserDao {
	
	public boolean registeUser(User user);
	public User login(String email, String password);
	
	public boolean checkPassword(int id,  String passwrod);
	
	public boolean updateUser(User user);

}
