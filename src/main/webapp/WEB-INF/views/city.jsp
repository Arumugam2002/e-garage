<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add City</title>

<%@include file="admincss.jsp" %>

</head>
<body>
<%@include file="adminheader.jsp" %>
<%@include file="adminsidebar.jsp" %>
<main id="main" class="main">

    <div class="pagetitle">
     
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
                  <h5 class="card-title">Cities<span>/Add Cities</span></h5>


					
    <div class="container mt-5">
        <div class="card shadow-lg p-4">
        <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger text-center">${errorMessage}</div>
            </c:if>
           
            <form action="savecity" method="post">
             <input type="hidden" value="${user.id}">
                <div class="mb-3">	
                    <label class="form-label">City Name</label>
                    <input type="text" class="form-control" placeholder="Enter city" name="cityName" required>
                </div>
                
            State:-     <select name="stateId">
                <option>Select State </option>
                
                <c:forEach items="${listStates }" var="s">
                
                <option value="${s.stateId}">${s.stateName}</option>
                </c:forEach>
                </select>
                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Get City</button>
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