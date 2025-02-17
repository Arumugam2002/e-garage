<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vehicle Details</title>
</head>
<body>

<form action = "savevehicles" method="post">

	 manufacturer name:- <input type="text" name="manufacturer"><br><br>
	
	 model name:- <input type="text" name="model"><br><br>
	
	 manufacture year:- <input type="number" name="year"><br><br>
	
	 License Plate No:-<input type="text" name="licensePlate"><br><br>
	
	Vehicle Class:- <input type="text" name="vehicleClass"><br><br>
	
	<input type="submit" value="vehicleDetails">
	

</form>
</body>
</html>