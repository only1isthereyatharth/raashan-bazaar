package com.Dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.model.User;
public class UserDao {
	private Connection con;
	private PreparedStatement pstm;
	private ResultSet rs;
	private String query;
	
	public boolean registerUser(String name, String userName, String email, String password) {
		boolean registration_complete = false;
		try {
			query = "insert into login.user values(?,?,?,?)"; 
			pstm = this.con.prepareStatement(query);
			pstm.setString(2, name);
			pstm.setString(3, email);
			pstm.setString(4, password);
			
			if(pstm.execute()) {
				registration_complete = true;
			}
			else System.out.println("Something error occured at line 27 of UserDao class registerUser function");
		}
		catch(Exception e) {e.printStackTrace();}
		
		return registration_complete;
	}
	
	public UserDao(Connection con) {
		this.con = con;
	}
	public User loginUser(String usernameOremail, String password) throws ClassNotFoundException, SQLException {
		User user=null;
		this.query = "select * from login.user where uemail=? and upwd=?";
		this.pstm = this.con.prepareStatement(query);
		this.pstm.setObject(1, usernameOremail);
		this.pstm.setObject(2, password);
		System.out.println(usernameOremail+"  "+password);
		this.rs = pstm.executeQuery();
		
		if(this.rs.next()) {
			System.out.println("Inside if statement of UserDao class at line 48");
			user = new User();
			user.setUser_id(this.rs.getInt("id"));
			user.setUser_email(this.rs.getString("uemail"));
			user.setUser_password(this.rs.getString("upwd"));
			// for security purpose I havn't returned;
		}

		return user;
	}
}
