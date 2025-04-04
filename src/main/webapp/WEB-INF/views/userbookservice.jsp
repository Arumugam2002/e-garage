<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Book Service</title>
    <jsp:include page="usercss.jsp"></jsp:include>
    <style>
        .booking-card {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .btn-back {
            background-color: #666;
            color: white;
        }
    </style>
</head>
<body>
    <jsp:include page="userheader.jsp"></jsp:include>

    <div class="container">
        <div class="booking-card">
            <h2 class="text-center mb-4">Book Service at ${allServiceProviders.garageTitle}</h2>
            <c:if test="${not empty error}">

								<div class="alert alert-danger text-center">${error}</div>


							</c:if>
            <form action="/bookappointment" method="post">
                <input type="hidden" name="serviceProviderId" value="${allServiceProviders.serviceProviderId}">
                
                <%--  <input type="hidden" name="servicesId" value="${allServices.servicesId}"> --%>
                
                <div class="mb-3">
                    <label class="form-label">Select Service</label>
                    <select name="servicesId" class="form-control" required>
                        <option value="">Select a Service</option>
                        <c:forEach items="${allServices}" var="s">
                            <option value="${s.servicesId}">${s.serviceName}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="mb-3">
                    <label class="form-label">Appointment Base Price</label>
                    <input type="number" class="form-control" name="basePrice" required>
                </div>
                
                <div class="mb-3">
                    <label class="form-label">Appointment Price</label>
                    <input type="number" class="form-control" name="price" required>
                </div>
                
                
                
                <div class="mb-3">
                    <label class="form-label">Appointment Date & Time</label>
                    <input type="datetime-local" class="form-control" name="appointmentDateTime" required>
                </div>
                
                <div class="mb-3">
                    <label class="form-label">Reason</label>
                    <textarea class="form-control" name="reason" rows="3" required></textarea>
                </div>
                
                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Book Appointment</button>
                    <a href="/viewgarage?id=${allServiceProviders.serviceProviderId}" class="btn btn-back ml-2">Back to Garage</a>
                </div>
            </form>
        </div>
    </div>

    <jsp:include page="userfooter.jsp"></jsp:include>
</body>
</html>