<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.ecommerce.project.UserCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product Action</title>
</head>
<body>
	<%	
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String cate = request.getParameter("cate");
		String price = request.getParameter("price");
		String active = request.getParameter("active");
		
		try{
			Connection con = UserCon.getConnection();
			PreparedStatement st = con.prepareStatement("update product_table set product_name='"+name+"',product_category='"+cate+"',product_price='"+price+"',product_active='"+active+"' where product_id='"+id+"'");
			st.executeUpdate();
			if(active.equals("no")){
				st.executeUpdate("");
			}
			response.sendRedirect("viewEditProduct.jsp?msg=done");
		}catch(Exception e) {
			response.sendRedirect("viewEditProduct.jsp?msg=wrong");
		}
	%>
</body>
</html>