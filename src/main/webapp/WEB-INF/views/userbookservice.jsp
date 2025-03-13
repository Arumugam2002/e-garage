<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<jsp:include page="usercss.jsp"></jsp:include>

<body>
    <jsp:include page="userheader.jsp"></jsp:include>


    <div class="container mt-5">
        <div class="card shadow-lg p-4">
            <!-- <h2 class="text-center mb-4">Book an Appointment</h2> -->
            <form action="bookappointment" method="post">
                
                     
            Services:-     <select name="servicesId">
                <option>Select Services </option>
                
                <c:forEach items="${allServices }" var="s">
                
                <option value="${s.servicesId}">${s.serviceName}</option>
                </c:forEach>
                </select>
                <br><br>
                
              
                  ServiceProvider:-     <select name="serviceProviderId">
                <option>Select Service Providers </option>
                
                <c:forEach items="${allServiceProviders }" var="sp">
                
                <option value="${sp.serviceProviderId}">${sp.garageTitle}</option>
                </c:forEach> 
                </select> 
                 <br><br>
                 <div class="mb-3">
                    <label class="form-label">Appointment Base Price</label>
                    <input type="number" class="form-control" name="basePrice" required>
                </div>
                
                <div class="mb-3">
                    <label class="form-label">Appointment Price</label>
                    <input type="number" class="form-control" name="price" required>
                </div>
                
                <div class="mb-3">
                    <label class="form-label">Status</label>
                    <input type="text" class="form-control" name="status" required>
                </div>
                
                
                
                <div class="mb-3">
                    <label class="form-label">Appointment Date</label>
                    <input type="datetime-local" class="form-control" name="appointmentDateTime" required>
                </div>
                
                
                
                <div class="mb-3">
                    <label class="form-label">Reason</label>
                    <textarea class="form-control" name="reason" rows="3" required></textarea>
                </div>
                
                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Get Appointment</button>
                </div>
            </form>
        </div>
    </div>



		<jsp:include page="userfooter.jsp"></jsp:include>

  
</body>

</html>
