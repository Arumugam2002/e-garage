<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Verify Otp</title>
</head>
<body>

<c:if test="${not empty error}">

								<div class="alert alert-danger text-center">${error}</div>


							</c:if>

<form action="verifyotp" method="post">
<input type="hidden" name="email" value="${email}">

Enter OTP:- 

  <input type="text" name="otp" required>
        <button type="submit">Verify OTP</button>


</form>


</body>
</html>