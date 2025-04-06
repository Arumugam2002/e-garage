
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Cart</title>
    <jsp:include page="usercss.jsp" />
</head>
<body>
    <jsp:include page="userheader.jsp" />

    <div class="container mt-5">
        <h2>Your Cart</h2>
        
        <c:choose>
            <c:when test="${not empty cartItems}">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Service Name</th>
                            <th>Price</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${cartItems}">
                            <tr>
                                <td>${item.serviceName}</td>
                                <td>₹${item.price}</td>
                                  <td>
            <form action="removefromcart" method="post" style="display:inline;">
                <input type="hidden" name="servicesId" value="${item.servicesId}" />
                <%-- <input type="hidden" name="serviceProviderId" value="${item.serviceProviderId}"> --%>
                <button type="submit" class="btn btn-danger btn-sm">Remove</button>
            </form>
        </td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td><strong>Total</strong></td>
                            <td><strong>₹${totalPrice}</strong></td>
                        </tr>
                    </tbody>
                </table>
                
                <form action="bookappointment" method="post">
                 <input type="hidden" name="id" value="${serviceProvider.serviceProviderId}" />
                 
                  <div class="form-group">
        <label for="appointmentDateTime">Select Appointment Date & Time:</label>
        <input type="datetime-local" class="form-control" name="appointmentDateTimeStr" required />
    </div>
    
     <div class="form-group">
        <label for="Reason">Reason</label>
        <input type="text" class="form-control" name="reason" required />
    </div>
                 
        <button type="submit" class="btn btn-success">Book Appointment</button>
    </form>
            </c:when>
            <c:otherwise>
                <p>Your cart is empty.</p>
            </c:otherwise>
        </c:choose>

		<a href="viewgarage?id=${serviceProvider.serviceProviderId}" class="btn btn-warning mt-3">Back to This Garage</a>
        <a href="/garages" class="btn btn-secondary mt-3">Back to Garages</a>
    </div>

    <jsp:include page="userfooter.jsp" />
</body>
</html>