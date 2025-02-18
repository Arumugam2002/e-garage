<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Services</title>
</head>
<body>

<form action= "saveservices" method="post">

	Service Name:- <input type="text" name="serviceName"> <br><br>
	Service Description:- <input type="text" name="serviceDescription"><br><br>
	InclusivePrice:- <input type="number" name="allInclusivePrice"><br><br>
	
	<input type = "submit" value="getServices">
	
</form>

</body>
</html>