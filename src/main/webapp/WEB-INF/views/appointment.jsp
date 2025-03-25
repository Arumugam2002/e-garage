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
                  <h5 class="card-title">Appointments <span>/Add Appointment</span></h5>


						
    <div class="container mt-5">
        <div class="card shadow-lg p-4">
            <!-- <h2 class="text-center mb-4">Book an Appointment</h2> -->
            <form action="saveappointment" method="post">
                
                     
            Services:-     <select name="servicesId">
                <option>Select Services </option>
                
                <c:forEach items="${allServices }" var="s">
                
                <option value="${s.servicesId}">${s.serviceName}</option>
                </c:forEach>
                </select>
                <br><br>
                 ServiceProvider:-     <select name="serviceProviderId">
                <option>Select Service Providers </option>
                
                <c:forEach items="${allServiceProviders }" var="sp">
                
                <option value="${sp.serviceProviderId}">${sp.garageTitle}</option>
                </c:forEach>
                </select>
                 <br><br>
                <div class="mb-3">
                    <label class="form-label">Appointment Base Price</label>
                    <input type="number" class="form-control" name="basePrice" required>
                </div>
                
                <div class="mb-3">
                    <label class="form-label">Appointment Price</label>
                    <input type="number" class="form-control" name="price" required>
                </div>
                
                <div class="mb-3">
                    <label class="form-label">Appointment Date</label>
                    <input type="datetime-local" class="form-control" name="appointmentDateTime" required>
                </div>
                
                <div class="mb-3">
                    <label class="form-label">Reason</label>
                    <textarea class="form-control" name="reason" rows="3" required></textarea>
                </div>
                
                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Get Appointment</button>
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


