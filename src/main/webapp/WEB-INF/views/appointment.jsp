<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Appointment</title>
</head>
<body>

<form action = "saveappointment" method="post">

	
	Appointment Base Price:- <input type="number" name ="basePrice"> <br><br>
	
	Appointment Price:- <input type="number" name ="price"> <br><br>
	
	Appointment Date:- <input type="datetime-local" name ="appointmentDateTime"> <br><br>
	
	Status:- <input type="text" name="status"> <br><br>
	
	Reason:- <textarea name="reason"></textarea><br><br>
	
	<input type="submit" value="getAppointment">

</form>

</body>
</html>