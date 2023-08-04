package com.ecommerce.project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserCon {
	public static Connection getConnection() {
		Connection con=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/open_ecomerce","root","128665");
		} catch (Exception e) {
			System.out.println(e);
		}
		return con;
	}
	
	public static int getSelect(String uname, String psd) {
		int sta=0;
		try {
			Connection con= UserCon.getConnection();
			System.out.println(uname);
			PreparedStatement st = con.prepareStatement("Select * from user_table where user_email='"+uname+"' && user_password='"+psd+"'");
			ResultSet rs = st.executeQuery();
			System.out.println(st);
			
			while (rs.next()) {
				sta=1;
			}
		} 
		catch (Exception e) {
			System.out.println(e);
			sta=2;
		}
		return sta;
	}
	
	
}
