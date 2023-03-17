package com.ebook.user.serlvet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ebook.dao.CartDao;
import com.ebook.daoImpl.CartDaoImpl;
import com.ebook.db.DBConnection;

@WebServlet("/removeBook")
public class RemoveBookServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int bid=Integer.parseInt(req.getParameter("bid"));
			int uid=Integer.parseInt(req.getParameter("uid"));
			int cid=Integer.parseInt(req.getParameter("cid"));
			
			CartDao cartDao=new CartDaoImpl(DBConnection.getConnection());
			boolean b = cartDao.deleteBook(bid, uid, cid);
			
			HttpSession httpSession = req.getSession();
			
			if(b) {
				
				httpSession.setAttribute("succMsg", "Book Removed Successfully...");
				resp.sendRedirect("checkout.jsp");
				
			}
			
			else {
				httpSession.setAttribute("errMsg", "Something Went Wrong...");
				resp.sendRedirect("checkout.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	

}
