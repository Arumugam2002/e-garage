<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit User</title>

<%@include file="admincss.jsp" %>

</head>
<body>
<%@include file="adminheader.jsp" %>
<%@include file="adminsidebar.jsp" %>
<main id="main" class="main">


    <section class="section dashboard">
      <div class="row">

        <!-- Left side columns -->
        <div class="col-lg-12">
          <div class="row">

           

          

           

            <!-- Reports -->
            <div class="col-12">
              <div class="card">

               

                <div class="card-body">
                  <h5 class="card-title">Users <span>/Edit Users</span></h5>


					
<div class="container mt-5">
    <div class="card shadow-lg p-4">
        <h2 class="text-center">Update User</h2>
        <c:if test="${not empty error}">

								<div class="alert alert-danger text-center">${error}</div>


							</c:if>
							<c:if test="${not empty successMessage}">
								<div class="alert alert-success text-center">${successMessage}</div>
							</c:if>
        <form class="row g-3 needs-validation" novalidate action="edituser" method="post">
            
            <!-- User ID (Hidden) -->
            <input type="hidden" name="id" value="${user1.id}">

            <!-- First Name -->
            <div class="col-12">
                <label for="firstName" class="form-label">First Name</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                    <input type="text" name="firstName" class="form-control" id="firstName" value="${user1.firstName}" required>
                    <div class="invalid-feedback">Please enter your first name!</div>
                </div>
            </div>

            <!-- Last Name -->
            <div class="col-12">
                <label for="lastName" class="form-label">Last Name</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                    <input type="text" name="lastName" class="form-control" id="lastName" value="${user1.lastName}" required>
                    <div class="invalid-feedback">Please enter your last name!</div>
                </div>
            </div>

            <!-- Email -->
            <div class="col-12">
                <label for="email" class="form-label">Email</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                    <input type="email" name="email" class="form-control" id="email" value="${user1.email}" required>
                    <div class="invalid-feedback">Please enter a valid email address!</div>
                </div>
            </div>

           <%--  <!-- Password -->
            <div class="col-12">
                <label for="password" class="form-label">Password</label>
                <div class="input-group">
                    <span class="input-group-text" onclick="togglePassword()" style="cursor: pointer;"> 
                        <i class="fas fa-eye" id="toggleIcon"></i>
                    </span>
                    <input type="password" class="form-control" id="password" name="password" value="${user.password}" required>
                    <div class="invalid-feedback">Please enter your password!</div>
                </div>
            </div> --%>

            <!-- Contact No -->
            <div class="col-12">
                <label for="contactNo" class="form-label">Contact No</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-phone"></i></span>
                    <input type="text" name="contactNo" class="form-control" id="contactNo" value="${user1.contactNo}" maxlength="10" required>
                    <div class="invalid-feedback">Please enter your contact number!</div>
                </div>
            </div>
            
           

            <!-- Gender -->
            <div class="col-12">
                <label class="form-label">Gender</label>
                <div class="d-flex gap-3">
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="gender" value="Male" ${user1.gender == 'Male' ? 'checked' : ''} required>
                        <label class="form-check-label">Male</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="gender" value="Female" ${user1.gender == 'Female' ? 'checked' : ''}>
                        <label class="form-check-label">Female</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="gender" value="Other" ${user1.gender == 'Other' ? 'checked' : ''}>
                        <label class="form-check-label">Other</label>
                    </div>
                </div>
            </div>
            
             <div class="col-12">
                <label for="contactNo" class="form-label">Role</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-phone"></i></span>
                    <input type="text" name="role" class="form-control" id="contactNo" value="${user1.role}" required>
                    <div class="invalid-feedback">Please enter your role!</div>
                </div>
            </div>

            <!-- Submit Button -->
            <div class="col-12 text-center">
                <button class="btn btn-primary" type="submit">Update User</button>
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