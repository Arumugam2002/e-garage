<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
</head>
<body>
<h2>Welcome to Admin Dashboard, ${user.firstName}</h2><br><br>

<a href="logout">Logout</a>
</body>
</html> --%>

<%@include file="adminheader.jsp" %>


    <div class="content flex-grow-1 p-3">
       
<h2>Welcome to Admin Dashboard, ${user.firstName}</h2>
        <p>Manage the E-Garage system efficiently.</p>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
