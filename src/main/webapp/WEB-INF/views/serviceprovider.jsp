<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>

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
                  <h5 class="card-title">Service Provider <span>/Add Service Provider</span></h5>


						 <div class="container mt-5">
        <div class="card shadow-lg p-4">
            <!-- <h2 class="text-center mb-4">Service Provider</h2> -->
            <form action="saveserviceprovider" method="post">
                <div class="mb-3">
                    <label class="form-label">Speciality</label>
                    <input type="text" class="form-control" name="speciality" required>
                </div>
                
                <div class="mb-3">
                    <label class="form-label">Garage Title</label>
                    <input type="text" class="form-control" name="garageTitle" required>
                </div>
                
                <div class="mb-3">
                    <label class="form-label">Zipcode</label>
                    <input type="text" class="form-control" name="zipCode" required>
                </div>
                
                <div class="mb-3">
                    <label class="form-label">Contact No</label>
                    <input type="text" class="form-control" name="contactNo" required>
                </div>
                
                <div class="mb-3">
                    <label class="form-label">Experience Year</label>
                    <input type="number" class="form-control" name="experienceYear" required>
                </div>
                
                <div class="mb-3">
                    <label class="form-label">Other Information</label>
                    <input type="text" class="form-control" name="otherInformation">
                </div>
                
                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Get Service Provider</button>
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


</body>
</html>
