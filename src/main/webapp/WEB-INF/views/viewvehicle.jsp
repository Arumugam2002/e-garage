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
        <h2 class="text-center text-primary mb-4">View Vehicles</h2>
        <div class="user-info">
            <p><strong>Vehicle Name</strong> ${vehicle[0][2]}</p>
            <p><strong>Model:</strong> ${vehicle[0][3]}</p>
            <p><strong>License Plate:</strong> ${vehicle[0][1]}</p>
            <p><strong>Since</strong> ${vehicle[0][5]}</p>
            <p><strong>Vehicle Class:</strong> ${vehicle[0][4]}</p>
             <p><strong>Vehicle Owner:</strong> ${vehicle[0][7]} ${vehicle[0][8]}</p>
            
        </div>
        <div class="text-center mt-4">
            <a href="listvehicles" class="btn btn-secondary">Back to List</a>
        </div>
    </div>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
