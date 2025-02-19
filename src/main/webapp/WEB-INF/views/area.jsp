<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Area</title>
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
            <h2 class="text-center mb-4">Add Area</h2>
            <form action="savearea" method="post">
                <div class="mb-3">
                    <label class="form-label">Area Name</label>
                    <textarea class="form-control" name="areaName" rows="3" required></textarea>
                </div>
                
                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Get Area</button>
                </div>
            </form>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
