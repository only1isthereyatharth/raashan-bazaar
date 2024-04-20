package com.raashanbazaar;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class Retrieve extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/*
	 * protected void doGet(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException {
	 * response.getWriter().append("Served at: ").append(request.getContextPath());
	 * }
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// doGet(request, response);

		String uemail = request.getParameter("email");
		RequestDispatcher dispatcher = null;
		HttpSession mySession = request.getSession();
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/login?useSSL=false", "root", "1234");
			PreparedStatement pstm = con.prepareStatement("select *from user where uemail=?");

			pstm.setString(1, uemail);
			ResultSet rs = pstm.executeQuery();
			if (rs.next()) {

				String reciver_email = uemail;// change accordingly
				// Get the session object
				Properties props = new Properties();
				props.put("mail.smtp.host", "smtp.gmail.com");
				props.put("mail.smtp.socketFactory.port", "465");
				props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
				props.put("mail.smtp.auth", "true");
				props.put("mail.smtp.port", "465");
				Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						// return new PasswordAuthentication("usernameutkarsh@gmail.com",
						// "gmynovfcmkcrszli");
						return new PasswordAuthentication("yatharthchutku@gmail.com", "#*Google/@1");
					}
				});
				try {
					MimeMessage message = new MimeMessage(session);
					message.setFrom(new InternetAddress(uemail));// change accordingly
					message.addRecipient(Message.RecipientType.TO, new InternetAddress(reciver_email));
					message.setSubject("Reset password RaashanBazar");
					message.setText("your OTP is: ");
					// send message
					Transport.send(message);
				}

				catch (MessagingException e) {
					throw new RuntimeException(e);
				}
				dispatcher = request.getRequestDispatcher("login.jsp");
				request.setAttribute("message", "OTP is sent to " + uemail);
				// request.setAttribute("connection", con);
				// mySession.setAttribute("otp",otpvalue);
				mySession.setAttribute("email", uemail);
				dispatcher.forward(request, response);
				// request.setAttribute("status", "success");
			} else {
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("forgotPassword.jsp");
				dispatcher.forward(request, response);
			}

		}

		catch (Exception e) {
			e.printStackTrace();
		}
	}

}
