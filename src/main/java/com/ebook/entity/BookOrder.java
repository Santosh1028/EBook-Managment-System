package com.ebook.entity;

public class BookOrder {
	
	private int id;
	private String orderIdS;
	private String username;
	private String email;
	private String phone;
	private String fullAdd;
	private String paymentType;
	private String bookname;
	private String authpr;
	private String price;
	
	
	public BookOrder() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public BookOrder(int id, String username, String email, String phone, String fullAdd, String paymentType) {
		super();
		this.id = id;
		this.username = username;
		this.email = email;
		this.phone = phone;
		this.fullAdd = fullAdd;
		this.paymentType = paymentType;
	}

	
	
	

	public String getBookname() {
		return bookname;
	}


	public void setBookname(String bookname) {
		this.bookname = bookname;
	}


	public String getAuthpr() {
		return authpr;
	}


	public void setAuthpr(String authpr) {
		this.authpr = authpr;
	}


	public String getPrice() {
		return price;
	}


	public void setPrice(String price) {
		this.price = price;
	}


	public String getOrderIdS() {
		return orderIdS;
	}


	public void setOrderIdS(String orderIdS) {
		this.orderIdS = orderIdS;
	}


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getFullAdd() {
		return fullAdd;
	}
	public void setFullAdd(String fullAdd) {
		this.fullAdd = fullAdd;
	}
	public String getPaymentType() {
		return paymentType;
	}
	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}
	
	
	

}
