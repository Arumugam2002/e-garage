<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Vehicles</title>
    <!-- Bootstrap CSS -->

    <style>
        body {
            background-color: #f8f9fa;
        }
        .card {
            margin-bottom: 20px;
        }
        .card h5 {
            color: #007bff;
        }

    </style>
    <%@include file="usercss.jsp" %>
</head>
<body>

<%@include file="userheader.jsp" %>

<div class="container mt-5">
    <h2 class="text-center text-primary mb-4">My Vehicles</h2>

    <c:choose>
        <c:when test="${not empty vehicles}">
            <div class="row">
                <c:forEach var="v" items="${vehicles}">
                    <div class="col-md-4">
                        <div class="card shadow-sm">
                            <div class="card-body">
                                <h5 class="card-title">${v.manufacturer} ${v.model}</h5>
                                <p class="card-text"><strong>License Plate:</strong> ${v.licensePlate}</p>
                                <p class="card-text"><strong>Year:</strong> ${v.year}</p>
                                <p class="card-text"><strong>Class:</strong> ${v.vehicleClass}</p>
                                <!-- Add Edit/Delete/View more options if needed -->
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:when>
        <c:otherwise>
            <div class="alert alert-info" role="alert">
                You currently have not added vehicles.
            </div>
        </c:otherwise>
    </c:choose>

    <div class="text-center mt-4">
        <a href="index" class="btn btn-secondary">Back to Dashboard</a>
    </div>
</div>

<!-- Bootstrap JS -->
<%@include file="userfooter.jsp" %>

</body>
</html>
