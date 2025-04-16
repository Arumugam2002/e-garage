<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Service Provider change password</title>
</head>
<jsp:include page="serviceprovidercss.jsp"></jsp:include>

<body>
    <jsp:include page="serviceproviderheader.jsp"></jsp:include>


    <!-- Carousel Start -->
     <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow-lg p-4">
                    <h3 class="text-center mb-4">Service Provider Change Password</h3>

                    <!-- Success and Error Messages -->
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger text-center">${error}</div>
                    </c:if>
                    <c:if test="${not empty successMessage}">
                        <div class="alert alert-success text-center">${successMessage}</div>
                    </c:if>

                    <!-- Password Change Form -->
                    <form action="updateserviceproviderpassword" method="post">
                        <div class="mb-3">
                            <label class="form-label">Old Password:</label>
                            <input type="password" name="oldpassword" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">New Password:</label>
                            <input type="password" name="newpassword" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Confirm New Password:</label>
                            <input type="password" name="confirmpassword" class="form-control" required>
                        </div>

                        <div class="text-center">
                            <button type="submit" class="btn btn-primary w-100">Update Password</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Testimonial End -->


		<jsp:include page="serviceproviderfooter.jsp"></jsp:include>

  
</body>

</html>

