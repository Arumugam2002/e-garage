<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Appointments</title>

<%@include file="admincss.jsp" %>

</head>
<body>
<%@include file="adminheader.jsp" %>
<%@include file="adminsidebar.jsp" %>
<main id="main" class="main">

    <

    <section class="section dashboard">
      <div class="row">

        <!-- Left side columns -->
        <div class="col-lg-12">
          <div class="row">

           

          

           

            <!-- Reports -->
            <div class="col-12">
              <div class="card">

               

                <div class="card-body">
                  <h5 class="card-title">Appointments <span>/List Appointments</span></h5>


					 <div class="table-responsive">
            <table class="table table-bordered table-striped table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>Appointment DateTime</th>
                        <th>Base Price</th>
                        <th>Price</th>
                        <th>Reason</th>
                        <th>Service Provider Name</th>
                        <th>Service Name</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${allAppointments}" var="a">
                        <tr>
                            <td>${a.appointmentDateTime}</td>
                            <td>${a.basePrice}</td>
                            <td>${a.price}</td>
                            <td>${a.reason}</td>
                            <td>${a.servicesId}</td>
                            <td>${a.serviceProviderId}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
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


    

