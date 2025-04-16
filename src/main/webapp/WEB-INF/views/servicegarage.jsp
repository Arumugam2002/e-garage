<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Garage</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f5f7fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }
        .card-title {
            font-weight: 600;
            color: #343a40;
        }
        .form-label {
            font-weight: 500;
            color: #495057;
        }
        .form-control, .form-select {
            border-radius: 8px;
            padding: 10px;
            font-size: 0.95rem;
        }
        .form-control:focus, .form-select:focus {
            border-color: #007bff;
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
            padding: 12px 30px;
            font-weight: 500;
            border-radius: 8px;
            transition: background-color 0.3s;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .alert {
            border-radius: 8px;
            font-size: 0.9rem;
        }
        .form-container {
            padding: 20px;
        }
        @media (max-width: 768px) {
            .form-container {
                padding: 15px;
            }
            .btn-primary {
                width: 100%;
            }
        }
    </style>
     <jsp:include page="serviceprovidercss.jsp"></jsp:include>
</head>
<body>
    <jsp:include page="serviceproviderheader.jsp"></jsp:include>

    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-10">
                <div class="card">
                    <div class="card-body p-4">
                        <h5 class="card-title mb-4">Add New Garage</h5>

                        <c:if test="${not empty error}">
                            <div class="alert alert-danger text-center" role="alert">${error}</div>
                        </c:if>

                        <div class="form-container">
                            <form action="savegarage" method="post" enctype="multipart/form-data">
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <label class="form-label">Speciality</label>
                                        <input type="text" class="form-control" name="speciality" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label">Garage Title</label>
                                        <input type="text" class="form-control" name="garageTitle" required>
                                    </div>
                                </div>

                                <div class="row g-3 mt-3">
                                    <div class="col-12">
                                        <label class="form-label">Address</label>
                                        <textarea class="form-control" name="address" rows="4"></textarea>
                                    </div>
                                </div>

                                <div class="row g-3 mt-3">
                                    <div class="col-md-6">
                                        <label class="form-label">Zipcode</label>
                                        <input type="text" class="form-control" name="zipCode" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label">Contact No</label>
                                        <input type="tel" class="form-control" name="contactNo" required>
                                    </div>
                                </div>

                                <div class="row g-3 mt-3">
                                    <div class="col-md-6">
                                        <label class="form-label">Experience (Years)</label>
                                        <input type="number" class="form-control" name="experienceYear" min="0" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label">Other Information</label>
                                        <input type="text" class="form-control" name="otherInformation">
                                    </div>
                                </div>

                                <div class="row g-3 mt-3">
                                    <div class="col-md-6">
                                        <label class="form-label">Garage Photo</label>
                                        <input type="file" class="form-control" name="imagePic" id="imagePic" required>
                                    </div>
                                </div>

                                <div class="row g-3 mt-3">
                                    <div class="col-md-4">
                                        <label class="form-label">State</label>
                                        <select id="state" name="stateId" class="form-select" required>
                                            <option value="" disabled selected>Select State</option>
                                            <c:forEach items="${allStates}" var="s">
                                                <option value="${s.stateId}">${s.stateName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="form-label">City</label>
                                        <select id="city" name="cityId" class="form-select" required>
                                            <option value="" disabled selected>Select City</option>
                                        </select>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="form-label">Area</label>
                                        <select id="area" name="areaId" class="form-select" required>
                                            <option value="" disabled selected>Select Area</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="text-center mt-4">
                                    <button type="submit" class="btn btn-primary">Add Garage</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Location Filter Script -->
    <script src="assets/js/locationfilter.js"></script>

    <jsp:include page="serviceproviderfooter.jsp"></jsp:include>
</body>
</html>