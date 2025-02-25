<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="adminheader.jsp" %>


    <div class="container mt-4">
        <h2 class="text-center mb-4">Vehicle List</h2>
        <div class="table-responsive">
            <table class="table table-bordered table-striped table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>Model</th>
                        <th>Manufacture</th>
                        <th>Year</th>
                        <th>License Plate</th>
                        <th>Vehicle Class</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${vehicles}" var="v">
                        <tr>
                            <td>${v.model}</td>
                            <td>${v.manufacturer}</td>
                            <td>${v.year}</td>
                            <td>${v.licensePlate}</td>
                            <td>${v.vehicleClass}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>