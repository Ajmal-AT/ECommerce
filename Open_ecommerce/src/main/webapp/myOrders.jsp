
<!DOCTYPE html>
<%@page import="com.mysql.cj.xdevapi.Result"%>
<%@page import="java.util.Date"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Orders</title>
<link rel="stylesheet" href="../css/adminhome.css">
</head>
<body>
<div class="top">
	<%@ include file="userHeader.jsp"%>
</div>
<% 
	String eml = session.getAttribute("email").toString(); 
	int total=0;
	int cardExtot=0;
%>

<div class="mid">
		<center>
			<h3 class="title"><b><i> My Orders  <img alt="" src="shopping-cart.png"></i></b></h3>
		</center>
		<div style="display: flex; justify-content: center; background: #000080 ;border-radius: 10px;">
			<div style="padding: 30px;">
				<table>
				<%
					try{
						Connection con = UserCon.getConnection();
						PreparedStatement st = con.prepareStatement("select * from cartExist where email='"+eml+"'");
						ResultSet rst =st.executeQuery();
						while(rst.next()){
							cardExtot = rst.getInt(4);
							total = total + cardExtot;
				%>	
						<tr>
							<th> Product Name  </th>
							<th> <%= rst.getString(3) %> </th>
						</tr>
						<tr>
							<th> Total </th>
							<th> <%= rst.getInt(4) %> </th>
						</tr>
				<%
						}
					}
					catch(Exception e) {
						
					}
				%>
				</table>
			</div>
			
			<div style="padding: 10px;">
				<table>
				<% 
					try{
						Connection con = UserCon.getConnection();
						PreparedStatement st = con.prepareStatement("select * from bill where email='"+eml+"' and status='yes'");
						ResultSet rs =st.executeQuery();
						while(rs.next()) { 
				%>	
						<tr>
							<th> Address </th>
							<th> <%= rs.getString(2) %> </th>
						</tr>
						<tr>
							<th> City </th>
							<th> <%= rs.getString(3) %> </th>
						</tr>
						<tr>
							<th> State </th>
							<th> <%= rs.getString(4) %> </th>
						</tr>
						<tr>
							<th> Country </th>
							<th> <%= rs.getString(5) %> </th>
						</tr>
						<tr>
							<th> Contact Number </th>
							<th> <%= rs.getString(6) %> </th>
						</tr>
						<tr>
							<th> Order Date </th>
							<th> <%= rs.getString(7) %> </th>
						</tr>
						<tr>
							<th> Delivery Date </th>
							<th> After 5 days of Order Date </th>
						</tr>
						<tr>
							<th>
								Total amount is <%= total %>
							</th>
						</tr>
				<%
						}
					}
					catch(Exception e){
						
					}
				%>
				</table>
			</div>
				
		</div>
	</div>

<div class="bot">
	<%@ include file="../footer.jsp" %>
</div>

</body>
</html>