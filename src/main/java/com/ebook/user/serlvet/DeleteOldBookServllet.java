package com.ebook.user.serlvet;

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

@WebServlet("/deleteOldBook")
public class DeleteOldBookServllet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			String uemail = req.getParameter("em");
			int bid=Integer.parseInt(req.getParameter("id"));
			
			BookDao bookDao = new BookDaoImpl(DBConnection.getConnection());

			boolean b = bookDao.oldBookDelete(uemail, "Old", bid);

			HttpSession httpSession = req.getSession();
			if (b) {
				httpSession.setAttribute("succMsg", "Old Book Deleted");
				resp.sendRedirect("old_book.jsp");
			} else {
				httpSession.setAttribute("errMsg", "Something Went Wrong");
				resp.sendRedirect("old_book.jsp");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
