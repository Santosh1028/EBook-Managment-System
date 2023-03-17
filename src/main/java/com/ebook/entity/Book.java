package com.ebook.entity;

public class Book {
	
	private int id;
	private String bname;
	private String author;
	private String price;
	private String category;
	private String status;
	private String photoName;
	private String user_email;
	public Book() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Book(int id, String bname, String author, String price, String category, String status, String photoName,
			String user_email) {
		super();
		this.id = id;
		this.bname = bname;
		this.author = author;
		this.price = price;
		this.category = category;
		this.status = status;
		this.photoName = photoName;
		this.user_email = user_email;
	}
	
	
	public Book(String bname, String author, String price, String category, String status, String photoName,
			String user_email) {
		super();
		this.bname = bname;
		this.author = author;
		this.price = price;
		this.category = category;
		this.status = status;
		this.photoName = photoName;
		this.user_email = user_email;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPhotoName() {
		return photoName;
	}
	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	@Override
	public String toString() {
		return "Book [id=" + id + ", bname=" + bname + ", author=" + author + ", price=" + price + ", category="
				+ category + ", status=" + status + ", photoName=" + photoName + ", user_email=" + user_email + "]";
	}
	
	
	

}
