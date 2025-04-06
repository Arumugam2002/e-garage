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
                
                     
            <label>Services:</label>
<select name="servicesId" id="serviceSelect" onchange="updateBasePrice()">
    <option value="">Select Service</option>
    <c:forEach items="${allServices}" var="s">
        <option value="${s.servicesId}">${s.serviceName}</option>
    </c:forEach>
</select>
                 ServiceProvider:-     <select name="serviceProviderId">
                <option>Select Service Providers </option>
                
                <c:forEach items="${allServiceProviders }" var="sp">
                
                <option value="${sp.serviceProviderId}">${sp.garageTitle}</option>
                </c:forEach>
                </select>
                 <br><br>
                <!-- Base Price Field (Read-Only) -->
<div class="mb-3">
    <label class="form-label">Base Price</label>
    <input type="number" class="form-control" id="basePrice" name="basePrice" readonly>
</div>

<!-- Hidden Price Field -->
<input type="hidden" id="price" name="price">
                
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

<script>
    var services = [];

    // Populate the services array with data from the backend
    <c:forEach var="s" items="${allServices}">
        services.push({ servicesId: "${s.servicesId}", basePrice: "${s.allInclusivePrice}" });
    </c:forEach>;

    function updateBasePrice() {
        var selectedServiceId = document.getElementById("serviceSelect").value;

        // Find the selected service from the array
        var selectedService = services.find(service => service.servicesId == selectedServiceId);

        if (selectedService) {
            document.getElementById("basePrice").value = selectedService.basePrice;
            document.getElementById("price").value = selectedService.basePrice; // Auto-fill price
        } else {
            document.getElementById("basePrice").value = "";
            document.getElementById("price").value = "";
        }
    }
</script>
</body>
</html>


