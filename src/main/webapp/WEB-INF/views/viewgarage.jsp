<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Garage - ${garages.garageTitle}</title>
    <jsp:include page="usercss.jsp"></jsp:include>
    <style>
        .garage-details {
            max-width: 900px;
            margin: 40px auto;
            padding: 25px;
            background: white;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        
        .garage-img {
            width: 100%;
            height: 350px;
            object-fit: cover;
            border-radius: 10px;
            margin-bottom: 20px;
            border: 2px solid #f5f5f5;
        }
        
        .garage-title {
            color: #222;
            font-weight: 700;
            margin-bottom: 20px;
            font-size: 2rem;
        }
        
        .info-section {
            padding: 15px 0;
        }
        
        .info-section p {
            margin: 0 0 10px;
            color: #555;
            font-size: 1.1rem;
        }
        
        .info-section strong {
            color: #333;
            font-weight: 600;
            min-width: 100px;
            display: inline-block;
        }
        
        .services-section {
            margin: 30px 0;
            padding: 20px;
            background: #f8f9fa;
            border-radius: 10px;
        }
        
        .services-section h3 {
            color: #333;
            font-size: 1.5rem;
            margin-bottom: 20px;
            font-weight: 600;
        }
        
        .service-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 0;
            border-bottom: 1px solid #eee;
        }
        
        .service-item:last-child {
            border-bottom: none;
        }
        
        .service-name {
            font-weight: 500;
            color: #444;
        }
        
        .service-price {
            color: #ff6600;
            font-weight: 600;
        }
        
        .btn-add-to-cart {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 6px 15px;
            border-radius: 20px;
            font-size: 0.9rem;
            transition: background-color 0.3s ease;
        }
        
        .btn-add-to-cart:hover {
            background-color: #218838;
            color: white;
        }
        
        .btn-book {
            background-color: #ff6600;
            color: white;
            border: none;
            padding: 10px 25px;
            border-radius: 25px;
            font-weight: 600;
            text-transform: uppercase;
            transition: background-color 0.3s ease;
        }
        
        .btn-book:hover {
            background-color: #e65c00;
            color: white;
        }
        
        .btn-back {
            background-color: #6c757d;
            color: white;
            border: none;
            padding: 10px 25px;
            border-radius: 25px;
            font-weight: 600;
            text-transform: uppercase;
            transition: background-color 0.3s ease;
        }
        
        .btn-back:hover {
            background-color: #5a6268;
            color: white;
        }
        
        .action-buttons {
            margin-top: 20px;
            display: flex;
            gap: 15px;
            justify-content: center;
            flex-wrap: wrap;
        }
        
        @media (max-width: 768px) {
            .garage-img {
                height: 250px;
            }
            .garage-title {
                font-size: 1.5rem;
            }
            .service-item {
                flex-direction: column;
                align-items: flex-start;
                gap: 10px;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="userheader.jsp"></jsp:include>

    <div class="container">
        <div class="garage-details">
            <c:if test="${not empty error}">
                <div class="alert alert-danger text-center mb-4">${error}</div>
            </c:if>

            <%-- <img src="${garages.imagePicPath}" alt="${garages.garageTitle}" class="garage-img" 
                 onerror="this.src='path/to/fallback-image.jpg'"> --%>
            
            <h2 class="garage-title">${garages.garageTitle}</h2>
            
            <div class="info-section">
                <p><strong>Since:</strong> ${garages.experienceYear}</p>
                <p><strong>Contact:</strong> ${garages.contactNo}</p>
                <p><strong>Address:</strong> ${garages.address}</p>
                <%-- <p><strong>Location:</strong> ${garages.areaName}, ${garages.cityName}, ${garages.stateName}</p> --%>
                <p><strong>Zipcode:</strong> ${garages.zipCode}</p>
                <p><strong>Speciality:</strong> ${garages.speciality}</p>
            </div>

            <div class="services-section">
                <h3>Services Offered</h3>
                <c:choose>
                    <c:when test="${not empty services}">
                        <c:forEach var="service" items="${services}">
                            <div class="service-item">
                                <span class="service-name">${service.serviceName}</span>
                                <div>
                                    <span class="service-price">₹${service.allInclusivePrice}</span>
                                    <form action="${pageContext.request.contextPath}/addtocart" method="post" class="d-inline">
                                        <input type="hidden" name="servicesId" value="${service.servicesId}">
                                        <%--  <input type="hidden" name="serviceProviderId" value="${service.serviceProviderId}"> --%>
                                        <button type="submit" class="btn btn-add-to-cart ms-3">Add to Cart</button>
                                    </form>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <p class="text-muted">No services available for this garage.</p>
                    </c:otherwise>
                </c:choose>
                <div class="text-center mt-3">
                    <a href="viewcart" class="btn btn-outline-primary">View Cart</a>
                </div>
            </div>

            <div class="action-buttons">
                
                <a href="/garages" class="btn btn-back">Back to Garages</a>
            </div>
        </div>
    </div>

    <jsp:include page="userfooter.jsp"></jsp:include>
</body>
</html>