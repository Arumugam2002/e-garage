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
                  <h5 class="card-title">Vehicles <span>/List Vehicles</span></h5>


					<div class="container mt-4">
        
        <div class="table-responsive">
            <table class="table table-bordered table-striped table-hover">
                <thead class="table-dark">
                    <tr>
                        
                        <th>Manufacturer</th>
                        <th>Model</th>
                        <th>Year</th>
                        <th>License Plate</th>
                        <th>Vehicle Class</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${vehicles}" var="v">
                        <tr>
                            
                            <td>${v.manufacturer}</td>
                            <td>${v.model}</td>
                            <td>${v.year}</td>
                            <td>${v.licensePlate}</td>
                            <td>${v.vehicleClass}</td>
                            <td>
																<div class="d-flex flex-row gap-2">
																	<a href="viewvehicle?id=${v.vehiclesId}"
																		class="btn btn-sm btn-success">View</a> <a
																		href="deletevehicle?id=${v.vehiclesId}"
																		class="btn btn-sm btn-danger">Delete</a> <a href="editvehicle?id=${v.vehiclesId}"
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


