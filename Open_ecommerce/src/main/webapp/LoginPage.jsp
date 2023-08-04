<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LOGIN</title>
</head>
<body style="background: blue;">
	<div style="margin: 13% 20% 5% 20% ; background: #fff; display: flex; border-radius: 15px;">
	
		<%---left side---%>
		<div style="padding: 30px; flex-basis: 40%; border-radius: 15px;">
			<form action="Login.jsp" method="post">
				<input type="email" name="email" style="border: 0px solid transparent; border-bottom: 2px solid black; width: 100%; height: 50px;" placeholder="Enter your user name :"><br><br>
				<input type="password" name="psd" style="border: 0px solid transparent; border-bottom: 2px solid black; width: 100%; height: 50px;" placeholder="Enter your password :"><br><br>
				<input type="submit" style="width: 100%; height: 50px; border-radius: 10px; background: #ADD8E6; border: 0px solid transparent;" value="Login"><br><br>
			</form>
			<br><br>
			
			<center>
				<a href="RegisterPage.jsp" style="text-decoration: none; text-align: center; color: violet;">Register</a><br><br>
				<a href="ForgotPage.jsp" style="text-decoration: none; text-align: center; color: violet;">Forgot Password</a>
			</center>
		</div>
		
		<%---right side---%>
		<div style="padding: 30px; padding-left:60px; flex-basis: 60%; background: #ADD8E6; border-radius: 15px;">
				<% 
					String msg = request.getParameter("msg");
					if("notexist".equals(msg)){
				%>
						<h5 style="color: red; margin: 10px;"> Incorrect username or password !</h5>
				<% 
					}
				%>	
				<% 
					if("invalid".equals(msg)) {
				%>
						<h5 style="color: red; margin: 10px;"> Login Failed ! <br><i style="padding-left: 60px"> Please Try Again ! </i> </h5>
				<%
					}
				%>
			
			<h1 style="color: darkblack; margin: 10px; "><b>Online Shopping</b></h1>
			<p style="color: darkblack; margin: 10px; "><i> The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them </i></p>
			
		</div>
	</div>
</body>
</html>