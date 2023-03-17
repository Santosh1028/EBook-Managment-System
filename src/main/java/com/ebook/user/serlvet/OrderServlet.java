package com.ebook.user.serlvet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ebook.dao.CartDao;
import com.ebook.dao.OrderDao;
import com.ebook.daoImpl.CartDaoImpl;
import com.ebook.daoImpl.OrderDaoImpl;
import com.ebook.db.DBConnection;
import com.ebook.entity.BookOrder;
import com.ebook.entity.Cart;
import com.mysql.cj.x.protobuf.MysqlxCrud.Order;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			String address = req.getParameter("address");
			String landmark = req.getParameter("landmark");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String pin = req.getParameter("pincode");
			String payment = req.getParameter("payment");

			String fullAddress = address + "," + landmark + "," + city + "," + state + "," + pin;

			CartDao cartDao = new CartDaoImpl(DBConnection.getConnection());
			List<Cart> blist = cartDao.getBookByUser(id);
			
			HttpSession httpSession = req.getSession();
			
			if(blist.isEmpty()) {
				resp.sendRedirect("checkout.jsp");
				httpSession.setAttribute("errMsg", "Add Items to Cart...");
			}
			else {

				OrderDao orderDao = new OrderDaoImpl(DBConnection.getConnection());

				BookOrder bookOrder = null;

				ArrayList<BookOrder> bookOrders = new ArrayList<BookOrder>();
				Random random = new Random();
				int i = random.nextInt(100);

				

				for (Cart cart : blist) {
					bookOrder = new BookOrder();

					bookOrder.setOrderIdS("BOOK-ORD-00" + i);
					bookOrder.setUsername(name);
					bookOrder.setEmail(email);
					bookOrder.setPhone(phone);
					bookOrder.setAuthpr(cart.getAuthor());
					bookOrder.setFullAdd(fullAddress);
					bookOrder.setPrice(cart.getPrice() + "");
					bookOrder.setBookname(cart.getBook_name());
					bookOrder.setPaymentType(payment);
					bookOrders.add(bookOrder);

				}

				if (payment.equals("noselect")) {
					httpSession.setAttribute("errMsg", "Please Select Payment Method...");
					resp.sendRedirect("checkout.jsp");

				}

				else {
					boolean b = orderDao.saveOrder(bookOrders);

					if (b) {
						httpSession.setAttribute("succMsg", "Please Select Payment Method...");
						resp.sendRedirect("order-sucess.jsp");
					} else {
						httpSession.setAttribute("errMsg", "Something Went Wrong...");
						resp.sendRedirect("checkout.jsp");
					}
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
