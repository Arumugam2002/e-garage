<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<%@include file="admincss.jsp" %>
<!-- for chart -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
                 
                  
                  
            <!-- Sales Card -->
           <div class="row">
    <div class="col-xxl-3 col-md-6">
        <div class="card info-card sales-card">
           <!--  <div class="filter">
                <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                    <li class="dropdown-header text-start">
                        <h6>Filter</h6>
                    </li>
                    <li><a class="dropdown-item" href="#">Today</a></li>
                    <li><a class="dropdown-item" href="#">This Month</a></li>
                    <li><a class="dropdown-item" href="#">This Year</a></li>
                </ul>
            </div> -->

            <div class="card-body">
                <h5 class="card-title">Service Providers</h5>
                <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                        <i class="bi bi-person"></i>
                    </div>
                    <div class="ps-3">
                        <h6>${serviceProviderCount}</h6>
                        <!-- <span class="text-muted small pt-2 ps-1">Service Providers</span> -->
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-xxl-3 col-md-6">
        <div class="card info-card sales-card">
            <!-- <div class="filter">
                <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                    <li class="dropdown-header text-start">
                        <h6>Filter</h6>
                    </li>
                    <li><a class="dropdown-item" href="#">Today</a></li>
                    <li><a class="dropdown-item" href="#">This Month</a></li>
                    <li><a class="dropdown-item" href="#">This Year</a></li>
                </ul>
            </div>
 -->
            <div class="card-body">
                <h5 class="card-title">Total Customer</h5>
                <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                        <i class="bi bi-person"></i>
                    </div>
                    <div class="ps-3">
                        <h6>${totalCustomer}</h6>
                        <!-- <span class="text-muted small pt-2 ps-1">Users</span> -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    
     <div class="col-xxl-3 col-md-6">
        <div class="card info-card sales-card">
            <!-- <div class="filter">
                <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                    <li class="dropdown-header text-start">
                        <h6>Filter</h6>
                    </li>
                    <li><a class="dropdown-item" href="#">Today</a></li>
                    <li><a class="dropdown-item" href="#">This Month</a></li>
                    <li><a class="dropdown-item" href="#">This Year</a></li>
                </ul>
            </div> -->

            <div class="card-body">
                <h5 class="card-title">Total Admins</h5>
                <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                        <i class="bi bi-person"></i>
                    </div>
                    <div class="ps-3">
                        <h6>${totalAdmin}</h6>
                        <!-- <span class="text-muted small pt-2 ps-1">Users</span> -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    
     <div class="col-xxl-3 col-md-6">
        <div class="card info-card sales-card">
            <!-- <div class="filter">
                <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                    <li class="dropdown-header text-start">
                        <h6>Filter</h6>
                    </li>
                    <li><a class="dropdown-item" href="#">Today</a></li>
                    <li><a class="dropdown-item" href="#">This Month</a></li>
                    <li><a class="dropdown-item" href="#">This Year</a></li>
                </ul>
            </div> -->

            <div class="card-body">
                <h5 class="card-title">Vehicles</h5>
                <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                        <i class="bi-car-front"></i>
                    </div>
                    <div class="ps-3">
                        <h6>${vehiclesCount}</h6>
                        <!-- <span class="text-muted small pt-2 ps-1">Users</span> -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div><!-- End Sales Card -->
 <!-- Revenue Card -->
 
 <div class="row">
            <div class="col-xxl-3 col-md-6">
              <div class="card info-card revenue-card">

                <!-- <div class="filter">
                  <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                    <li class="dropdown-header text-start">
                      <h6>Filter</h6>
                    </li>

                    <li><a class="dropdown-item" href="#">Today</a></li>
                    <li><a class="dropdown-item" href="#">This Month</a></li>
                    <li><a class="dropdown-item" href="#">This Year</a></li>
                  </ul>
                </div> -->

                <div class="card-body">
                  <h5 class="card-title">Customers <span>| ${currentMonth}</span></h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-people"></i>
                    </div>
                    <div class="ps-3">
                      <h6>${thisMonthCustomerCount}</h6>
                      <!-- <span class="text-success small pt-1 fw-bold">8%</span> <span class="text-muted small pt-2 ps-1">increase</span> -->

                    </div>
                  </div>
                </div>

              </div>
            </div>

<div class="col-xxl-3 col-md-6">
              <div class="card info-card revenue-card">

                <!-- <div class="filter">
                  <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                    <li class="dropdown-header text-start">
                      <h6>Filter</h6>
                    </li>

                    <li><a class="dropdown-item" href="#">Today</a></li>
                    <li><a class="dropdown-item" href="#">This Month</a></li>
                    <li><a class="dropdown-item" href="#">This Year</a></li>
                  </ul>
                </div> -->

                <div class="card-body">
                  <h5 class="card-title">Appointments <span>| InProgress</span></h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-calendar"></i>
                    </div>
                    <div class="ps-3">
                      <h6>${inProgressAppointment}</h6>
                      <!-- <span class="text-success small pt-1 fw-bold">8%</span> <span class="text-muted small pt-2 ps-1">increase</span> -->

                    </div>
                  </div>
                </div>

              </div>
            </div>
            
            </div>
 

<!-- Intern Analysis -->
            <div class="col-12">
              <div class="card">

                <div class="filter">
                  <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                  <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                    <li class="dropdown-header text-start">
                      <h6>Filter</h6>
                    </li>

                    <li><a class="dropdown-item" href="#">Today</a></li>
                    <li><a class="dropdown-item" href="#">This Month</a></li>
                    <li><a class="dropdown-item" href="#">This Year</a></li>
                  </ul>
                </div>

                <div class="card-body">
                  <h5 class="card-title">Customer Analysis <span>/ Year</span></h5>

                  <!-- Bar Chart -->
                   <canvas id="myChart" width="400" height="180"></canvas>

                   <script>
					      var ctx = document.getElementById('myChart').getContext('2d');
					      var myChart = new Chart(ctx, {
					        type: 'bar',
					        data: {
					          labels: ['January', 'February', 'March', 'April', 'May', 'June','July','August','September','October','November','December'],
					          datasets: [{
					            label: 'Customer Data',
					            data: [${monthWiseCustomer[0]}, ${monthWiseCustomer[1]}, ${monthWiseCustomer[2]}, ${monthWiseCustomer[3]}, ${monthWiseCustomer[4]}, ${monthWiseCustomer[5]}, ${monthWiseCustomer[6]}, ${monthWiseCustomer[7]}, ${monthWiseCustomer[8]}, ${monthWiseCustomer[9]}, ${monthWiseCustomer[10]}, ${monthWiseCustomer[11]}],
					            backgroundColor: [
					              'rgba(255, 99, 132, 0.2)',
					              'rgba(54, 162, 235, 0.2)',
					              'rgba(255, 206, 86, 0.2)',
					              'rgba(75, 192, 192, 0.2)',
					              'rgba(153, 102, 255, 0.2)',
					              'rgba(255, 159, 64, 0.2)'
					            ],
					            borderColor: [
					              'rgba(255, 99, 132, 1)',
					              'rgba(54, 162, 235, 1)',
					              'rgba(255, 206, 86, 1)',
					              'rgba(75, 192, 192, 1)',
					              'rgba(153, 102, 255, 1)',
					              'rgba(255, 159, 64, 1)'
					            ],
					            borderWidth: 1
					          }]
					        },
					        options: {
					          scales: {
					            y: {
					              beginAtZero: true
					            }
					          }
					        }
					      });
					    </script>
                  <!-- End Bar Chart -->

                </div>

              </div>
            </div>
           <!--  End Intern Analysis -->
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


    <%-- <div class="content flex-grow-1 p-3">
       
<h2>Welcome to Admin Dashboard, ${user.firstName}</h2>
        <p>Manage the E-Garage system efficiently.</p>
    </div> --%>
    
    
    
    
    <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script> -->
</body>
</html>
