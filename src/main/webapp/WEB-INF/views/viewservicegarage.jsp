<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Garages</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f5f7fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .container {
            padding-top: 3rem;
            padding-bottom: 3rem;
        }
        .garage-card {
            background: #fff;
            border: none;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s, box-shadow 0.3s;
            overflow: hidden;
        }
        .garage-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.15);
        }
        .garage-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }
        .garage-info {
            padding: 20px;
        }
        .garage-title {
            font-size: 1.5rem;
            font-weight: 600;
            color: #343a40;
            margin-bottom: 15px;
        }
        .garage-detail {
            font-size: 0.9rem;
            color: #495057;
            margin-bottom: 8px;
        }
        .btn-primary, .btn-add-service {
            border-radius: 8px;
            font-size: 0.9rem;
            padding: 8px 20px;
            margin-right: 10px;
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
            transition: background-color 0.3s;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .btn-add-service {
            background-color: #28a745;
            color: #fff;
            border: none;
            transition: background-color 0.3s;
        }
        .btn-add-service:hover {
            background-color: #218838;
        }
        .alert {
            border-radius: 8px;
            font-size: 0.9rem;
        }
        h3 {
            font-weight: 600;
            color: #343a40;
        }
        @media (max-width: 768px) {
            .garage-card {
                margin-bottom: 20px;
            }
            .btn-primary, .btn-add-service {
                width: 100%;
                margin-bottom: 10px;
            }
        }
    </style>
    <jsp:include page="serviceprovidercss.jsp"></jsp:include>
</head>
<body>
    <jsp:include page="serviceproviderheader.jsp"></jsp:include>

    <div class="container">
        <h3 class="text-center mb-5">My Garages</h3>

        <c:if test="${empty garages}">
            <div class="alert alert-info text-center" role="alert">No garages added yet.</div>
        </c:if>

        <div class="row g-4">
            <c:forEach var="garage" items="${garages}">
                <div class="col-md-4 col-sm-6">
                    <div class="garage-card">
                        <img src="${garage.imagePicPath}" alt="Garage Photo" class="garage-image">
                        <div class="garage-info">
                            <div class="garage-title">${garage.garageTitle}</div>
                            <div class="garage-detail"><strong>Speciality:</strong> ${garage.speciality}</div>
                            <div class="garage-detail"><strong>Experience:</strong> ${garage.experienceYear} years</div>
                            <div class="garage-detail"><strong>Contact:</strong> ${garage.contactNo}</div>
                            <div class="garage-detail"><strong>Zip Code:</strong> ${garage.zipCode}</div>
                            <div class="garage-detail"><strong>Address:</strong> ${garage.address}</div>
                            <div class="mt-3">
                                <a href="servicegarageadd?garageId=${garage.serviceProviderId}" class="btn btn-add-service">Add Service</a>
                                <a href="viewserviceproviderservices?garageId=${garage.serviceProviderId}" class="btn btn-primary">View Services</a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <jsp:include page="serviceproviderfooter.jsp"></jsp:include>
</body>
</html>