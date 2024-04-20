package com.raashanbazaar;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import com.model.Product;

/**
 * Servlet implementation class WishListAdder
 */
public class WishListAdder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		@SuppressWarnings("unchecked")
		Set<Product> wishList = (Set<Product>)request.getSession().getAttribute("wish-list");
		if(wishList==null)wishList = new HashSet<>();
		int id = Integer.parseInt(request.getParameter("id"));
		for(Product p:wishList) {
			if(p.getProductId()==id) {
				response.getWriter().write("ID already exits");
			}
		}
		request.getSession().setAttribute("wish-list", wishList);
		response.getWriter().write("ID added successfully");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

