
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My_Cart</title>
<link rel="stylesheet" href="../css/adminhome.css">
</head>
<body>
<div class="top">
	<%@ include file="userHeader.jsp"%>
</div>

<div class="mid">
	<center>
		<h3 class="title"><b><i> My Cart  <img alt="" src="shopping-cart.png"></i></b></h2>
	</center>
	<br>
	<center>
	<table style="background: #cccccc; border-radius: 10px; width: 100%;">
			<tr style="style="text-align: center;">
				<th style="padding: 10px 25px 15px 25px;"><b>Product_ID</b></th>
				<th style="padding: 10px 25px 15px 25px;"><b>Name</b></th>
				<th style="padding: 10px 25px 15px 25px;"><b>Price</b></th>
				<th style="padding: 10px 25px 15px 25px;"><b>Quantity</b></th>
				<th style="padding: 10px 25px 15px 25px;"><b>Total_Price</b></th>
			</tr>
			
	<% 
		
		String eml = session.getAttribute("email").toString();
		String id = null;
		int total = 0;
	try	{
		Connection con = UserCon.getConnection();
		PreparedStatement st = con.prepareStatement("Select product_id,name,price,quantity,total from cart where email='"+eml+"'");
		ResultSet rs = st.executeQuery();
		while(rs.next()) {
			total =total + rs.getInt(5);
	%>
		<tr style="text-align: center; border-bottom:2px solid black;  width: 100%; ">
				<td style="padding-bottom: 10px;"><%= rs.getString(1) %></td>
				<td style="padding-bottom: 10px;"><%= rs.getString(2) %></td>
				<td style="padding-bottom: 10px;"><i><%= rs.getInt(3) %></i></td>
				<td style="padding-bottom: 10px;"><%= rs.getInt(4) %></td>
				<td style="padding-bottom: 10px;"><%= rs.getInt(5) %></td>
		</tr>
	<%
		}
	%>	
		<tr style="text-align: right; border-bottom:2px solid black;  width: 100%; ">
			<th colspan="5" style="padding-right: 15px;"><b>Total Price <b><%= total %></th>
		</tr>
		<tr style="text-align: right; border-bottom:2px solid black;  width: 100%; ">
			<th colspan="5" style="padding-right: 15px;">
				<a href="billDetails.jsp?value=<%= total %>" style="text-decoration: none;"><b> Bill</b></a>
			</th>
		</tr>
	<%
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