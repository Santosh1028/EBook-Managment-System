package com.ebook.dao;

import java.util.List;

import com.ebook.entity.Book;
import com.oracle.wls.shaded.org.apache.regexp.StringCharacterIterator;

public interface BookDao {

	public boolean addBook(Book book);

	public List<Book> getAllBooks();
	
	public Book getBookById(int book_id);
	
	public boolean updateBook(Book book);
	
	public boolean deleteBook(int book_id);
	
	public List<Book> getNewBook();
	
	public List<Book> getRecentBooks();
	
	public List<Book> getOldBooks();
	
    public List<Book> getAllRecentBooks();
    
    public List<Book> getAllNewBooks();
    
    public List<Book> getAllOldBooks();
    
    public List<Book> getBookByOld(String uemail, String category);
    
    public boolean oldBookDelete(String uemail, String category, int bid);
    
    public List<Book> getBookBySearch(String ch);
    

}
