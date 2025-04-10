<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<jsp:include page="serviceprovidercss.jsp"></jsp:include>

<body>
    <jsp:include page="serviceproviderheader.jsp"></jsp:include>


    <!-- Carousel Start -->
   <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Add New Garage</h5>
                            
                            <c:if test="${not empty error}">
                                <div class="alert alert-danger text-center">${error}</div>
                            </c:if>

                            <div class="form-container">
                                <form action="savegarage" method="post" enctype="multipart/form-data" >
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
   
   
 
		<jsp:include page="serviceproviderfooter.jsp"></jsp:include>

  
</body>

</html>

