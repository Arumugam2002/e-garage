<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Cart</title>
    <jsp:include page="usercss.jsp" />
    <style>
        .cart-container {
            max-width: 1000px;
            margin: 40px auto;
            padding: 20px;
            background: white;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        
        .cart-title {
            color: #222;
            font-weight: 700;
            font-size: 1.8rem;
            margin-bottom: 25px;
            text-align: center;
            position: relative;
        }
        
        .cart-title:after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 50px;
            height: 3px;
            background: #28a745;
        }
        
        .table {
            border-radius: 10px;
            overflow: hidden;
        }
        
        .table thead {
            background: #f8f9fa;
            color: #333;
        }
        
        .table th, .table td {
            vertical-align: middle;
            padding: 15px;
        }
        
        .table tbody tr:hover {
            background: #f9f9f9;
        }
        
        .total-row {
            font-weight: 600;
            background: #f1f3f5;
        }
        
        .btn-remove {
            background-color: #dc3545;
            border: none;
            padding: 6px 15px;
            border-radius: 20px;
            font-size: 0.9rem;
            transition: background-color 0.3s ease;
        }
        
        .btn-remove:hover {
            background-color: #c82333;
        }
        
        .appointment-form {
            margin-top: 30px;
            padding: 20px;
            background: #f8f9fa;
            border-radius: 10px;
        }
        
        .form-group {
            margin-bottom: 1.5rem;
        }
        
        .form-control {
            border-radius: 8px;
            padding: 12px;
            font-size: 1rem;
            border: 1px solid #ddd;
            transition: border-color 0.3s ease;
        }
        
        .form-control:focus {
            border-color: #28a745;
            box-shadow: 0 0 5px rgba(40,167,69,0.3);
            outline: none;
        }
        
        .form-label {
            font-weight: 500;
            color: #333;
        }
        
        .btn-book {
            background-color: #28a745;
            border: none;
            padding: 12px 30px;
            border-radius: 25px;
            font-weight: 600;
            text-transform: uppercase;
            transition: background-color 0.3s ease;
        }
        
        .btn-book:hover {
            background-color: #218838;
        }
        
        .btn-back {
            background-color: #ffc107;
            border: none;
            padding: 10px 25px;
            border-radius: 25px;
            font-weight: 600;
            text-transform: uppercase;
            transition: background-color 0.3s ease;
        }
        
        .btn-back:hover {
            background-color: #e0a800;
        }
        
        .btn-garages {
            background-color: #6c757d;
            border: none;
            padding: 10px 25px;
            border-radius: 25px;
            font-weight: 600;
            text-transform: uppercase;
            transition: background-color 0.3s ease;
        }
        
        .btn-garages:hover {
            background-color: #5a6268;
        }
        
        .action-buttons {
            margin-top: 20px;
            display: flex;
            gap: 15px;
            justify-content: center;
            flex-wrap: wrap;
        }
        
        .empty-cart {
            text-align: center;
            color: #666;
            font-size: 1.2rem;
            padding: 20px;
        }
        
        @media (max-width: 768px) {
            .cart-container {
                margin: 20px;
                padding: 15px;
            }
            .cart-title {
                font-size: 1.5rem;
            }
            .table th, .table td {
                padding: 10px;
                font-size: 0.9rem;
            }
            .btn-book, .btn-back, .btn-garages {
                width: 100%;
            }
            .appointment-form {
                padding: 15px;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="userheader.jsp" />

    <div class="cart-container">
        <h2 class="cart-title">Your Cart</h2>
        
        <c:choose>
            <c:when test="${not empty cartItems}">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Service Name</th>
                            <th>Price</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${cartItems}">
                            <tr>
                                <td>${item.serviceName}</td>
                                <td>₹${item.price}</td>
                                <td>
                                    <form action="removefromcart" method="post" style="display:inline;">
                                        <input type="hidden" name="servicesId" value="${item.servicesId}">
                                        <button type="submit" class="btn btn-remove">Remove</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        <tr class="total-row">
                            <td><strong>Total</strong></td>
                            <td><strong>₹${totalPrice}</strong></td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>

                <div class="appointment-form">
                    <form action="bookappointment" method="post">
                        <input type="hidden" name="id" value="${serviceProvider.serviceProviderId}">
                        
                        <div class="form-group">
    <label for="vehicleId" class="form-label">Select Vehicle</label>
    <select class="form-control" name="vehiclesId" id="vehiclesId" required>
    <option value=""  selected>Select Vehicle</option>
        <c:forEach var="v" items="${vehicles}">
            <option value="${v.vehiclesId}">
                ${v.manufacturer} ${v.model} (${v.licensePlate})
            </option>
        </c:forEach>
    </select>
</div>
                        
                        
                        <div class="form-group">
                            <label for="appointmentDateTime" class="form-label">Appointment Date & Time</label>
                            <input type="datetime-local" class="form-control" id="appointmentDateTime" name="appointmentDateTimeStr" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="reason" class="form-label">Reason</label>
                            <input type="text" class="form-control" id="reason" name="reason" required>
                        </div>
                        
                        <div class="text-center">
                            <button type="submit" class="btn btn-book">Book Appointment</button>
                        </div>
                    </form>
                </div>
            </c:when>
            <c:otherwise>
                <p class="empty-cart">Your cart is empty.</p>
            </c:otherwise>
        </c:choose>

        <div class="action-buttons">
            <a href="viewgarage?id=${serviceProvider.serviceProviderId}" class="btn btn-back">Back to Garage</a>
            <a href="/garages" class="btn btn-garages">All Garages</a>
        </div>
    </div>

    <jsp:include page="userfooter.jsp" />
</body>
</html>