<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reset Password</title>
</head>
<body>
<h1>Reset Password</h1>

 <c:if test="${not empty error}">

								<div class="alert alert-danger text-center">${error}</div>


							</c:if>

<form action = "updatepassword" method="post">
<input type="hidden" name="email" value="${email}">

New Password:- 

<input type="password" name="password" required>
<button type="submit">Reset Password</button>


</form>
</body>
</html>