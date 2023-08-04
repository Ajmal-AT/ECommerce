<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.ecommerce.project.UserCon"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

	<%
		String email = session.getAttribute("email").toString();
		String id = request.getParameter("value");
		String name = null;
		int quantity=1;
		int product_price=0;
		int product_total=0;
		int cart_total=0;
		
		int sta=0;
		
		try {
			Connection con = UserCon.getConnection();
			PreparedStatement st = con.prepareStatement("select product_name,product_price from product_table where product_id='"+id+"'");
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				name = rs.getString(1);
				product_price = rs.getInt(2);
				product_total = product_price ; 
			}
			ResultSet rs1 = st.executeQuery("Select total,quantity from cart where product_id='"+id+"' and email='"+email+"'");
			while(rs1.next()) {
				cart_total = rs1.getInt(1);
				cart_total = cart_total + product_total;
				quantity = rs1.getInt(2);
				quantity = quantity + 1;
				sta = 1;
			}
			
			if(sta==1) {
				st.executeUpdate("update cart set total='"+cart_total+"',quantity='"+quantity+"' where product_id='"+id+"' and email='"+email+"'");
				
				PreparedStatement stst = con.prepareStatement("update cartExist set total='"+cart_total+"' where product_id='"+id+"' and email='"+email+"'");
				stst.executeUpdate();
				response.sendRedirect("homePage.jsp?msg=exist");
				
			}
			
			if(sta==0) { 
				PreparedStatement sts = con.prepareStatement("insert into cart(email,product_id,name,quantity,price,total)value(?,?,?,?,?,?)");
				sts.setString(1, email);
				sts.setString(2, id);
				sts.setString(3, name);
				sts.setInt(4, quantity);
				sts.setInt(5, product_price);
				sts.setInt(6, product_total);
				sts.executeUpdate();
				
				PreparedStatement stst = con.prepareStatement("insert into cartExist(email,product_id,name,total)value(?,?,?,?)");
				stst.setString(1, email);
				stst.setString(2, id);
				stst.setString(3, name);
				stst.setInt(4, product_total);
				stst.executeUpdate();
				response.sendRedirect("homePage.jsp?msg=done");
			}
		}
		catch(Exception e) {
			response.sendRedirect("homePage.jsp?msg=not");
		}
	%>