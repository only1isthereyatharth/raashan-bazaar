package com.raashanbazaar;


import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import com.model.*;

/**
 * Servlet implementation class AddItem
 */
public class Add_To_Cart extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    		response.setContentType("text/html;"
    				+ "charset=UTF-8");
    		try{
    			int id = Integer.parseInt(request.getParameter("id"));
    			List<Cart> newCartList;
    			Cart cart = new Cart();
    			cart.setId(id);
    			cart.setProduct_quantity(1);
    			
    			@SuppressWarnings("unchecked")
				List<Cart> cart_list = (ArrayList<Cart>)request.getSession().getAttribute("cart-list");
    			if(cart_list==null) {
    				newCartList = new ArrayList<>();
    				newCartList.add(cart);
    				request.getSession().setAttribute("cart-list", newCartList);

    			}
    			else {
    				newCartList = cart_list;
    				for(Cart c:newCartList) 
    					if(c.getId()==id)
    						response.sendRedirect("cart.jsp");
    				
    				
    				cart_list.add(cart);
    			}
    			response.sendRedirect("index.jsp");
    		}
    		catch(Exception e) {e.printStackTrace();}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
