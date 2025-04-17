<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View User</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            max-width: 500px;
            background: white;
            padding: 20px;
            margin-top: 50px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        .user-info {
            font-size: 18px;
        }
    </style>
</head>
<body>

<%@include file="adminheader.jsp" %>

    <div class="container">
        <h2 class="text-center text-primary mb-4">View User</h2>
        <div class="user-info">
            <p><strong>First Name:</strong> ${user1.firstName}</p>
            <p><strong>Last Name:</strong> ${user1.lastName}</p>
            <p><strong>Email:</strong> ${user1.email}</p>
            <p><strong>Contact No:</strong> ${user1.contactNo}</p>
            <p><strong>Gender:</strong> ${user1.gender}</p>
            <p><strong>Role:</strong> ${user1.role}</p>
        </div>
        <div class="text-center mt-4">
            <a href="listusers" class="btn btn-secondary">Back to List</a>
        </div>
    </div>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
