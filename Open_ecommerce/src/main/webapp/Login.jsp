<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.ecommerce.project.UserCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	String email = request.getParameter("email");
	String psd = request.getParameter("psd");

	if("admin@ajmal.com".equals(email) && "12345".equals(psd)) {
		session.setAttribute("email", email);
		response.sendRedirect("Admin/adminHome.jsp");
	}
	else {
			int z = UserCon.getSelect(email, psd);
			
			if(z==0) {
				response.sendRedirect("LoginPage.jsp?msg=notexist");
			}
			else if(z==1){
				session.setAttribute("email", email);
				response.sendRedirect("Home.jsp");
			}
			else if(z==2) {
				response.sendRedirect("LoginPage.jsp?msg=invalid");
			}
			else {
				
			}
}
%>