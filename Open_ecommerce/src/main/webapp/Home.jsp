
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
	<h1 style="margin-top: 230px;">Welcome <%= name %>...</h1>
</div>

<div class="bot">
	<%@ include file="../footer.jsp" %>
</div>

</body>
</html>