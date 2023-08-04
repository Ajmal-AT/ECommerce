<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.ecommerce.project.UserCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String num = request.getParameter("num");
		String que = request.getParameter("que");
		String ans = request.getParameter("ans");
		String psd = request.getParameter("newpsd");
		
		int check = 0;
		try {
			Connection con = UserCon.getConnection();
			PreparedStatement st= con.prepareStatement("Select * from user_table where user_name='"+name+"' and user_email='"+email+"' and user_number='"+num+"' and user_que='"+que+"' and user_ans='"+ans+"'");
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				check=1;
				st.executeUpdate("update user_table set user_password='"+psd+"' where user_email='"+email+"'");
				response.sendRedirect("ForgotPage.jsp?msg=done");
			}
			if(check==0) {
				response.sendRedirect("ForgotPage.jsp?msg=nodone");
			}
		} 
		catch(Exception e) {
			
		}
	
	%>
</body>
</html>