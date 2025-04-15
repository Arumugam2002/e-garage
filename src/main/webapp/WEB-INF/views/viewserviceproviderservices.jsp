<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <title>Garage Services</title>
    <jsp:include page="serviceprovidercss.jsp" />
    <style>
        .service-card {
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 20px;
            background-color: #fff;
        }
        .service-title {
            font-size: 18px;
            font-weight: 600;
        }
        .service-detail {
            font-size: 14px;
            color: #555;
        }
    </style>
</head>
<body>

<jsp:include page="serviceproviderheader.jsp" />

<div class="container mt-5">
    <h3 class="text-center mb-4">Services for Selected Garage</h3>

    <c:if test="${empty services}">
        <div class="alert alert-info text-center">No services available for this garage.</div>
    </c:if>

    <c:forEach var="s" items="${services}">
        <div class="service-card">
            <div class="service-title">${s.serviceName}</div>
            <div class="service-detail"><strong>Description:</strong> ${s.serviceDescription}</div>
            <div class="service-detail"><strong>Price:</strong> ₹${s.allInclusivePrice}</div>
        </div>
    </c:forEach>

    <div class="text-center mt-4">
        <a href="viewservicegarage" class="btn btn-secondary">Back to Garages</a>
    </div>
</div>

<jsp:include page="serviceproviderfooter.jsp" />

</body>
</html>
