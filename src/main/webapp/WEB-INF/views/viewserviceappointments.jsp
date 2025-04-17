<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Service Provider Appointments</title>
    <%@include file="serviceprovidercss.jsp" %>
</head>
<body>
<%@include file="serviceproviderheader.jsp" %>


<main id="main" class="main">
    <div class="pagetitle">
        <h1>Service Appointments</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/provider/dashboard">Home</a></li>
                <li class="breadcrumb-item active">Appointments</li>
            </ol>
        </nav>
    </div>

    <section class="section">
        <div class="card">
            <div class="card-body pt-4">
                <h5 class="card-title">Appointments List</h5>


				 <c:if test="${not empty message}">
                    <div class="alert alert-success">${message}</div>
                </c:if>

                <c:if test="${not empty error}">
                    <div class="alert alert-danger">${error}</div>
                </c:if>
				

                <c:if test="${empty appointments}">
                    <p>No appointments found.</p>
                </c:if>

                <c:if test="${not empty appointments}">
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Appointment ID</th>
                                    <th>Date & Time</th>
                                    <th>Status</th>
                                    <th>Reason</th>
                                    <th>Price</th>
                                    <th>Garage</th>
                                    <th>Services</th>
                                    <th>Vehicle</th>
                                    <th>License Plate</th>
                                    <th>Booked By</th>
                                     <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="a" items="${appointments}">
                                    <tr>
                                        <td>${a[0]}</td> <!-- appointmentId -->
                                        <td>${a[1]}</td> <!-- appointmentDateTime -->
                                        <td>${a[2]}</td> <!-- status -->
                                        <td>${a[3]}</td> <!-- reason -->
                                        <td>${a[4]}</td> <!-- price -->
                                        <td>${a[5]}</td> <!-- garageTitle -->
                                        <td>${a[6]}</td> <!-- services -->
                                        <td>${a[7]} ${a[8]}</td> <!-- manufacturer + model -->
                                        <td>${a[9]}</td> <!-- license_plate -->
                                        <td>${a[10]} ${a[11]}</td> <!-- user_id -->
                                        
                                           <td>
                                            <form action="updateAppointmentStatus" method="post">
                                                <input type="hidden" name="appointmentId" value="${a[0]}"/>
                                                <select name="newStatus" class="form-select form-select-sm"
                                                    <c:if test="${a[2] == 'Cancelled' || a[2] == 'Completed'}">disabled</c:if>>
                                                    <option value="In Progress" <c:if test="${a[2] == 'In Progress'}">selected</c:if>>In Progress</option>
                                                    <option value="Completed" <c:if test="${a[2] == 'Completed'}">selected</c:if>>Completed</option>
                                                </select>
                                                <button type="submit" class="btn btn-sm btn-primary mt-1"
                                                    <c:if test="${a[2] == 'Cancelled' || a[2] == 'Completed'}">disabled</c:if>>
                                                    Update
                                                </button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:if>
            </div>
        </div>
    </section>
</main>

<%@include file="serviceproviderfooter.jsp" %>
</body>
</html>
