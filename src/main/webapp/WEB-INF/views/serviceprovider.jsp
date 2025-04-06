<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Service Provider</title>
    <%@include file="admincss.jsp" %>
    <style>
        .form-container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }
        
        .form-group {
            margin-bottom: 1.5rem;
        }
        
        .custom-select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: white;
            font-size: 16px;
            appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' fill='%23333' viewBox='0 0 16 16'%3E%3Cpath d='M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 10px center;
        }
        
        .custom-select:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0,123,255,0.3);
            outline: none;
        }
        
        .form-control {
            border-radius: 5px;
            padding: 10px;
        }
        
        .btn-primary {
            padding: 10px 30px;
            border-radius: 5px;
            background-color: #007bff;
            border: none;
            transition: background-color 0.3s ease;
        }
        
        .btn-primary:hover {
            background-color: #0056b3;
        }
        
        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        
        .alert {
            margin-bottom: 20px;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <%@include file="adminheader.jsp" %>
    <%@include file="adminsidebar.jsp" %>
    
    <main id="main" class="main">
        <div class="pagetitle">
            <h1>Dashboard</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                    <li class="breadcrumb-item active">Add Service Provider</li>
                </ol>
            </nav>
        </div>

        <section class="section dashboard">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Add New Service Provider</h5>
                            
                            <c:if test="${not empty error}">
                                <div class="alert alert-danger text-center">${error}</div>
                            </c:if>

                            <div class="form-container">
                                <form action="saveserviceprovider" method="post" enctype="multipart/form-data" >
                                    <div class="row">
                                        <div class="col-md-6 form-group">
                                            <label class="form-label">Speciality</label>
                                            <input type="text" class="form-control" name="speciality" required>
                                        </div>
                                        <div class="col-md-6 form-group">
                                            <label class="form-label">Garage Title</label>
                                            <input type="text" class="form-control" name="garageTitle" required>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-12 form-group">
                                            <label class="form-label">Address</label>
                                            <textarea class="form-control form-control-textarea" name="address" ></textarea>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 form-group">
                                            <label class="form-label">Zipcode</label>
                                            <input type="text" class="form-control" name="zipCode" required>
                                        </div>
                                        <div class="col-md-6 form-group">
                                            <label class="form-label">Contact No</label>
                                            <input type="tel" class="form-control" name="contactNo" required>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 form-group">
                                            <label class="form-label">Experience (Years)</label>
                                            <input type="number" class="form-control" name="experienceYear" min="0" required>
                                        </div>
                                        <div class="col-md-6 form-group">
                                            <label class="form-label">Other Information</label>
                                            <input type="text" class="form-control" name="otherInformation">
                                        </div>
                                        
                                         <div class="col-md-6 form-group">
                                            <label for="yourName" class="form-label">Garage Photo</label>
											<div class="input-group">
												 <input type="file"
													name="imagePic" class="form-control" id="yourPhoto"
													required>
												
											</div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-4 form-group">
                                            <label class="form-label">State</label>
                                            <select name="stateId" class="custom-select" required>
                                                <option value="" disabled selected>Select State</option>
                                                <c:forEach items="${allStates}" var="s">
                                                    <option value="${s.stateId}">${s.stateName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="col-md-4 form-group">
                                            <label class="form-label">City</label>
                                            <select name="cityId" class="custom-select" required>
                                                <option value="" disabled selected>Select City</option>
                                                <c:forEach items="${allCities}" var="c">
                                                    <option value="${c.cityId}">${c.cityName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="col-md-4 form-group">
                                            <label class="form-label">Area</label>
                                            <select name="areaId" class="custom-select" required>
                                                <option value="" disabled selected>Select Area</option>
                                                <c:forEach items="${allAreas}" var="a">
                                                    <option value="${a.areaId}">${a.areaName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="text-center mt-4">
                                        <button type="submit" class="btn btn-primary">Add Service Provider</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
    
    <%@include file="adminfooter.jsp" %>
</body>
</html>