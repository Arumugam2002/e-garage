<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>E-Garage | Home</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>

	<%-- <%@ page import ="com.grownited.entity.Users" %>

<%Users user = (Users) session.getAttribute("loggedInUser");
if(user == null)
{
	response.sendRedirect("login");
	return;	
}

%>  

<input type="hidden" value= <%=user.getId() %>>  --%>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="index">E-Garage</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link" href="#services">Services</a></li>
					<li class="nav-item"><a class="nav-link" href="#about">About
							Us</a></li>
					<li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
					<li class="nav-item"><a class="nav-link" href="signup">Signup</a></li>
					<%--   <li class="nav-item"><a class="nav-link" href="login"><%=user.getFirstName() %></a></li> --%>
					<!-- <li class="nav-item"><a class="nav-link" href="state">Login</a></li> -->
					<li class="nav-item"><a class="nav-link" href="state">State</a></li>

					<!-- Dropdown Menu -->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							More Pages </a>
						<ul class="dropdown-menu dropdown-menu-end"
							aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="appointment">Appointment</a></li>
							<li><a class="dropdown-item" href="area">Area</a></li>
							<li><a class="dropdown-item" href="city">City</a></li>
							<li><a class="dropdown-item" href="state">State</a></li>
							<li><a class="dropdown-item" href="vehicles">Vehicles</a></li>
							<li><a class="dropdown-item" href="services">Services</a></li>
							<li><a class="dropdown-item" href="serviceprovider">ServiceProvider</a></li>
							<li><a class="dropdown-item" href="payment">Payment</a></li>

						</ul></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="userDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							<i class="bi bi-person-circle"></i> ${user.firstName}
					</a>
						<ul class="dropdown-menu" aria-labelledby="userDropdown">
							<li><a class="dropdown-item" href="userprofile">Profile</a></li>
							<li><a class="dropdown-item" href="settings">Settings</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item text-danger" href="logout">Logout</a></li>
						</ul></li>

				</ul>
			</div>
		</div>
	</nav>

	<h2>Welcome, ${user.firstName}</h2>


	<section id="hero" class="text-center py-5 bg-light">
		<div class="container">
			<h2>Your One-Stop Solution for Vehicle Maintenance</h2>
			<p>Book your vehicle servicing, repairs, and inspections with
				ease.</p>
			<a href="#services" class="btn btn-primary">Explore Services</a>
		</div>
	</section>

	<section id="services" class="py-5">
		<div class="container">
			<h2 class="text-center">Our Services</h2>
			<ul class="list-group">
				<li class="list-group-item">General Vehicle Service</li>
				<li class="list-group-item">Engine Repair</li>
				<li class="list-group-item">Oil Change</li>
				<li class="list-group-item">Battery Replacement</li>
				<li class="list-group-item">Wheel Alignment</li>
			</ul>
		</div>
	</section>

	<section id="about" class="py-5 bg-light">
		<div class="container">
			<h2 class="text-center">About Us</h2>
			<p class="text-center">E-Garage is dedicated to providing
				top-quality vehicle maintenance and repair services. Our expert
				mechanics ensure your vehicle is always in top condition.</p>
		</div>
	</section>

	<section id="contact" class="py-5">
		<div class="container text-center">
			<h2>Contact Us</h2>
			<p>Email: support@egarage.com</p>
			<p>Phone: +1 234 567 890</p>
		</div>
	</section>

	<footer class="text-center bg-dark text-white py-3">
		<p>&copy; 2025 E-Garage. All rights reserved.</p>
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
