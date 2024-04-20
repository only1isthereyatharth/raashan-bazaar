package com.raashanbazaar;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
//import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.Dao.OrderDao;
import com.Database.DbConnection;
import com.model.Cart;
import com.model.Order;
import com.model.User;

/**
 * Servlet implementation class Check_Out
 */
public class Check_Out extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		@SuppressWarnings("unchecked")
		List<Cart> cartList = (List<Cart>)request.getSession().getAttribute("cart-list");
		User auth = (User)request.getSession().getAttribute("auth");
//		SimpleDateFormat formatter = new SimpleDateFormat("YYYY-MM-DD");
		if(cartList!=null && auth!=null) {
			for(Cart c: cartList) {
				Order order = new Order();
				order.setProductId(c.getId());
				order.setUid(auth.getUser_id());
				order.setQunatity(c.getProduct_quantity());
				order.setDate(new Date().toString());
				System.out.println(new Date().toString());
				
				try {
					OrderDao oDao = new OrderDao(DbConnection.getConnection());
					boolean inserted = oDao.insertOrders(order);
					if(!inserted) {
						out.println("<script>alert(`Sorry something went wrong confirming product`)</script>");
						request.getRequestDispatcher("cart.jsp").include(request, response);
					}
				} catch (ClassNotFoundException | SQLException e) {e.printStackTrace();}
				
//				cartList.remove(c);
			}
				cartList.clear();
				response.sendRedirect("order.jsp");
		
		}
		else if(auth==null) {
			response.sendRedirect("login.jsp");
		}
		else {
			response.sendRedirect("cart.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
