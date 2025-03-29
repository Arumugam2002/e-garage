<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                  
                   <c:if test="${not empty error}">

								<div class="alert alert-danger text-center">${error}</div>


							</c:if>
							


						 <div class="container mt-5">
        <div class="card shadow-lg p-4">
            <!-- <h2 class="text-center mb-4">Service Provider</h2> -->
            <form action="editserviceprovider" method="post">
             <input type="hidden" name="id" value="${serviceProvider.serviceProviderId}">
                <div class="mb-3">
                    <label class="form-label">Speciality</label>
                    <input type="text" class="form-control" name="speciality" value="${serviceProvider.speciality }" required>
                </div>
                
                <div class="mb-3">
                    <label class="form-label">Garage Title</label>
                    <input type="text" class="form-control" name="garageTitle" value="${serviceProvider.garageTitle }" required>
                </div>
                
                <div class="mb-3">
                    <label class="form-label">Zipcode</label>
                    <input type="text" class="form-control" name="zipCode" value="${serviceProvider.zipCode }" required>
                </div>
                
                <div class="mb-3">
                    <label class="form-label">Contact No</label>
                    <input type="text" class="form-control" name="contactNo" value="${serviceProvider.contactNo }" required>
                </div>
                
                <div class="mb-3">
                    <label class="form-label">Experience Year</label>
                    <input type="number" class="form-control" name="experienceYear" value="${serviceProvider.experienceYear }" required>
                </div>
                
                <div class="mb-3">
                    <label class="form-label">Other Information</label>
                    <input type="text" class="form-control" name="otherInformation" value="${serviceProvider.otherInformation }">
                </div>
                
                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Update Service Provider</button>
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
