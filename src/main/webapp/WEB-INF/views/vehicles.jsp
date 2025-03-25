<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>

<%@include file="admincss.jsp"%>

</head>
<body>
	<%@include file="adminheader.jsp"%>
	<%@include file="adminsidebar.jsp"%>
	<main id="main" class="main">

		<div class="pagetitle">
			<h1>Dashboard</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="index.html">Home</a></li>
					<li class="breadcrumb-item active">Dashboard</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section dashboard">
			<div class="row">

				<!-- Left side columns -->
				<div class="col-lg-12">
					<div class="row">







						<!-- Reports -->
						<div class="col-12">
							<div class="card">



								<div class="card-body">
									<h5 class="card-title">
										Vehicles <span>/Add Vehicles</span>
									</h5>


									<div class="container mt-5">
										<div class="card shadow-lg p-4">
											<!-- <h2 class="text-center mb-4">Vehicle Details</h2> -->
											<form action="savevehicles" method="post">
												<div class="mb-3">
													<label class="form-label">Manufacturer Name</label> <input
														type="text" class="form-control" name="manufacturer"
														required>
												</div>

												<div class="mb-3">
													<label class="form-label">Model Name</label> <input
														type="text" class="form-control" name="model" required>
												</div>

												<div class="mb-3">
													<label class="form-label">Manufacture Year</label> <input
														type="number" class="form-control" name="year" required>
												</div>

												<div class="mb-3">
													<label class="form-label">License Plate No</label> <input
														type="text" class="form-control" name="licensePlate"
														required>
												</div>

												<div class="mb-3">
													<label class="form-label">Vehicle Class</label> <select
														class="form-select" name="vehicleClass" required>
														<option value="" disabled selected>Select Vehicle
															Class</option>
														<option value="TwoWheeler">TwoWheeler</option>
														<option value="ThreeWheeler">ThreeWheeler</option>
														<option value="FourWheeler">FourWheeler</option>
													</select>
												</div>

												<div class="text-center">
													<button type="submit" class="btn btn-primary">Submit
														Vehicle Details</button>
												</div>
											</form>
										</div>
									</div>
									<!-- Line Chart -->

									<!-- End Line Chart -->

								</div>

							</div>
						</div>
						<!-- End Reports -->

						<!-- Recent Sales -->
						<!-- End Recent Sales -->

						<!-- Top Selling -->


					</div>
				</div>
				<!-- End Left side columns -->

				<!-- Right side columns -->
				<!-- End Right side columns -->

			</div>
		</section>

	</main>
	<%@include file="adminfooter.jsp"%>
</body>
</html>



