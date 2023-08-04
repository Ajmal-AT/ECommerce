
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
	<center><h3 class="title"><b><i> Home <img alt="" src="home-icon-silhouette.png"></i></b></h2></center>
	<center>
	<table style="background: #cccccc; border-radius: 10px; width: 100%;">
		<thead>
			<tr style="style="text-align: center;">
				<th style="padding: 10px 25px 15px 25px;"><b>ID</b></th>
				<th style="padding: 10px 25px 15px 25px;"><b>Name</b></th>
				<th style="padding: 10px 25px 15px 25px;"><b>Category</b></th>
				<th style="padding: 10px 25px 15px 25px;"><b>Price</b></th>
				<th style="padding: 10px 20px 15px 25px;"><b>ADD TO CART <i><img alt="" src="edit-text.png"></i></b></th>
			</tr>
		</thead>
		<tbody>
	<% 
		int sta=0;
	try	{
		String search = request.getParameter("search");
		Connection con = UserCon.getConnection();
		PreparedStatement st = con.prepareStatement("Select * from product_table where product_name like'%"+search+"%' or product_category like'%"+search+"%' and product_active='yes'");
		ResultSet rs = st.executeQuery();
		while(rs.next()) {
			sta=1;
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
		</tbody>
	</table>
	<%
		if(sta==0) {
	%>
			<h1 style="color: white;">Nothing to show.....</h1>
	<% 
		}
	%>
	</center>
</div>

<div class="bot">
	<%@ include file="../footer.jsp" %>
</div>

</body>
</html>