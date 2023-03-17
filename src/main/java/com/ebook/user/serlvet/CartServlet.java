package com.ebook.user.serlvet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ebook.dao.BookDao;
import com.ebook.dao.CartDao;
import com.ebook.daoImpl.BookDaoImpl;
import com.ebook.daoImpl.CartDaoImpl;
import com.ebook.db.DBConnection;
import com.ebook.entity.Book;
import com.ebook.entity.Cart;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			int bid = Integer.parseInt(req.getParameter("bid"));
			int uid = Integer.parseInt(req.getParameter("uid"));

			BookDao bookDao = new BookDaoImpl(DBConnection.getConnection());
			Book book = bookDao.getBookById(bid);

			Cart cart = new Cart();
			cart.setBid(bid);
			cart.setUid(uid);
			cart.setBook_name(book.getBname());
			cart.setAuthor(book.getAuthor());
			cart.setPrice(Double.parseDouble(book.getPrice()));
			cart.setTotalprice(Double.parseDouble(book.getPrice()));

			CartDao cartDao = new CartDaoImpl(DBConnection.getConnection());
			boolean b = cartDao.addCart(cart);

			HttpSession httpSession = req.getSession();

			if (b) {
				// System.out.println("Cart Added Successfully..");
				httpSession.setAttribute("addCart", "Cart Added Successfully..");
				resp.sendRedirect("all_new_books.jsp");
			} else {
				// System.out.println("Something Went Wrong..");
				httpSession.setAttribute("addCart-fail", "Something Went Wrong..");
				resp.sendRedirect("all_new_books.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
