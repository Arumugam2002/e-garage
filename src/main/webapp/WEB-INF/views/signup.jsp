<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
     
  </style> 
</head>
<body>

<h1>Sign up Page</h1>

<form action="saveuser" method="post">

	First Name:- <input type="text" name="firstName">
	<br><br>
	
	Last Name:- <input type="text" name="lastName">
	<br><br>
	
	Email:- <input type="text" name="email">
	<br><br>
	
	Password:- <input type="password" name="password">
	<br><br>
	
	Mobile No:- <input type="number" name="mobileNumber">
	<br><br>
	
	<input type="submit" value="signup">
	
	
</form>

<a href="login">Login</a>
	
</body>
</html>