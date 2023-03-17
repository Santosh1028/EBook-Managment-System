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

@WebServlet("/registerUser")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			PrintWriter out = response.getWriter();
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String phone = request.getParameter("phone");
			String check = request.getParameter("check");

			// out.println(name+" "+email);

			User user = new User();
			user.setEmail(email);
			user.setName(name);
			user.setPassword(password);
			user.setPhone(phone);

			HttpSession httpSession = request.getSession();

			if (check != null) {
				UserDao userDao = new UserDaoImpl(DBConnection.getConnection());
				boolean b = userDao.registeUser(user);

				if (b) {
					// System.out.println("User Registered Successfully..");
					httpSession.setAttribute("regMsgSuccess", "User Registered Successfully..");
					response.sendRedirect("register.jsp");
				} else {
					// System.out.println("Something Went Wrong..");
					httpSession.setAttribute("regMsgError", "Something Went Wrog..");
					response.sendRedirect("register.jsp");
				}

			}

			else {
				// System.out.println("Please check Terms and Conditions");
				httpSession.setAttribute("checkMsg", "Please check Terms and Conditions..");
				response.sendRedirect("register.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
