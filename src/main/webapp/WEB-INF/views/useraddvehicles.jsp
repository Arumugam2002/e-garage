<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="usercss.jsp" />

<body>
    <jsp:include page="userheader.jsp" />

    <div class="container mt-5">
										<div class="card shadow-lg p-4">
											<!-- <h2 class="text-center mb-4">Vehicle Details</h2> -->
											<form action="useraddvehicles" method="post">
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

    <jsp:include page="userfooter.jsp" />

    <!-- Bootstrap form validation script -->
    
</body>
</html>




