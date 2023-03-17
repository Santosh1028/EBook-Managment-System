package com.ebook.admin.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ebook.dao.BookDao;
import com.ebook.daoImpl.BookDaoImpl;
import com.ebook.db.DBConnection;
import com.ebook.entity.Book;

@WebServlet("/updateBook")
public class UpdateBookServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int book_id=Integer.parseInt(req.getParameter("book_id"));
			String bname = req.getParameter("bname");
			String bauthor = req.getParameter("bauthor");
			String price = req.getParameter("price");
			String bstatus = req.getParameter("bstatus");
			
			Book book=new Book();
			book.setId(book_id);
			book.setBname(bname);
			book.setAuthor(bauthor);
			book.setPrice(price);
			book.setStatus(bstatus);
			
			BookDao bookDao=new BookDaoImpl(DBConnection.getConnection());
			boolean b = bookDao.updateBook(book);
			
			HttpSession httpSession = req.getSession();

			if (b) {
				httpSession.setAttribute("updateBSuccess", "Book Update Successfully...");
				resp.sendRedirect("admin/all_books.jsp");
			} else {
				httpSession.setAttribute("updateBError", "Something Went Wrong...");
				resp.sendRedirect("admin/update_books.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}
