package com.raashanbazaar;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import com.Dao.*;
import com.model.*;
import java.util.*;
import com.Database.*;
/**
 * Servlet implementation class Search_Category
 */
public class Search_Category extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchWord = request.getParameter("search");
//		System.out.println("Search_Category servlet is called!");
		List<Product> product_list = new ArrayList<>();
		try {
			product_list = new ProductDao(DbConnection.getConnection()).getSearchProduct(searchWord.toLowerCase());
//			System.out.println(product_list+" inside Servlet Search_Category");
		} catch (ClassNotFoundException | SQLException e) {e.printStackTrace();}
		
		request.getSession().setAttribute("product-list", product_list);
		response.sendRedirect("searchProduct.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
