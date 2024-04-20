package com.raashanbazaar;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Servlet implementation class RemoveItemFromCart
 */
public class RemoveItemFromCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		@SuppressWarnings("unchecked")
		java.util.List<com.model.Cart> cart_list = (ArrayList<com.model.Cart>)request.getSession().getAttribute("cart-list");
		if(cart_list!=null) {
			int id = Integer.parseInt(request.getParameter("id"));
			for(com.model.Cart c:cart_list) {
				if(id==c.getId()) {
					cart_list.remove(c);
					break;
				}	
			}
		}
		response.sendRedirect("cart.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
