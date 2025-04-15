<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="serviceprovidercss.jsp"></jsp:include>
<style>
        .garage-card {
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            border-radius: 10px;
            margin-bottom: 30px;
            overflow: hidden;
            transition: 0.3s;
        }

        .garage-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0,0,0,0.2);
        }

        .garage-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-bottom: 1px solid #eee;
        }

        .garage-info {
            padding: 15px;
        }

        .garage-title {
            font-size: 20px;
            font-weight: 600;
            margin-bottom: 10px;
        }

        .garage-detail {
            font-size: 14px;
            color: #555;
        }
    </style>
</head>
<body>
    <jsp:include page="serviceproviderheader.jsp"></jsp:include>


     <div class="container mt-5">
    <h3 class="text-center mb-4">My Garages</h3>

    <c:if test="${empty garages}">
        <div class="alert alert-info text-center">No garages added yet.</div>
    </c:if>

    <div class="row">
        <c:forEach var="garage" items="${garages}">
            <div class="col-md-4">
                <div class="garage-card">
                    <img src="${garage.imagePicPath}" alt="Garage Photo" class="garage-image">
                    <div class="garage-info">
                        <div class="garage-title">${garage.garageTitle}</div>
                        <div class="garage-detail"><strong>Speciality:</strong> ${garage.speciality}</div>
                        <div class="garage-detail"><strong>Experience:</strong> ${garage.experienceYear} years</div>
                        <div class="garage-detail"><strong>Contact:</strong> ${garage.contactNo}</div>
                        <div class="garage-detail"><strong>Zip Code:</strong> ${garage.zipCode}</div>
                        <div class="garage-detail"><strong>Address:</strong> ${garage.address}</div>
                        
                        <a href="servicegarageadd?garageId=${garage.serviceProviderId}" class="btn-add-service">Add Service</a>
                        <a href="viewserviceproviderservices?garageId=${garage.serviceProviderId}" class="btn btn-primary mt-3">View Services</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>


		<jsp:include page="serviceproviderfooter.jsp"></jsp:include>

  
</body>

</html>

