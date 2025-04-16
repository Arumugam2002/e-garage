 <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
    <!-- Spinner End -->


    <!-- Topbar Start -->
    <div class="container-fluid bg-light p-0">
        <div class="row gx-0 d-none d-lg-flex">
            <div class="col-lg-7 px-5 text-start">
                <div class="h-100 d-inline-flex align-items-center py-3 me-4">
                    <small class="fa fa-map-marker-alt text-primary me-2"></small>
                    <small>123 Street, New York, USA</small>
                </div>
                <div class="h-100 d-inline-flex align-items-center py-3">
                    <small class="far fa-clock text-primary me-2"></small>
                    <small>Mon - Fri : 09.00 AM - 09.00 PM</small>
                </div>
            </div>
            <div class="col-lg-5 px-5 text-end">
                <div class="h-100 d-inline-flex align-items-center py-3 me-4">
                    <small class="fa fa-phone-alt text-primary me-2"></small>
                    <small>+012 345 6789</small>
                </div>
                <div class="h-100 d-inline-flex align-items-center">
                    <a class="btn btn-sm-square bg-white text-primary me-1" href=""><i class="fab fa-facebook-f"></i></a>
                    <a class="btn btn-sm-square bg-white text-primary me-1" href=""><i class="fab fa-twitter"></i></a>
                    <a class="btn btn-sm-square bg-white text-primary me-1" href=""><i class="fab fa-linkedin-in"></i></a>
                    <a class="btn btn-sm-square bg-white text-primary me-0" href=""><i class="fab fa-instagram"></i></a>
                </div>
            </div>
        </div>
    </div>
    <!-- Topbar End -->


    <!-- Navbar Start -->
    <nav class="navbar navbar-expand-lg bg-white navbar-light shadow sticky-top p-0">
       <a href="index" class="navbar-brand d-flex align-items-center px-4 px-lg-5 logo d-flex align-items-center">
    <h2 class="m-0 text-primary">
        <img src="assets/img/garage.png" alt="" style="width: 40px; height: 40px; margin-right: 10px;">
        E Garage
    </h2>
</a>
        <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto p-4 p-lg-0">
                <a href="serviceproviderhome" class="nav-item nav-link active">Home</a>
               <!--  <a href="about.html" class="nav-item nav-link">About</a> -->
                <a href="viewservicegarage" class="nav-item nav-link">View Garages</a>
                <a href="servicegarage" class="nav-item nav-link">Add Garage</a>
                <!-- <a href="garages" class="nav-item nav-link">Garages</a> -->
                
                 
               <!--  <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                    <div class="dropdown-menu fade-up m-0">
                        <a href="booking.html" class="dropdown-item">Booking</a>
                        <a href="team.html" class="dropdown-item">Technicians</a>
                        <a href="testimonial.html" class="dropdown-item">Testimonial</a>
                        <a href="404.html" class="dropdown-item">404 Page</a>
                    </div>
                </div>
                <a href="contact.html" class="nav-item nav-link">Contact</a> -->
              
                <li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="userDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							<img src="${not empty user.profilePicPath ? user.profilePicPath : 'assets/img/profile-img.jpg'}" alt="Profile" class="profile-pic">${user.firstName}
					</a>
						<ul class="dropdown-menu" aria-labelledby="userDropdown">
							<li><a class="dropdown-item" href="serviceproviderprofile">Profile</a></li>
						<!-- 	<li><a class="dropdown-item" href="servicegarage">Add Your Garage</a></li> -->
							<!-- <li><a class="dropdown-item" href="servicegarageadd">Add Services</a></li> -->
							<li><a class="dropdown-item" href="serviceproviderchangepassword">Change Password</a></li>
							<!-- <li><a class="dropdown-item" href="settings">Settings</a></li> -->
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item text-danger" href="logout">Logout</a></li>
						</ul></li>
            </div>
            <!-- <a href="" class="btn btn-primary py-4 px-lg-5 d-none d-lg-block">Get A Quote<i class="fa fa-arrow-right ms-3"></i></a> -->
        </div>
    </nav>
    <!-- Navbar End -->