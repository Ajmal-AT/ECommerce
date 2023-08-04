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
<title>User Header</title>
<link rel="stylesheet" href="css/adminhome.css">
</head>
<body>
	<% 
		String email = session.getAttribute("email").toString(); 
		String name=null;
		try {
		Connection con = UserCon.getConnection();
		PreparedStatement st = con.prepareStatement("select user_name from user_table where user_email='"+email+"'");
		ResultSet rs = st.executeQuery();
		while(rs.next()) {
			name = rs.getString("user_name");
		}
		}
		catch(Exception e) {
			
		}
	%>
	<div class="header">
			<center><h2><i> Online Shopping </i></h2></center>
		<div class="nav">
			<a href="homePage.jsp"> Home <img alt="" src="home-icon-silhouette.png"></a>
			<a href="myCart.jsp"> My Cart <img alt="" src="shopping-cart.png"></a>
			<a href="myOrders.jsp"> My Orders <img alt="" src="purchase-order.png"></a>
			<a href="changeDetails.jsp"> Change Details <img alt="" src="compose.png"></a>
			<a href="msgUs.jsp"> Message Us <img alt="" src="message.png"></a>
			<a href="about.jsp"> About <img alt="" src="information-button.png"></a>
			<a href="Logout.jsp"> Logout <img alt="" src="Admin/power-off.png"></a>
			
			<div style="display: block;">
				<a href="" style="margin-left: 150px;"><%= name %>	 <img alt="" src="user.png"></a>
				<form action="searchHome.jsp" method="post">
				<div style="border-radius: 15px; background: #ffffff; display: flex; margin-top: 20px; padding: 2px;">
						<input type="text" name="search" value="search here.." style="border-radius: 15px; padding-left: 10px; border:0px; background: transparent; width: 100%;padding-top: 5px;padding-bottom: 5px;">
						<button type="submit" style="border:0px; background: transparent;">
						<img alt="" src="search.png" style="width:100%; height:22px; padding-top: 5px;padding-bottom: 5px;padding-right: 5px;">
						</button>
				</div>	
			</form>
			</div>
			
			
		</div>
		
	</div>
</body>
</html>