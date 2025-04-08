<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Find Garages</title>
    
    <jsp:include page="usercss.jsp"></jsp:include>
    
    <style>
        .garage-card {
            border: none;
            border-radius: 15px;
            overflow: hidden;
            background: white;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            height: 100%;
            display: flex;
            flex-direction: column;
        }
        
        .garage-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
        
        .garage-img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-bottom: 3px solid #ff6600;
        }
        
        .card-body {
            padding: 20px;
            flex-grow: 1;
        }
        
        .garage-title {
            color: #333;
            font-size: 1.25rem;
            margin-bottom: 15px;
            font-weight: 600;
        }
        
        .garage-info p {
            margin: 0 0 10px;
            color: #666;
            font-size: 0.95rem;
        }
        
        .garage-info strong {
            color: #333;
            font-weight: 500;
        }
        
        .btn-book {
            background-color: #ff6600;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 25px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: background-color 0.3s ease;
            margin-top: auto;
        }
        
        .btn-book:hover {
            background-color: #e65c00;
            color: white;
        }
        
        .section-title {
            color: #222;
            font-weight: 700;
            position: relative;
            padding-bottom: 15px;
            margin-bottom: 30px;
        }
        
        .section-title:after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 60px;
            height: 3px;
            background: #ff6600;
        }
        
        @media (max-width: 768px) {
            .garage-img {
                height: 150px;
            }
            .garage-title {
                font-size: 1.1rem;
            }
            .garage-info p {
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="userheader.jsp"></jsp:include>

    <div class="container mt-5 mb-5">
        <h2 class="section-title text-center">Find the Best Garages Near You</h2>
        
        <c:if test="${not empty error}">
            <div class="alert alert-danger text-center mb-4">${error}</div>
        </c:if>
        
        <div class="container mt-4">
    <div class="row mb-4">
        <div class="col-md-4">
            <label>State</label>
            <select id="stateDropdown" class="form-select">
                <option value="">-- Select State --</option>
                <c:forEach var="s" items="${states}">
                    <option value="${s.stateId}">${s.stateName}</option>
                </c:forEach>
            </select>
        </div>
        <div class="col-md-4">
            <label>City</label>
            <select id="cityDropdown" class="form-select" disabled>
                <option value="">-- Select City --</option>
            </select>
        </div>
        <div class="col-md-4">
            <label>Area</label>
            <select id="areaDropdown" class="form-select" disabled>
                <option value="">-- Select Area --</option>
            </select>
        </div>
    </div>
</div>
        
        <div id="garageContainer">
    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
        
    </div>
</div>
    </div>
   
	<script src="assets/js/garagefilter.js"></script>
    <jsp:include page="userfooter.jsp"></jsp:include>
</body>
</html>


