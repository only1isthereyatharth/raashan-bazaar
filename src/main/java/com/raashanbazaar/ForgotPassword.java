package com.raashanbazaar;

import java.io.IOException;
import java.net.PasswordAuthentication;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/forgotPassword")
public class ForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uemail = request.getParameter("email");
		RequestDispatcher dispatcher = null;
		int otpvalue = 0;
		HttpSession mySession = request.getSession();
		Connection con=null;
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/login?useSSL=false","root","1234");
			PreparedStatement pst=con.prepareStatement("select *from user where uemail=?");
	
			pst.setString(1, uemail);
			ResultSet rs=pst.executeQuery();
		
		if(uemail!=null || !uemail.equals("")) {
			if(rs.next()) {
			Random rand = new Random();
			 otpvalue = rand.nextInt(999999);

			String to = uemail;// change accordingly
			// Get the session object
			Properties props = new Properties();
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port", "465");
			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				//protected PasswordAuthentication getPasswordAuthentication() {
					//return new PasswordAuthentication("usernameutkarsh@gmail.com", ""); // original gmail amd password hai
				}
			);
			try {
				MimeMessage message = new MimeMessage(session);
				message.setFrom(new InternetAddress(uemail));// change accordingly
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
				message.setSubject("Hello");
				message.setText("your OTP is: " + otpvalue);
				// send message
				Transport.send(message);
			}

			catch (MessagingException e) {
				throw new RuntimeException(e);
			}
			dispatcher = request.getRequestDispatcher("EnterOtp.jsp");
			request.setAttribute("message","OTP is sent to "+uemail);
			//request.setAttribute("connection", con);
			mySession.setAttribute("otp",otpvalue); 
			mySession.setAttribute("email",uemail); 
			dispatcher.forward(request, response);
			//request.setAttribute("status", "success");
		}
			else {
				request.setAttribute("status", "failed");
				dispatcher=request.getRequestDispatcher("forgotPassword.jsp");
				dispatcher.forward(request, response);	
			}
			
		}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
