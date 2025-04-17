<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="usercss.jsp" />

<body>
    <jsp:include page="userheader.jsp" />

    <div class="container mt-5 mb-5">
        <div class="card shadow p-4 rounded-4">
            <h2 class="text-center mb-4">My Profile</h2>

            <!-- Profile Picture -->
            <div class="text-center mb-4">
                <c:choose>
    <c:when test="${not empty user.profilePicPath}">
        <img src="${user.profilePicPath}" alt="Profile Picture" class="rounded-circle" width="150" height="150">
    </c:when>
    <c:otherwise>
        <img src="assets/img/default-profile.png" alt="Default Profile Picture" class="rounded-circle" width="150" height="150">
    </c:otherwise>
</c:choose>
            </div>

            <!-- Profile Details -->
            <div class="row mb-3">
                <div class="col-md-6"><strong>First Name:</strong> ${user.firstName}</div>
                <div class="col-md-6"><strong>Last Name:</strong> ${user.lastName}</div>
            </div>
            <div class="row mb-3">
                <div class="col-md-6"><strong>Email:</strong> ${user.email}</div>
                <div class="col-md-6"><strong>Contact No:</strong> ${user.contactNo}</div>
            </div>
            <div class="row mb-3">
                <div class="col-md-6"><strong>Gender:</strong> ${user.gender}</div>
                <div class="col-md-6"><strong>State:</strong> ${user.state.stateName}</div>
            </div>
            <div class="row mb-3">
                <div class="col-md-6"><strong>City:</strong> ${user.city.cityName}</div>
                <div class="col-md-6"><strong>Area:</strong> ${user.area.areaName}</div>
            </div>

            <!-- Edit Button -->
            <div class="text-center mt-4">
                <a href="userprofile" class="btn btn-primary px-4 py-2">Edit Profile</a>
            </div>
        </div>
    </div>

    <jsp:include page="userfooter.jsp" />
</body>
</html>
