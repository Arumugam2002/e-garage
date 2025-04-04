<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<jsp:include page="usercss.jsp"></jsp:include>
<head>

    <title>View Garage Details</title>
    <style>
        .garage-details {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .garage-img {
            width: 100%;
            max-height: 400px;
            object-fit: cover;
            border-radius: 10px;
            margin-bottom: 20px;
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
        <div class="garage-details">
        <c:if test="${not empty error}">

								<div class="alert alert-danger text-center">${error}</div>


							</c:if>
            <%-- <img src="${garages.imagePath}" alt="Garage Image" class="garage-img"> --%>
            <h2>${garages.garageTitle}</h2>
            <p><strong>Since:</strong> ${garages.experienceYear}</p>
            <p><strong>Contact:</strong> ${garages.contactNo}</p>
           
            <!-- Add more garage details as needed -->
            
            <a href="bookservice?id=${garages.serviceProviderId}" class="btn btn-back mt-3">Book Service</a>
            <br><br>
            
            <a href="/garages" class="btn btn-back mt-3">Back to Garage List</a>
        </div>
    </div>
    


		<jsp:include page="userfooter.jsp"></jsp:include>

  
</body>

</html>