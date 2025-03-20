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
                  <h5 class="card-title">Service Providers <span>/List Service Providers</span></h5>
                  
                  <c:if test="${not empty successMessage}">
								<div class="alert alert-success text-center">${successMessage}</div>
							</c:if>


						<div class="container mt-4">
        <!-- <h2 class="text-center mb-4">Service Provider List</h2> -->
        <div class="table-responsive">
            <table class="table table-bordered table-striped table-hover">
                <thead class="table-dark">
                    <tr>
                       
                        <th>Speciality</th>
                        <th>Garage Title</th>
                        <th>Zip Code</th>
                        <th>Contact No</th>
                        <th>Experience Year</th>
                        <th>Other Information</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${serviceProvider}" var="sp">
                        <tr>
                           
                            <td>${sp.speciality}</td>
                            <td>${sp.garageTitle}</td>
                            <td>${sp.zipCode}</td>
                            <td>${sp.contactNo}</td>
                            <td>${sp.experienceYear}</td>
                            <td>${sp.otherInformation}</td>
                             <td>
																<div class="d-flex flex-row gap-2">
																	<a href="viewuser?id=${u.id}"
																		class="btn btn-sm btn-success">View</a> <a
																		href="deleteuser?id=${u.id}"
																		class="btn btn-sm btn-danger">Delete</a> <a href="edituser?id=${u.id}"
																		class="btn btn-sm btn-primary">Edit</a>
																</div>
															</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
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





