<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List All Users</title>
</head>
<body>

<h1>Users List</h1>
	<table>
	<c:forEach items="${userList}" var="u">
	
	<!-- ${u.firstName} | ${u.lastName} |  ${u.email} | ${u.contactNo} | ${u.gender}<br> -->
	
	<tr>
	<td>${u.firstName}</td>
	<td>${u.lastName}</td>
	<td>${u.email}</td>
	<td>${u.contactNo}</td>
	<td>${u.gender}</td>
	</tr>	
	</c:forEach>
	
	
	</table>
	
</body>
</html>