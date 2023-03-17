package com.ebook.admin.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.ebook.dao.BookDao;
import com.ebook.daoImpl.BookDaoImpl;
import com.ebook.db.DBConnection;
import com.ebook.entity.Book;

@WebServlet("/addBook")
@MultipartConfig
public class AddBookSerlvet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			String bname = req.getParameter("bname");
			String bauthor = req.getParameter("bauthor");
			String price = req.getParameter("price");
			String categories = req.getParameter("btype");
			String bstatus = req.getParameter("bstatus");
			Part part = req.getPart("bimage");

			String fileName = part.getSubmittedFileName();

//			Book book=new Book(bname, bauthor, price, categories, bstatus, bname, fileName);
//			
//			System.out.println(book);

			Book book = new Book();
			book.setBname(bname);
			book.setAuthor(bauthor);
			book.setPrice(price);
			book.setCategory(categories);
			book.setStatus(bstatus);
			book.setPhotoName(fileName);
			book.setUser_email("admin@gmail.com");

			BookDao bookDao = new BookDaoImpl(DBConnection.getConnection());

			boolean b = bookDao.addBook(book);

			HttpSession httpSession = req.getSession();

			if (b) {
				// System.out.println("Book Added Successfully...");

				// Adding photo to a folder
				String path = getServletContext().getRealPath("") + "book";

				File file = new File(path);
				part.write(path + File.separator + fileName);

				httpSession.setAttribute("addBSuccess", "Book Added Successfully...");
				resp.sendRedirect("admin/add_books.jsp");
			} else {
				// System.out.println("Book Added Successfully...");
				httpSession.setAttribute("addBError", "Something Went Wrong...");
				resp.sendRedirect("admin/add_books.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
