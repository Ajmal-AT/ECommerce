<!DOCTYPE html>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.ecommerce.project.UserCon"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Product</title>
<link rel="stylesheet" href="../css/adminhome.css">
</head>
<body>

<div class="top">
	<%@ include file="adminHeader.jsp"%>
</div>

<div class="mid">
	<h2 style=" text-align: left; ">
		<a href="viewEditProduct.jsp" style="text-decoration: none; color: black; font-style: oblique;">
			<img alt="" src="left-arrow.png" style="margin-left: 20px; width: 20px; height: 20px; margin-top: 2px;">back</a>
	</h2>
	<% 
	try	{
		String id = request.getParameter("value");
		Connection con = UserCon.getConnection();
		PreparedStatement st = con.prepareStatement("Select * from product_table where product_id='"+id+"'");
		ResultSet rs = st.executeQuery();
		while(rs.next()) {
	%>
		<center><h3 class="proructid"><i> produt id :<%= id %> </i></h2></center>
	<form action="editProductAction.jsp" method="post" class="new-product-form">
		<div class="topdiv">
			<div class="maindiv">
				<input type="hidden" name="id" value="<%= rs.getString(1)%>">
			</div>
			<div class="maindiv">
				<h3>Product Name</h3>
				<input type="text" name="name" value="<%= rs.getString(2) %>">
			</div>
			<div class="maindiv">
				<h3>Product Category</h3>
				<input type="text" name="cate" value="<%= rs.getString(3) %>">
			</div>
		</div>
		<div class="botdiv">
			<div class="maindiv">
				<h3>Product Price</h3>
				<input type="text" name="price" value="<%= rs.getString(4) %>">
			</div>
			<div class="maindiv">
				<h3>Product Active</h3>
				<select name="active">
					<option value="yes">Yes</option>
					<option value="no">No</option>
				</select>
			</div>
		</div><br>
		<input type="submit" value="Update" class="save"> 
	</form>
	<%
	}
	}	
	catch(Exception e) {
	}
	%>
</div>
<div class="bot">
	<%@ include file="../footer.jsp" %>
</div>

</body>
</html>