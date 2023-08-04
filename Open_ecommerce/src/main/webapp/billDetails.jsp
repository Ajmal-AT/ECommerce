
<!DOCTYPE html>
<%@page import="java.util.Date"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Billing</title>
<link rel="stylesheet" href="../css/adminhome.css">
</head>
<body>
<div class="top">
	<%@ include file="userHeader.jsp"%>
</div>
<%
	Date dat = new Date(); 
	String total =  request.getParameter("value");
%>

<div class="mid">
		<form action="billaction.jsp" method="post" style="border-radius: 10px; background: #000080; padding: 10px; padding-top: 10px;">
		<center>
			<h3 class="title"><b><i> Billing Details <img alt="" src="shopping-cart.png"></i></b></h3>
		<%
			String msg = request.getParameter("msg");
			if("done".equals(msg)) {
		%>
			<h6>Billing Successfully</h6>
		<%
			}
			if("nodone".equals(msg)) {
		%>
			<h6>Billing Failure</h6>
		<%
			}
			if("exist".equals(msg)) {
		%>
			<h6>Details allready exist</h6>
		<%
			}
		%>
		</center>
		<table style="width: 100%;">
			<tr >
				<th style=""><input type="text" name="name" style="border: 0px; border-bottom: 2px solid black; padding-left: 10px; background: transparent; width: 50%; color:#00FF00;" placeholder="Enter your full name "> <br></th>
			</tr>
			<tr>
				<th style=" padding-top: 5px;"><textarea name="address" rows="1" style="border: 0px; border-bottom: 2px solid black; padding-left: 10px; background: transparent; width: 50%; color:#00FF00;" placeholder="Enter your address "></textarea><br></th>
			</tr >
			<tr>
				<th style=" padding-top: 5px;"><input type="text" name="city" style="border: 0px; border-bottom: 2px solid black; padding-left: 10px; background: transparent; width: 50%; color:#00FF00;" placeholder="Enter your city "> <br></th>
			</tr>
			<tr>
				<th style=" padding-top: 5px;"><input type="text" name="state" style="border: 0px; border-bottom: 2px solid black; padding-left: 10px; background: transparent; width: 50%; color:#00FF00;" placeholder="Enter your state "> <br></th>
			</tr>
			<tr>
				<th style=" padding-top: 5px;"><input type="text" name="ctry" style=" color:#00FF00; border: 0px; border-bottom: 2px solid black; padding-left: 10px; background: transparent; width: 50%;" placeholder="Enter your country "> <br></th>
			</tr>
			<tr>
				<th style=" padding-top: 5px;"><select name="pay" style=" color:#00FF00; border: 0px; border-bottom: 2px solid black; padding-left: 10px; background: transparent; width: 50%;">
						<option>Payment Method</option>
						<option value="PayTM">PayTM</option>
						<option value="PhonePay">PhonePay</option>
						<option value="GooglePay">GooglePay</option>
					</select> <br>
				</th>
			</tr>
			<tr>
				<th style=" padding-top: 5px;">
					<input type="text" name="status"  value="yes" style="color:#00FF00; border: 0px; border-bottom: 2px solid black; padding-left: 10px; background: transparent; width: 50%; ">
				</th>
			</tr>
			<tr>
				<th style=" padding-top: 5px;"><input type="text" name="date" style="border: 0px; border-bottom: 2px solid black; padding-left: 10px; background: transparent; width: 50%; color:#00FF00;" value="<%= dat%>"> <br></th>		
			</tr>
			<tr>
				<th style=" padding-top: 5px;"><input type="number" name="mnum" style="border: 0px; border-bottom: 2px solid black; padding-left: 10px; background: transparent; width: 50%; color:#00FF00;" placeholder="Enter your contact number "> <br></th>
			</tr>
			<tr style="margin-bottom: 20px;">
				<th style="padding-top: 20px; padding-bottom: 10px;"><input type="submit" name="msg" style=" color:#00FF00; border:2px solid transparent; border-radius:10px; padding-left: 10px; background: #800080; width: 50%; " value="Order"> <br></th>	
			</tr>
		</table>
		</form>
</div>

<div class="bot">
	<%@ include file="../footer.jsp" %>
</div>

</body>
</html>