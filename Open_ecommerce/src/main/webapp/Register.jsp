<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.ecommerce.project.UserCon"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Jsp</title>
</head>
<body>
	<% 
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String num = request.getParameter("num");
		String que = request.getParameter("que");
		String ans = request.getParameter("ans");
		String psd = request.getParameter("psd");
		String address="";
		String city="";
		String state="";
		String ctry="";
		
		try	{
			Connection con = UserCon.getConnection(); 
			PreparedStatement st = con.prepareStatement("insert into user_table values(?,?,?,?,?,?,?,?,?,?)");
			st.setString(1, name);
			st.setString(2, email);
			st.setString(3, num);
			st.setString(4, que);
			st.setString(5, ans);
			st.setString(6, psd);
			st.setString(7, address);
			st.setString(8, city);
			st.setString(9, state);
			st.setString(10, ctry);
			
			st.executeUpdate();
			response.sendRedirect("RegisterPage.jsp?msg=valid");
		}
		catch(Exception e) {
			response.sendRedirect("RegisterPage.jsp?msg=invalid");
		}
		
	%>
</body>
</html>