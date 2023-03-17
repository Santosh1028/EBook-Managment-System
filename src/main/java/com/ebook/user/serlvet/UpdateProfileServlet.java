package com.ebook.user.serlvet;

import java.io.IOException;

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

@WebServlet("/updateUser")
public class UpdateProfileServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String phone = request.getParameter("phone");

			User user = new User();
			user.setEmail(email);
			user.setName(name);
			user.setPassword(password);
			user.setPhone(phone);
			user.setId(id);

			HttpSession httpSession = request.getSession();

			UserDao userDao = new UserDaoImpl(DBConnection.getConnection());
			boolean b = userDao.checkPassword(id, password);

			if (b) {
				boolean b2 = userDao.updateUser(user);
				
				if (b2) {
					// System.out.println("User Registered Successfully..");
					httpSession.setAttribute("updtMsgSuccess", "User Update Successfully..");
					response.sendRedirect("edit_profile.jsp");
				} else {
					// System.out.println("Something Went Wrong..");
					httpSession.setAttribute("updtMsgError", "Something Went Wrog..");
					response.sendRedirect("edit_profile.jsp");
				}
			} else {
				
				System.out.println(b);

				httpSession.setAttribute("passtMsgError", "Your password is Incorrect..");
				response.sendRedirect("edit_profile.jsp");
			}

			

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
