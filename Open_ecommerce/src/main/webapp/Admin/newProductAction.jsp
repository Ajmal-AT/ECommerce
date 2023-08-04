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
			PreparedStatement st = con.prepareStatement("insert into product_table values(?,?,?,?,?)");
				st.setString(1, id);
				st.setString(2, name);
				st.setString(3, cate);
				st.setString(4, price);
				st.setString(5, active);
			st.executeUpdate();
			response.sendRedirect("addNewProduct.jsp?msg=done");
		}catch(Exception e) {
			response.sendRedirect("addNewProduct.jsp?msg=wrong");
		}
	%>
</body>
</html>