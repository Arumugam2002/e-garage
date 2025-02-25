<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="adminheader.jsp" %>


    <div class="container mt-4">
        <h2 class="text-center mb-4">Service List</h2>
        <div class="table-responsive">
            <table class="table table-bordered table-striped table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>Service Name</th>
                        <th>Service Description</th>
                        <th>All Inclusive Price</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${services}" var="s">
                        <tr>
                            <td>${s.serviceName}</td>
                            <td>${s.serviceDescription}</td>
                            <td>${s.allInclusivePrice}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
