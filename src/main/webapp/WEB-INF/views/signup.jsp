<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Sign up</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/garage.png" rel="icon">
<link href="assets/img/garage.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<!-- Vendor CSS Files -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
<link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
<link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">

<!-- =======================================================
  * Template Name: NiceAdmin
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Updated: Apr 20 2024 with Bootstrap v5.3.3
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

	<main>
		<div class="container">

			<section
				class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
				<div class="container">
					<div class="row justify-content-center">
						<div
							class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

							<div class="d-flex justify-content-center py-4">
								<a href="index.html"
									class="logo d-flex align-items-center w-auto"> <img
									src="assets/img/garage.png" alt=""> <span
									class="d-none d-lg-block">E Garage</span>
								</a>
							</div>
							<!-- End Logo -->

							<div class="card mb-3">

								<div class="card-body">

									<div class="pt-4 pb-2">
										<h5 class="card-title text-center pb-0 fs-4">Create an
											Account</h5>

									</div>
									<c:if test="${not empty errorMessage}"> 
   						 <div class="alert alert-danger text-center">${errorMessage}</div> 
						</c:if>

									<form class="row g-3 needs-validation" novalidate action="saveuser" method="post"  enctype="multipart/form-data">
										<div class="col-12">
											<label for="yourName" class="form-label"> First
												Name</label>
											<div class="input-group">
												<span class="input-group-text"><i class="fas fa-user"></i></span>
												<input type="text" name="firstName" class="form-control"
													id="yourName" required>

												<div class="invalid-feedback">Please, enter your name!</div>
											</div>
										</div>

										<div class="col-12">
											<label for="yourName" class="form-label"> Last
												Name</label>
											<div class="input-group">
												<span class="input-group-text"><i class="fas fa-user"></i></span>
												<input type="text" name="lastName" class="form-control"
													id="yourName" required>
												<div class="invalid-feedback">Please, enter your last
													name!</div>
											</div>
										</div>

										<div class="col-12">
											<label for="yourEmail" class="form-label">Email</label>

											<div class="input-group">
												<span class="input-group-text"><i
													class="fas fa-envelope"></i></span> <input type="email"
													name="email" class="form-control" id="yourEmail" required>
												<div class="invalid-feedback">Please enter a valid
													Email address!</div>
											</div>
										</div>

										<!-- <div class="col-12">
                      <label for="yourUsername" class="form-label">Username</label>
                      <div class="input-group has-validation">
                        <span class="input-group-text" id="inputGroupPrepend">@</span>
                        <input type="text" name="username" class="form-control" id="yourUsername" required>
                        <div class="invalid-feedback">Please choose a username.</div>
                      </div>
                    </div> -->

										<div class="col-12">
											<label for="yourPassword" class="form-label">Password</label>
											<div class="input-group">

												<span class="input-group-text" onclick="togglePassword()"
													style="cursor: pointer;"> <i class="fas fa-eye"
													id="toggleIcon"></i>
												</span> <input type="password" class="form-control" id="password"
													name="password" required>
												<div class="invalid-feedback">Please enter your
													password!</div>

											</div>
										</div>


										<!-- <div class="col-12">
											<label for="yourPassword" class="form-label">Password</label>
											<input type="password" name="password" class="form-control"
												id="yourPassword" required>
											<div class="invalid-feedback">Please enter your
												password!</div>
										</div> -->

										<div class="col-12">

											<label for="yourName" class="form-label">Contact No</label>
											<div class="input-group">
												<span class="input-group-text"><i
													class="fas fa-phone"></i></span> <input type="text"
													name="contactNo" class="form-control" id="yourContact"
													required>
												<div class="invalid-feedback">Please, enter your
													contact number!</div>
											</div>
										</div>

										<div class="mb-3">
											<label class="form-label">Gender</label>
											<div class="d-flex gap-3">
												<div class="form-check">
													<input class="form-check-input" type="radio" name="gender"
														value="Male" required> <label
														class="form-check-label">Male</label>
												</div>
												<div class="form-check">
													<input class="form-check-input" type="radio" name="gender"
														value="Female"> <label class="form-check-label">Female</label>
												</div>
												<div class="form-check">
													<input class="form-check-input" type="radio" name="gender"
														value="Other"> <label class="form-check-label">Other</label>
												</div>
											</div>
										</div>
										
										<div class="col-12">

											<label for="yourName" class="form-label">Profile Photo</label>
											<div class="input-group">
												 <input type="file"
													name="profilePic" class="form-control" id="yourContact"
													required>
												<div class="invalid-feedback">Please, enter your
													contact number!</div>
											</div>
										</div>



										<div class="col-12">
											<div class="form-check">
												<input class="form-check-input" name="terms" type="checkbox"
													value="" id="acceptTerms" required> <label
													class="form-check-label" for="acceptTerms">I agree
													and accept the <a href="#">terms and conditions</a>
												</label>
												<div class="invalid-feedback">You must agree before
													submitting.</div>
											</div>
										</div>
										<div class="col-12">
											<button class="btn btn-primary w-100" type="submit">Create
												Account</button>
										</div>
										<div class="col-12">
											<p class="small mb-0">
												Already have an account? <a href="login">Log in</a>
											</p>
										</div>
									</form>

								</div>
							</div>

							<!-- <div class="credits">
                All the links in the footer should remain intact.
                You can delete the links only if you purchased the pro version.
                Licensing information: https://bootstrapmade.com/license/
                Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
                Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
              </div> -->

						</div>
					</div>
				</div>

			</section>

		</div>
	</main>
	<!-- End #main -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendor/chart.js/chart.umd.js"></script>
	<script src="assets/vendor/echarts/echarts.min.js"></script>
	<script src="assets/vendor/quill/quill.js"></script>
	<script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
	<script src="assets/vendor/tinymce/tinymce.min.js"></script>
	<script src="assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>
	<script src="assets/js/signup.js"></script>

</body>

</html>







<!-- Admin lte based bootstrap signup page -->

<%-- 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Sign Up | E-Garage</title>
    
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <!-- Font Awesome (Fix for Icons) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <style>
        body {
            background: linear-gradient(to right, #6a11cb, #2575fc);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .card {
            border-radius: 15px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
        }
        .input-group-text {
            background: #6a11cb;
            color: white;
            border: none;
        }
        .btn-primary {
            background: #6a11cb;
            border: none;
        }
        .btn-primary:hover {
            background: #2575fc;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card p-4">
                    <div class="card-body">
                    <h2 class="text-center mb-4">E-Garage</h2>
                        <h3 class="text-center mb-4">Sign Up</h3>
                        <c:if test="${not empty errorMessage}"> 
   						 <div class="alert alert-danger text-center">${errorMessage}</div> 
						</c:if>
                        <form action="saveuser" method="post">
                            <div class="mb-3">
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                    <input type="text" class="form-control" name="firstName" placeholder="First Name" required>
                                </div>
                            </div>
                            <div class="mb-3">
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                    <input type="text" class="form-control" name="lastName" placeholder="Last Name" required>
                                </div>
                            </div>
                            <div class="mb-3">
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                                    <input type="email" class="form-control" name="email" placeholder="Email" required>
                                </div>
                            </div>
                            
                            <div class="mb-3">
    <div class="input-group">
       
        <span class="input-group-text" onclick="togglePassword()" style="cursor: pointer;">
            <i class="fas fa-eye" id="toggleIcon"></i>
        </span>
        <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
        
    </div>
</div>
                            
                            
                            <!-- <div class="mb-3">
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-lock"></i></span>
                                    <input type="password" class="form-control" name="password" placeholder="Password" required>
                                </div>
                            </div> -->
                            <div class="mb-3">
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-phone"></i></span>
                                    <input type="text" class="form-control" name="contactNo" placeholder="Contact Number" required>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Gender</label>
                                <div class="d-flex gap-3">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="gender" value="Male" required>
                                        <label class="form-check-label">Male</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="gender" value="Female">
                                        <label class="form-check-label">Female</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="gender" value="Other">
                                        <label class="form-check-label">Other</label>
                                    </div>
                                </div>
                            </div>
                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary">Register</button>
                            </div>
                        </form>
                        <p class="text-center mt-3">
                            Already have an account? <a href="login">Login</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script src="/dist/js/signup.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
 --%>



<!--  Normal Bootstrap signup page -->

<%-- 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: orange;
        }
        .container {
            max-width: 500px;
            margin-top: 50px;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center">Sign Up</h2>
        <!--<c:if test="${not empty errorMessage}"> 
    <div class="alert alert-danger text-center">${errorMessage}</div> 
</c:if> -->
        
        <form action="saveuser" method="post">
            <div class="mb-3">
                <label class="form-label">First Name</label>
                <input type="text" class="form-control" name="firstName" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Last Name</label>
                <input type="text" class="form-control" name="lastName" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Email</label>
                <input type="email" class="form-control" name="email" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Password</label>
                <input type="password" class="form-control" name="password" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Mobile No</label>
                <input type="text" class="form-control" name="contactNo" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Gender</label><br>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="gender" value="Male" required>
                    <label class="form-check-label">Male</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="gender" value="Female">
                    <label class="form-check-label">Female</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="gender" value="Other">
                    <label class="form-check-label">Other</label>
                </div>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-primary">Sign Up</button>
            </div>
        </form>
        <div class="text-center mt-3">
            <a href="login" class="btn btn-link">Login</a>
            <a href="state" class="btn btn-link">Enter State</a>
        </div>
    </div>
</body>
</html>

--%>

