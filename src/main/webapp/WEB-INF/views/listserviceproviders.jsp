<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>List Service Providers</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h2 class="text-center mb-4">Service Provider List</h2>
        <div class="table-responsive">
            <table class="table table-bordered table-striped table-hover">
                <thead class="table-dark">
                    <tr>
                       
                        <th>Speciality</th>
                        <th>Garage Title</th>
                        <th>Zip Code</th>
                        <th>Contact No</th>
                        <th>Experience Year</th>
                        <th>Other Information</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${serviceProvider}" var="sp">
                        <tr>
                           
                            <td>${sp.speciality}</td>
                            <td>${sp.garageTitle}</td>
                            <td>${sp.zipCode}</td>
                            <td>${sp.contactNo}</td>
                            <td>${sp.experienceYear}</td>
                            <td>${sp.otherInformation}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
