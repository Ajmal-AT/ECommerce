<!DOCTYPE html>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.ecommerce.project.UserCon"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add New Product</title>
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
		<h4 style="color: green; margin: 10px; text-align: center; font-weight: bold; font-size: 20px; margin-top: 20px;"> Product Seccessfully Saved! </h4>	
	<% 
	}
	%>	
	<% 
		if("wrong".equals(msg)) {
	%>
		<h4 style="color: red; margin: 10px; text-align: center;  font-weight: bold; font-size: 20px; margin-top: 20px;"> Product Saved Failed! <br><i style="padding-left: 60px"> Please Try Again! </i> </h4>
	<%
	}
	%>
	
	<% 
	int id=0;
	try	{
		Connection con = UserCon.getConnection();
		PreparedStatement st = con.prepareStatement("Select max(product_id) from product_table");
		ResultSet rs = st.executeQuery();
		while(rs.next()) {
			id=rs.getInt(1);
			id=id+1;
		}
	}	
	catch(Exception e) {
	}
%>
	<center><h3 class="proructid"><i> produt id :<%= id %> </i></h2></center>
	<form action="newProductAction.jsp" method="post" class="new-product-form">

		<div class="topdiv">
			<div class="maindiv">
				<input type="hidden" name="id" value="<%= id %>">
			</div>
			<div class="maindiv">
				<h3>Product Name</h3>
				<input type="text" name="name" value="Enter Product name ">
			</div>
			<div class="maindiv">
				<h3>Product Category</h3>
				<input type="text" name="cate" value="Enter Product category ">
			</div>
		</div>
		<div class="botdiv">
			<div class="maindiv">
				<h3>Product Price</h3>
				<input type="text" name="price" value="Enter Product price ">
			</div>
			<div class="maindiv">
				<h3>Product Active</h3>
				<select name="active">
					<option value="yes">Yes</option>
					<option value="no">No</option>
				</select>
			</div>
		</div><br>
		<input type="submit" value="Save" class="save"> 
	</form>
</div>
<div class="bot">
	<%@ include file="../footer.jsp" %>
</div>

</body>
</html>