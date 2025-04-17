<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Vehicle</title>

<%@include file="admincss.jsp" %>

</head>
<body>
<%@include file="adminheader.jsp" %>
<%@include file="adminsidebar.jsp" %>
<main id="main" class="main">

    <div class="pagetitle">
      <h1>Dashboard</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item active">Dashboard</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
      <div class="row">

        <!-- Left side columns -->
        <div class="col-lg-12">
          <div class="row">

           

          

           

            <!-- Reports -->
            <div class="col-12">
              <div class="card">

               

                <div class="card-body">
                  <h5 class="card-title">Reports <span>/Today</span></h5>



						<div class="container mt-5">
										<div class="card shadow-lg p-4">
											<!-- <h2 class="text-center mb-4">Vehicle Details</h2> -->
											<form action="editvehicle" method="post">
											
											<input type="hidden" name="vehiclesId" value="${vehicle.vehiclesId}">
												<div class="mb-3">
													<label class="form-label">Manufacturer Name</label> <input
														type="text" class="form-control" name="manufacturer" value="${vehicle.manufacturer }"
														required>
												</div>

												<div class="mb-3">
													<label class="form-label">Model Name</label> <input
														type="text" class="form-control" name="model" value="${vehicle.model }" required>
												</div>

												<div class="mb-3">
													<label class="form-label">Manufacture Year</label> <input
														type="number" class="form-control" name="year" value="${vehicle.year }" required>
												</div>

												<div class="mb-3">
													<label class="form-label">License Plate No</label> <input
														type="text" class="form-control" name="licensePlate"
														value="${vehicle.licensePlate }" required>
												</div>

												<div class="mb-3">
    <label class="form-label">Vehicle Class</label> 
    <select class="form-select" name="vehicleClass" required>
        <option value="" disabled>Select Vehicle Class</option>
        <option value="TwoWheeler" ${vehicle.vehicleClass eq 'TwoWheeler' ? 'selected' : ''}>TwoWheeler</option>
        <option value="ThreeWheeler" ${vehicle.vehicleClass eq 'ThreeWheeler' ? 'selected' : ''}>ThreeWheeler</option>
        <option value="FourWheeler" ${vehicle.vehicleClass eq 'FourWheeler' ? 'selected' : ''}>FourWheeler</option>
    </select>
</div>


												<div class="text-center">
													<button type="submit" class="btn btn-primary">Update
														Vehicle Details</button>
												</div>
											</form>
										</div>
									</div>
                  <!-- Line Chart -->
                  
                  <!-- End Line Chart -->

                </div>

              </div>
            </div><!-- End Reports -->

            <!-- Recent Sales -->
            <!-- End Recent Sales -->

            <!-- Top Selling -->
            

          </div>
        </div><!-- End Left side columns -->

        <!-- Right side columns -->
        <!-- End Right side columns -->

      </div>
    </section>

  </main>
<%@include file="adminfooter.jsp" %>
</body>
</html>


<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html> --%>