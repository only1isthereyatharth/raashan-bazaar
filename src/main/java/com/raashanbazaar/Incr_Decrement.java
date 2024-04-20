package com.raashanbazaar;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet implementation class Incr_Decrement
 */
public class Incr_Decrement extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		String action = request.getParameter("action");
		int id = Integer.parseInt(request.getParameter("id"));
		
		@SuppressWarnings("unchecked")
		List<com.model.Cart> cart_list = (ArrayList<com.model.Cart>)request.getSession().getAttribute("cart-list");
		
		
		for(com.model.Cart c:cart_list) {
			if(id==c.getId()) {
				int quantity = c.getProduct_quantity();
				if(action.equals("incr")) {
					if(quantity==c.getQuantity_available() || quantity==5){
						out.println("<script>"
								+ "window.alert(`Sorry you cannot add more than 5 items`)"
								+ "</script>");
						request.getRequestDispatcher("cart.jsp").include(request, response);
						return;
					}else if(quantity<5){
						quantity++;
					}
					c.setProduct_quantity(quantity);
					c.setQuantity_available(c.getQuantity_available()-quantity);
				}
				else {
					quantity--;
					if(quantity==0) {
						cart_list.remove(c);
					}
					else c.setProduct_quantity(quantity);
				}
				break;
			}
		}
		response.sendRedirect("cart.jsp");
			
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
