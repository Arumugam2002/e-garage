<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Services</title>

<%@include file="admincss.jsp" %>

</head>
<body>
<%@include file="adminheader.jsp" %>
<%@include file="adminsidebar.jsp" %>
<main id="main" class="main">

    <div class="pagetitle">
      <h1>Services</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item active">Services</li>
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
                


					
    <div class="container mt-5">
        <div class="card shadow-lg p-4">
           
            <form action="saveservices" method="post">
                <div class="mb-3">
                    <label class="form-label">Service Name</label>
                    <input type="text" class="form-control" name="serviceName" required>
                </div>
                
                <div class="mb-3">
                    <label class="form-label">Service Description</label>
                    <input type="text" class="form-control" name="serviceDescription" required>
                </div>
                
                <div class="mb-3">
                    <label class="form-label">Inclusive Price</label>
                    <input type="number" class="form-control" name="allInclusivePrice" required>
                </div>
                
                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Get Services</button>
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