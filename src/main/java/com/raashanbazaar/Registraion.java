package com.raashanbazaar;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class Registraion extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname=request.getParameter("name");
		String uemail=request.getParameter("email");
		String umobile=request.getParameter("contact");
		String upwd=request.getParameter("pass");
		String Reupwd=request.getParameter("re_pass");
		
		
		RequestDispatcher dispatcher=null;
		if(uname==null || uname.equals("")) {
			request.setAttribute("status", "invalidName");
			dispatcher=request.getRequestDispatcher("login.jsp");
		    dispatcher.forward(request, response);
		}
		if(uemail==null || uemail.equals("")) {
			request.setAttribute("status", "invalidEmail");
			dispatcher=request.getRequestDispatcher("login.jsp");
		    dispatcher.forward(request, response);
		}
		if(umobile==null || umobile.equals("")) {
			request.setAttribute("status", "invalidMobile");
			dispatcher=request.getRequestDispatcher("login.jsp");
		    dispatcher.forward(request, response);
		}
		if(upwd==null || upwd.equals("")) {
			request.setAttribute("status", "invalidUpwd");
			dispatcher=request.getRequestDispatcher("login.jsp");
		    dispatcher.forward(request, response);
		}
		else if(!upwd.equals(Reupwd)) {
			request.setAttribute("status", "invalidConfirmp");
			dispatcher=request.getRequestDispatcher("login.jsp");
		    dispatcher.forward(request, response);
		}
		else {Connection con=null;
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/login?useSSL=false","root","1234");
			PreparedStatement pst=con.prepareStatement("insert into user(uname,upwd,uemail,umobile) values(?,?,?,?)");
			pst.setString(1, uname);
			pst.setString(2, upwd);
			pst.setString(3, uemail);
			pst.setString(4, umobile);
			
			int rowcount=pst.executeUpdate();
			dispatcher=request.getRequestDispatcher("login.jsp");
			if(rowcount>0) {
				request.setAttribute("status", "success");
			}
			else {
				request.setAttribute("status", "failed");
			}
			dispatcher.forward(request, response);
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		finally {	
			try {
				con.close();
			}
			catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
	}
