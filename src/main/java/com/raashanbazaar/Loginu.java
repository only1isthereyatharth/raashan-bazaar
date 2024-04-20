package com.raashanbazaar;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/regir")
public class Loginu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uemail=request.getParameter("email");
		String upwd=request.getParameter("password");
		HttpSession session =request.getSession();
		RequestDispatcher dispatcher=null;
		Connection con=null;
		if(uemail==null || uemail.equals("")) {
			request.setAttribute("status", "invalidEmail");
			dispatcher=request.getRequestDispatcher("login.jsp");
		    dispatcher.forward(request, response);
		}
		if(upwd==null || upwd.equals("")) {
			request.setAttribute("status", "invalidUpwd");
			dispatcher=request.getRequestDispatcher("login.jsp");
		    dispatcher.forward(request, response);
		}
		
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/login?useSSL=false","root","1234");
			PreparedStatement pst=con.prepareStatement("select *from user where uemail=? and upwd=?");
	
			pst.setString(1, uemail);
			pst.setString(2, upwd);
			ResultSet rs=pst.executeQuery();
			if(rs.next()) {
				User user = new User();
				user.setUser_name(rs.getString("uname"));
				user.setUser_id(rs.getInt("id"));
				user.setUser_email(rs.getString("uemail"));
				user.setUser_password(rs.getString("upwd"));
				session.setAttribute("auth", user);
				session.setAttribute("name", rs.getString("uname"));
//				dispatcher=request.getRequestDispatcher("index.jsp");
			}
			else {
				request.setAttribute("status", "failed");
				dispatcher=request.getRequestDispatcher("login.jsp");
				dispatcher.forward(request, response);
			}
			response.sendRedirect("index.jsp");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
