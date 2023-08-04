<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>REGISTER</title>
</head>
<body style="background: blue;">
	<div style="margin: 5% 20% 5% 20% ; background: #fff; display: flex; border-radius: 15px;">
	
		<%---left side---%>
		<div style="padding: 30px; flex-basis: 40%; border-radius: 15px;">
			<form action="Register.jsp" method="post">
				<input type="text" name="name" style="border: 0px solid transparent; border-bottom: 2px solid black; width: 100%; height: 50px;" placeholder="Enter your name :"><br><br>
				<input type="email" name="email" style="border: 0px solid transparent; border-bottom: 2px solid black; width: 100%; height: 50px;" placeholder="Enter your mail id :"><br><br>
				<input type="text" name="num" style="border: 0px solid transparent; border-bottom: 2px solid black; width: 100%; height: 50px;" placeholder="Enter your mobile number :"><br><br>
				<select name="que" style="border: 0px solid transparent; border-bottom: 2px solid black; width: 100%; height: 50px;">
					<option>Enter your first car</option>
					<option>Enter your first pet</option>
					<option>Enter your nick name</option>
					<option>Enter your first lover</option>
					<option>Enter your mother name</option>
				</select><br><br>
				<input type="text" name="ans" style="border: 0px solid transparent; border-bottom: 2px solid black; width: 100%; height: 50px; " placeholder="Enter your answer :"><br><br>
				<input type="password" name="psd" style="border: 0px solid transparent; border-bottom: 2px solid black; width: 100%; height: 50px;" placeholder="Enter your password :"><br><br>
				<input type="submit" style="width: 100%; height: 50px; border-radius: 10px; background: #ADD8E6; border: 0px solid transparent;" value="Register"><br><br>
			</form>
			<br><br>
			
			<center>
				<a href="LoginPage.jsp" style="text-decoration: none; text-align: center; color: violet;">Login</a>
			</center>
		</div>
		
		<%---right side---%>
		<div style="padding: 30px; padding-left:60px; flex-basis: 60%; background: #ADD8E6; border-radius: 15px;">
				<% 
					String msg = request.getParameter("msg");
					if("valid".equals(msg)){
				%>
						<h5 style="color: green; margin: 10px;"> Seccessfully Registered  ! </h5>	
				<% 
					}
				%>	
				<% 
					if("invalid".equals(msg)) {
				%>
						<h5 style="color: red; margin: 10px;"> Registration Failed ! <br><i style="padding-left: 60px"> Please Try Again ! </i> </h5>
				<%
					}
				%>
			
			<h1 style="color: darkblack; margin: 10px; "><b>Online Shopping</b></h1>
			<p style="color: darkblack; margin: 10px; "><i> The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them </i></p>
			
		</div>
	</div>
</body>
</html>