<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Checkout</title>
    <jsp:include page="usercss.jsp" />
</head>
<body>

<jsp:include page="userheader.jsp" />

<div class="container mt-5">
    <div class="card shadow-lg p-4">
        <h3 class="mb-4">Payment Checkout</h3>
        
        <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
        </c:if>

        <form action="pay" method="post">
            <div class="mb-3">
    <label class="form-label">Amount</label>
    <div class="input-group">
        <span class="input-group-text">₹</span>
        <input type="text" class="form-control" value="${amount}" readonly />
    </div>
</div>

            <div class="mb-3">
                <label class="form-label">Credit Card Number</label>
                <input type="text" class="form-control" name="ccNum" maxlength="16" required />
            </div>

            <div class="mb-3">
                <label class="form-label">Expiry Date (MMYY)</label>
                <input type="text" class="form-control" name="expDate" maxlength="4" required />
            </div>

            <button type="submit" class="btn btn-success">Pay Now</button>
        </form>
    </div>
</div>

<jsp:include page="userfooter.jsp" />

</body>
</html>
