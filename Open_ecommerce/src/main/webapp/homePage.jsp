
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" href="../css/adminhome.css">
</head>
<body>
<div class="top">
	<%@ include file="userHeader.jsp"%>
</div>

<div class="mid">
	<center>
		<h3 class="title"><b><i> Home <img alt="" src="home-icon-silhouette.png"></i></b></h2>
		<%
			String msg = request.getParameter("msg");
			if("done".equals(msg)) {
		%>
			<b style="color: lime; margin-bottom: 5px;">
				Successfully added product into your cart...
			</b>
		<%	
			}
			if("exist".equals(msg)) {
		%>
			<b style="color: lime; margin-bottom: 5px;">
				Allready exist the product in your cart!...  <br>
				<center>Quantity increased</center></b>
		<%	
			}
			if("not".equals(msg)) {
		%>
			<b style="color: red; margin-bottom: 5px;">
				something went wrong!...  <br>
				<center>please try again!...</center></b>
		<%	
			}
		%>
	</center>
	<br>
	<center>
	<table style="background: #cccccc; border-radius: 10px; width: 100%;">
			<tr style="style="text-align: center;">
				<th style="padding: 10px 25px 15px 25px;"><b>ID</b></th>
				<th style="padding: 10px 25px 15px 25px;"><b>Name</b></th>
				<th style="padding: 10px 25px 15px 25px;"><b>Category</b></th>
				<th style="padding: 10px 25px 15px 25px;"><b>Price</b></th>
				<th style="padding: 10px 20px 15px 25px;"><b>ADD TO CART <i><img alt="" src="edit-text.png"></i></b></th>
			</tr>
			
	<% 
	try	{
		Connection con = UserCon.getConnection();
		PreparedStatement st = con.prepareStatement("Select * from product_table where product_active='yes'");
		ResultSet rs = st.executeQuery();
		while(rs.next()) {
	%>
		<tr style="text-align: center; border-bottom:2px solid black;  width: 100%; ">
				<td style="padding-bottom: 10px;"><%= rs.getString(1) %></td>
				<td style="padding-bottom: 10px;"><%= rs.getString(2) %></td>
				<td style="padding-bottom: 10px;"><%= rs.getString(3) %></td>
				<td style="padding-bottom: 10px;"><i><%= rs.getString(4) %></i></td>
				<td style="padding-bottom: 10px;"><a style="color: fuchsia; font-size: 15px; text-decoration: none;" href="cardAdd.jsp?value=<%= rs.getString(1) %>">Add To Cart<i><img alt="" src="add-to-cart.png"></i></a></td>
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