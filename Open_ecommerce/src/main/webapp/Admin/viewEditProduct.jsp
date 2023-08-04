<!DOCTYPE html>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.ecommerce.project.UserCon"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title> View & Edit </title>
<link rel="stylesheet" href="../css/adminhome.css">
</head>
<body>

<div class="top">
	<%@ include file="adminHeader.jsp"%>
</div>

<div class="mid">
	
	<% 
		String msg = request.getParameter("msg");
		if("done".equals(msg)){
	%>
		<h4 style="color: green; margin: 10px; text-align: center; font-weight: bold; font-size: 20px; margin-top: 20px;"> Product Seccessfully Updated! </h4>	
	<% 
	}
	%>	
	<% 
		if("wrong".equals(msg)) {
	%>
		<h4 style="color: red; margin: 10px; text-align: center;  font-weight: bold; font-size: 20px; margin-top: 20px;"> Product update Failed! <br><i style="padding-left: 60px"> Please Try Again! </i> </h4>
	<%
	}
	%>
	<center><h3 class="title"><i> All Product and Edit View </i></h2></center>
	<center>
	<table style="background: #cccccc; border-radius: 10px; width: 100%;">
			<tr style="style="text-align: center;">
				<th style="padding: 10px 25px 15px 25px;"><b>Product ID</b></th>
				<th style="padding: 10px 25px 15px 25px;"><b>Product Name</b></th>
				<th style="padding: 10px 25px 15px 25px;"><b>Product Category</b></th>
				<th style="padding: 10px 25px 15px 25px;"><b>Product Price</b></th>
				<th style="padding: 10px 30px 15px 25px;"><b>Edit <i><img alt="" src="edit-text.png"></i></b></th>
			</tr>
			
	<% 
	int id=0;
	try	{
		Connection con = UserCon.getConnection();
		PreparedStatement st = con.prepareStatement("Select * from product_table");
		ResultSet rs = st.executeQuery();
		while(rs.next()) {
	%>
		<tr style="text-align: center; border-bottom:2px solid black;  width: 100%; ">
				<td style="padding-bottom: 10px;"><%= rs.getString(1) %></td>
				<td style="padding-bottom: 10px;"><%= rs.getString(2) %></td>
				<td style="padding-bottom: 10px;"><%= rs.getString(3) %></td>
				<td style="padding-bottom: 10px;"><i><%= rs.getString(4) %></i></td>
				<td style="padding-bottom: 10px;"><a style="color: fuchsia; font-size: 15px; text-decoration: none;" href="editProduct.jsp?value=<%= rs.getString(1) %>">Edit<i><img alt="" src="edit-text.png"></i></a></td>
		</tr>
	<%
		}
	}	
	catch(Exception e) {
	}
	%>
	</table>
	</center>
</div>
<div class="bot">
	<%@ include file="../footer.jsp" %>
</div>

</body>
</html>