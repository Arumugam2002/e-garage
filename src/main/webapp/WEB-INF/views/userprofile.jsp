<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="usercss.jsp" />

<body>
    <jsp:include page="userheader.jsp" />

    <div class="container mt-5 mb-5">
        <div class="card shadow p-4 rounded-4">
            <h2 class="text-center mb-4">Update Profile</h2>

            <!-- Success & Error Messages -->
            <c:if test="${not empty error}">
                <div class="alert alert-danger text-center">${error}</div>
            </c:if>
            <c:if test="${not empty successMessage}">
                <div class="alert alert-success text-center">${successMessage}</div>
            </c:if>

            <!-- Profile Update Form -->
            <form class="row g-4 needs-validation" novalidate action="updateuser" method="post" enctype="multipart/form-data">

                <!-- Hidden User ID -->
                <input type="hidden" name="id" value="${user.id}" />

                <!-- First Name -->
                <div class="col-md-6">
                    <label class="form-label">First Name</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-user"></i></span>
                        <input type="text" class="form-control" name="firstName" value="${user.firstName}" required />
                        <div class="invalid-feedback">Enter your first name!</div>
                    </div>
                </div>

                <!-- Last Name -->
                <div class="col-md-6">
                    <label class="form-label">Last Name</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-user"></i></span>
                        <input type="text" class="form-control" name="lastName" value="${user.lastName}" required />
                        <div class="invalid-feedback">Enter your last name!</div>
                    </div>
                </div>

                <!-- Email -->
                <div class="col-md-6">
                    <label class="form-label">Email</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                        <input type="email" class="form-control" name="email" value="${user.email}" required />
                        <div class="invalid-feedback">Enter a valid email!</div>
                    </div>
                </div>

                <!-- Contact No -->
                <div class="col-md-6">
                    <label class="form-label">Contact Number</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-phone"></i></span>
                        <input type="text" class="form-control" name="contactNo" value="${user.contactNo}" required />
                        <div class="invalid-feedback">Enter your contact number!</div>
                    </div>
                </div>

                <!-- Gender -->
                <div class="col-md-12">
                    <label class="form-label d-block">Gender</label>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="gender" value="Male" ${user.gender == 'Male' ? 'checked' : ''} required />
                        <label class="form-check-label">Male</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="gender" value="Female" ${user.gender == 'Female' ? 'checked' : ''} />
                        <label class="form-check-label">Female</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="gender" value="Other" ${user.gender == 'Other' ? 'checked' : ''} />
                        <label class="form-check-label">Other</label>
                    </div>
                </div>

                <!-- Profile Photo -->
                <div class="col-md-12">
                    <label class="form-label">Profile Photo</label>
                    <input type="file" class="form-control" name="profilePic"  />
                    
                </div>

                <!-- Location Selects -->
                <div class="col-md-4">
                    <label class="form-label">State</label>
                    <select name="stateId" class="form-select" required>
                        <option value="" disabled>Select State</option>
                        <c:forEach items="${allStates}" var="s">
                            <option value="${s.stateId}" ${s.stateId == user.state.stateId ? 'selected' : ''}>${s.stateName}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="col-md-4">
                    <label class="form-label">City</label>
                    <select name="cityId" class="form-select" required>
                        <option value="" disabled>Select City</option>
                        <c:forEach items="${allCities}" var="c">
                            <option value="${c.cityId}" ${c.cityId == user.city.cityId ? 'selected' : ''}>${c.cityName}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="col-md-4">
                    <label class="form-label">Area</label>
                    <select name="areaId" class="form-select" required>
                        <option value="" disabled>Select Area</option>
                        <c:forEach items="${allAreas}" var="a">
                            <option value="${a.areaId}" ${a.areaId == user.area.areaId ? 'selected' : ''}>${a.areaName}</option>
                        </c:forEach>
                    </select>
                </div>

                <!-- Submit -->
                <div class="col-12 text-center mt-3">
                    <button type="submit" class="btn btn-primary px-4 py-2">Update Profile</button>
                </div>
            </form>
        </div>
    </div>

    <jsp:include page="userfooter.jsp" />

    <!-- Bootstrap form validation script -->
    <script>
        (function () {
            'use strict'
            const forms = document.querySelectorAll('.needs-validation')
            Array.from(forms).forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault()
                        event.stopPropagation()
                    }
                    form.classList.add('was-validated')
                }, false)
            })
        })()
    </script>

</body>
</html>
