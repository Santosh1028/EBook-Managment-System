package com.ebook.entity;

public class Cart {
	
	private int cid;
	private int bid;
	private int uid;
	private String book_name;
	private String author;
	private double price;
	private double totalprice;
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(double totalprice) {
		this.totalprice = totalprice;
	}
	@Override
	public String toString() {
		return "Cart [cid=" + cid + ", bid=" + bid + ", uid=" + uid + ", book_name=" + book_name + ", author=" + author
				+ ", price=" + price + ", totalprice=" + totalprice + "]";
	}
	
	

}
