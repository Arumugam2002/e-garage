<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Change Password</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow-lg p-4">
                    <h3 class="text-center mb-4">User Change Password</h3>

                    <!-- Success and Error Messages -->
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger text-center">${error}</div>
                    </c:if>
                    <c:if test="${not empty successMessage}">
                        <div class="alert alert-success text-center">${successMessage}</div>
                    </c:if>

                    <!-- Password Change Form -->
                    <form action="updateuserpassword" method="post">
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

    <!-- Bootstrap JS (Optional) -->
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
