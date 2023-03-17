package com.ebook.admin.servlet;

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

@WebServlet("/deleteBook")
public class DeleteBookServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(req.getParameter("book_id"));
			
			BookDao bookDao=new BookDaoImpl(DBConnection.getConnection());
			boolean b = bookDao.deleteBook(id);
			
			HttpSession httpSession = req.getSession();

			if (b) {
				httpSession.setAttribute("delBSuccess", "Book Deleted Successfully...");
				resp.sendRedirect("admin/all_books.jsp");
			} else {
				httpSession.setAttribute("delBError", "Something Went Wrong...");
				resp.sendRedirect("admin/update_books.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	

}
