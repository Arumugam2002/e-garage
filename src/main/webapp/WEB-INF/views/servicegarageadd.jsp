<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<jsp:include page="serviceprovidercss.jsp"></jsp:include>

<body>
    <jsp:include page="serviceproviderheader.jsp"></jsp:include>


     <div class="container mt-5">
        <div class="card shadow-lg p-4">
           
            <form action="servicegarageadd" method="post">
            	
            	<!-- Hidden garageId field -->
            <input type="hidden" name="garageId" value="${garageId}" />

            <div class="mb-3">
                <label class="form-label">Service Name</label>
                <input type="text" class="form-control" name="serviceName" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Service Description</label>
                <input type="text" class="form-control" name="serviceDescription" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Inclusive Price</label>
                <input type="number" step="0.01" class="form-control" name="allInclusivePrice" required>
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-success">Save Service</button>
            </div>
            </form>
        </div>
    </div>


		<jsp:include page="serviceproviderfooter.jsp"></jsp:include>

  
</body>

</html>

