<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>

 <style>
        .garage-card {
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 20px;
            transition: transform 0.3s ease-in-out;
        }
        .garage-card:hover {
            transform: scale(1.03);
        }
        .garage-img {
            width: 100%;
            height: 180px;
            object-fit: cover;
            border-radius: 10px;
        }
        .btn-book {
            background-color: #ff6600;
            color: white;
            font-weight: bold;
        }
    </style>
</head>

<jsp:include page="usercss.jsp"></jsp:include>

<body>
    <jsp:include page="userheader.jsp"></jsp:include>


    <!-- Carousel Start -->
   
</head>
<body>
    <div class="container mt-4">
        <h2 class="text-center mb-4">Find the Best Garages Near You</h2>
        
        <div class="row">
            <c:forEach var="g" items="${allGarages}">
                <div class="col-md-4">
                    <div class="garage-card shadow-lg">
                         <%-- <img src="${g.imagePath}" alt="Garage Image" class="garage-img">  --%>
                        <h4 class="mt-3">${g.garageTitle}</h4>
                        
                        <p><strong>Since:</strong> ${g.experienceYear} </p>
                        <p><strong>Contact:</strong> ${g.contactNo}</p>
                        <a href="/bookService/${g.serviceProviderId}" class="btn btn-book w-100">Book Service</a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <!-- Testimonial End -->


		<jsp:include page="userfooter.jsp"></jsp:include>

  
</body>

</html>


<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Find a Garage - eGarage</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    
</body>
</html> --%>
