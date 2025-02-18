<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Service Provider</title>
</head>
<body>

<h1>Service Provider</h1>

<form action="saveserviceprovider" method="post">

	Speciality:- <input type="text" name="speciality"><br><br>
	Garage Title:- <input type="text" name="garageTitle"><br><br>
	Zipcode:- <input type="text" name="zipCode"><br><br>
	Contact No:- <input type="text" name="contactNo"><br><br>
	Experience Year:- <input type="number" name="experienceYear"><br><br>
	Other Information:- <input type="text" name="otherInformation"><br><br>
	
	<input type="submit" value="getServiceProvider">

</form>

</body>
</html>