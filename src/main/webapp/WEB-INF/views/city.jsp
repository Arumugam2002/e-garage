<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ page import="com.grownited.entity.Users" %>
<%Users user = (Users) session.getAttribute("loggedInUser");
if(user == null)
{
	response.sendRedirect("login");
	return;	
}



%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>City Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

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
                    
                    <!-- Dropdown Menu -->
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
    </nav>

    <div class="container mt-5">
        <div class="card shadow-lg p-4">
            <h2 class="text-center mb-4">Enter City</h2>
            <form action="savecity" method="post">
            <input type="hidden" value=<%= user.getId() %>>
                <div class="mb-3">
                    <label class="form-label">City Name</label>
                    <input type="text" class="form-control" placeholder="Enter city" name="cityName" required>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Get City</button>
                </div>
            </form>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
