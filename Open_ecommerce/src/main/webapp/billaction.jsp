<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.ecommerce.project.UserCon"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%
		String email = session.getAttribute("email").toString();
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String country = request.getParameter("ctry");
		String payment = request.getParameter("pay");
		String status = request.getParameter("status");
		String date = request.getParameter("date");
		String num = request.getParameter("mnum");
		int z=0;
		try
		{
			Connection con = UserCon.getConnection();
			PreparedStatement std = con.prepareStatement("select * from bill where email='"+email+"'");
			ResultSet rs = std.executeQuery();
			while(rs.next()){
				z=1;
				
			}
			if(z==0){
				PreparedStatement st = con.prepareStatement("insert into bill(email,address,city,state,country,billuser_number,order_date,payment_method,status)value(?,?,?,?,?,?,?,?,?)");
				st.setString(1, email);
				st.setString(2, address);
				st.setString(3, city);
				st.setString(4, state);
				st.setString(5, country);
				st.setString(6, num);
				st.setString(7, date);
				st.setString(8, payment);
				st.setString(9, status);
				st.executeUpdate();
				PreparedStatement stdstd = con.prepareStatement("DELETE FROM cart WHERE email='"+email+"'");
				stdstd.executeUpdate();
				response.sendRedirect("billDetails.jsp?msg=done");
			}
			if(z==1){
					response.sendRedirect("billDetails.jsp?msg=exist");
			}
		}
		catch(Exception e){
			response.sendRedirect("billDetails.jsp?msg=nodone");	
		}
	%>