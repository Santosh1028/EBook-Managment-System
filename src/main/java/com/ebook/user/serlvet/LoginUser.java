package com.ebook.user.serlvet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ebook.dao.UserDao;
import com.ebook.daoImpl.UserDaoImpl;
import com.ebook.db.DBConnection;
import com.ebook.entity.User;

@WebServlet("/loginUser")
public class LoginUser extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			PrintWriter out = resp.getWriter();

			String email = req.getParameter("email");
			String password = req.getParameter("password");

			//out.print(name + " " + password);
			
			UserDao userDao=new UserDaoImpl(DBConnection.getConnection());
			HttpSession httpSession=req.getSession();
			
			if("admin@gmail.com".equals(email) && "admin".equals(password)) {
				
				User adminUser=new User();
				adminUser.setName("Admin");
				httpSession.setAttribute("loggedUser", adminUser);
				resp.sendRedirect("admin/home.jsp");
			}
			else {
				
				User loggedUser = userDao.login(email, password);
				if(loggedUser!=null) {
					
					httpSession.setAttribute("loggedUser", loggedUser);
					resp.sendRedirect("index.jsp");
				}
				else {
					httpSession.setAttribute("invalidUser", "Incorrect Email && Password");
					resp.sendRedirect("login.jsp");
				}
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
