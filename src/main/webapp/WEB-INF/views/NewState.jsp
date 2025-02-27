<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  
<%@ page import="com.grownited.entity.Users" %>
<%Users user = (Users) session.getAttribute("user");
if(user == null)
{
	response.sendRedirect("login");
	return;	
}



%> 
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>State</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body> -->
<%@include file="admincss.jsp" %>
<%@include file="adminheader.jsp" %>
<%@include file="adminsidebar.jsp" %>

<!-- 
 <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="#">E-Garage</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="#services">Services</a></li>
                    <li class="nav-item"><a class="nav-link" href="#about">About Us</a></li>
                    <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
                    <li class="nav-item"><a class="nav-link" href="signup">Signup</a></li>
                    <li class="nav-item"><a class="nav-link" href="login">Login</a></li>
                    <li class="nav-item"><a class="nav-link" href="state">State</a></li>
                    
                    Dropdown Menu
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            More Pages
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="appointment">Appointment</a></li>
                            <li><a class="dropdown-item" href="area">Area</a></li>
                            <li><a class="dropdown-item" href="city">City</a></li>
                            <li><a class="dropdown-item" href="state">State</a></li>
                            <li><a class="dropdown-item" href="vehicles">Vehicles</a></li>
                            <li><a class="dropdown-item" href="services">Services</a></li>
                            <li><a class="dropdown-item" href="serviceprovider">ServiceProvider</a></li>
                            <li><a class="dropdown-item" href="payment">Payment</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav> -->
    <div class="container mt-5">
<div class="row justify-content-center">
        <div class="col-md-6">
        <br>
            <h2 class="text-center mb-4">State Page</h2>

            <!-- Error Message Alert -->
            <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger text-center">${errorMessage}</div>
            </c:if>

            <div class="card shadow p-4">
                <form action="savestate" method="post">
                    <input type="hidden" value="<%= user.getId() %>">
                    
                    <div class="mb-3">
                        <label class="form-label">State Name:</label>
                        <input type="text" name="stateName" class="form-control" placeholder="Enter state name" required>
                    </div>

                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary">Save State</button>
                    </div>
                </form>
            </div>
        </div>
    </div>	
    </div>
	<%@include file="adminfooter.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>