package com.ebook.daoImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ebook.dao.BookDao;
import com.ebook.entity.Book;

public class BookDaoImpl implements BookDao {

	private Connection conn;

	public BookDaoImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addBook(Book book) {

		boolean f = false;

		try {

			String query = "insert into book_details(book_name ,author, price , category , status , photo, user_email ) values(?,?,?,?,?,?,?)";
			PreparedStatement psmt = conn.prepareStatement(query);
			psmt.setString(1, book.getBname());
			psmt.setString(2, book.getAuthor());
			psmt.setString(3, book.getPrice());
			psmt.setString(4, book.getCategory());
			psmt.setString(5, book.getStatus());
			psmt.setString(6, book.getPhotoName());
			psmt.setString(7, book.getUser_email());

			int i = psmt.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Book> getAllBooks() {
		List<Book> books = new ArrayList<Book>();
		Book book = null;

		try {
			String query = "select * from book_details";
			PreparedStatement psmt = conn.prepareStatement(query);

			ResultSet rs = psmt.executeQuery();

			while (rs.next()) {
				book = new Book();
				book.setId(rs.getInt(1));
				book.setBname(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPrice(rs.getString(4));
				book.setCategory(rs.getString(5));
				book.setStatus(rs.getString(6));
				book.setPhotoName(rs.getString(7));
				book.setUser_email(rs.getString(8));

				books.add(book);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return books;
	}

	public Book getBookById(int book_id) {
		Book book = null;

		try {
			String query = "select * from book_details where book_id =?";
			PreparedStatement psmt = conn.prepareStatement(query);
			psmt.setInt(1, book_id);

			ResultSet rs = psmt.executeQuery();

			while (rs.next()) {
				book = new Book();
				book.setId(rs.getInt(1));
				book.setBname(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPrice(rs.getString(4));
				book.setCategory(rs.getString(5));
				book.setStatus(rs.getString(6));
				book.setPhotoName(rs.getString(7));
				book.setUser_email(rs.getString(8));

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return book;
	}

	public boolean updateBook(Book book) {
		boolean f = false;

		try {

			String query = "update book_details set book_name=?, author=?, price=?, status=? where book_id =? ";
			PreparedStatement psmt = conn.prepareStatement(query);
			psmt.setString(1, book.getBname());
			psmt.setString(2, book.getAuthor());
			psmt.setString(3, book.getPrice());
			psmt.setString(4, book.getStatus());
			psmt.setInt(5, book.getId());

			int i = psmt.executeUpdate();

			if (i == 0) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public boolean deleteBook(int book_id) {
		boolean f = false;

		try {

			String query = "delete from book_details where book_id =?";
			PreparedStatement psmt = conn.prepareStatement(query);
			psmt.setInt(1, book_id);

			int i = psmt.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Book> getNewBook() {

		List<Book> list = new ArrayList<Book>();
		Book book = null;

		try {

			String query = "select * from book_details where category=? and status=? order by book_id DESC";
			PreparedStatement psmt = conn.prepareStatement(query);
			psmt.setString(1, "New");
			psmt.setString(2, "Active");

			ResultSet rs = psmt.executeQuery();

			int i = 1;

			while (rs.next() && i <= 4) {
				book = new Book();
				book = new Book();
				book.setId(rs.getInt(1));
				book.setBname(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPrice(rs.getString(4));
				book.setCategory(rs.getString(5));
				book.setStatus(rs.getString(6));
				book.setPhotoName(rs.getString(7));
				book.setUser_email(rs.getString(8));

				list.add(book);

				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	public List<Book> getRecentBooks() {

		List<Book> list = new ArrayList<Book>();
		Book book = null;

		try {

			String query = "select * from book_details where status=? order by book_id DESC";
			PreparedStatement psmt = conn.prepareStatement(query);
			psmt.setString(1, "Active");

			ResultSet rs = psmt.executeQuery();

			int i = 1;

			while (rs.next() && i <= 4) {
				book = new Book();
				book = new Book();
				book.setId(rs.getInt(1));
				book.setBname(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPrice(rs.getString(4));
				book.setCategory(rs.getString(5));
				book.setStatus(rs.getString(6));
				book.setPhotoName(rs.getString(7));
				book.setUser_email(rs.getString(8));

				list.add(book);

				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	public List<Book> getOldBooks() {
		List<Book> list = new ArrayList<Book>();
		Book book = null;

		try {

			String query = "select * from book_details where category=? and status=? order by book_id DESC";
			PreparedStatement psmt = conn.prepareStatement(query);
			psmt.setString(1, "Old");
			psmt.setString(2, "Active");

			ResultSet rs = psmt.executeQuery();

			int i = 1;

			while (rs.next() && i <= 4) {
				book = new Book();
				book = new Book();
				book.setId(rs.getInt(1));
				book.setBname(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPrice(rs.getString(4));
				book.setCategory(rs.getString(5));
				book.setStatus(rs.getString(6));
				book.setPhotoName(rs.getString(7));
				book.setUser_email(rs.getString(8));

				list.add(book);

				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<Book> getAllRecentBooks() {

		List<Book> list = new ArrayList<Book>();
		Book book = null;

		try {

			String query = "select * from book_details where status=? order by book_id DESC";
			PreparedStatement psmt = conn.prepareStatement(query);
			psmt.setString(1, "Active");

			ResultSet rs = psmt.executeQuery();

			
			while (rs.next()) {
				book = new Book();
				book = new Book();
				book.setId(rs.getInt(1));
				book.setBname(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPrice(rs.getString(4));
				book.setCategory(rs.getString(5));
				book.setStatus(rs.getString(6));
				book.setPhotoName(rs.getString(7));
				book.setUser_email(rs.getString(8));

				list.add(book);

				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	public List<Book> getAllNewBooks() {
		
		List<Book> list = new ArrayList<Book>();
		Book book = null;

		try {

			String query = "select * from book_details where category=? and status=? order by book_id DESC";
			PreparedStatement psmt = conn.prepareStatement(query);
			psmt.setString(1, "New");
			psmt.setString(2, "Active");

			ResultSet rs = psmt.executeQuery();

			
			while (rs.next()) {
				book = new Book();
				book = new Book();
				book.setId(rs.getInt(1));
				book.setBname(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPrice(rs.getString(4));
				book.setCategory(rs.getString(5));
				book.setStatus(rs.getString(6));
				book.setPhotoName(rs.getString(7));
				book.setUser_email(rs.getString(8));

				list.add(book);

				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
		
		
	}

	public List<Book> getAllOldBooks() {
		List<Book> list = new ArrayList<Book>();
		Book book = null;

		try {

			String query = "select * from book_details where category=? and status=? order by book_id DESC";
			PreparedStatement psmt = conn.prepareStatement(query);
			psmt.setString(1, "Old");
			psmt.setString(2, "Active");

			ResultSet rs = psmt.executeQuery();

			
			while (rs.next()) {
				book = new Book();
				book = new Book();
				book.setId(rs.getInt(1));
				book.setBname(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPrice(rs.getString(4));
				book.setCategory(rs.getString(5));
				book.setStatus(rs.getString(6));
				book.setPhotoName(rs.getString(7));
				book.setUser_email(rs.getString(8));

				list.add(book);

				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<Book> getBookByOld(String uemail, String category) {
		List<Book> books=new ArrayList<Book>();
		Book book=null;
		
		try {
			String query="select * from book_details where category=? and user_email=?";
			
			PreparedStatement psmt = conn.prepareStatement(query);
			psmt.setString(1, category);
			psmt.setString(2, uemail);
			ResultSet rs = psmt.executeQuery();
			
			while(rs.next()) {
				book = new Book();
				book.setId(rs.getInt(1));
				book.setBname(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPrice(rs.getString(4));
				book.setCategory(rs.getString(5));
				book.setStatus(rs.getString(6));
				book.setPhotoName(rs.getString(7));
				book.setUser_email(rs.getString(8));

				books.add(book);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return books;
	}

	public boolean oldBookDelete(String uemail, String category, int id) {
		
		boolean f=false;
		
		try {
			
			String query="delete from book_details where category=? and user_email=? and book_id=?";
			PreparedStatement psmt=conn.prepareStatement(query);
			psmt.setString(1, category);
			psmt.setString(2, uemail);
			psmt.setInt(3, id);
			int i = psmt.executeUpdate();
			
			if(i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
		
		
	}

	public List<Book> getBookBySearch(String ch) {
		List<Book> books=new ArrayList<Book>();
		Book book=null;
		
		try {
			String query="select * from book_details where book_name like ? and author like ? and category like ? and status=?";
			
			PreparedStatement psmt = conn.prepareStatement(query);
			psmt.setString(1, "%+ch+%");
			psmt.setString(2, "%+ch+%");
			psmt.setString(3, "%+ch+%");
			psmt.setString(4, "Active");
			ResultSet rs = psmt.executeQuery();
			
			while(rs.next()) {
				book = new Book();
				book.setId(rs.getInt(1));
				book.setBname(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPrice(rs.getString(4));
				book.setCategory(rs.getString(5));
				book.setStatus(rs.getString(6));
				book.setPhotoName(rs.getString(7));
				book.setUser_email(rs.getString(8));

				books.add(book);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return books;
	}

}