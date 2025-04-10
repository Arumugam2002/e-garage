<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<jsp:include page="usercss.jsp" />

<style>
    .appointments-section {
        max-width: 1000px;
        margin: 40px auto;
        background-color: #fff;
        padding: 25px;
        border-radius: 15px;
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    }

    .appointments-title {
        text-align: center;
        font-size: 2rem;
        font-weight: 700;
        margin-bottom: 30px;
        color: #343a40;
        position: relative;
    }

    .appointments-title::after {
        content: '';
        width: 60px;
        height: 3px;
        background: #28a745;
        position: absolute;
        left: 50%;
        transform: translateX(-50%);
        bottom: -10px;
    }

    .table-container {
        overflow-x: auto;
    }

    .table th, .table td {
        vertical-align: middle;
        white-space: nowrap;
    }

    .status-badge {
        padding: 6px 15px;
        border-radius: 15px;
        font-size: 0.9rem;
        font-weight: 500;
        color: #fff;
    }

    .badge-pending { background-color: #ffc107; }
    .badge-booked { background-color: #28a745; }
    .badge-rejected { background-color: #dc3545; }
    .badge-cancelled { background-color: #6c757d; }
    .badge-rescheduled { background-color: #17a2b8; }
    .badge-other { background-color: #007bff; }

    @media (max-width: 768px) {
        .appointments-title {
            font-size: 1.6rem;
        }
        .table th, .table td {
            font-size: 0.9rem;
            padding: 10px;
        }
    }
</style>

<body>
    <jsp:include page="userheader.jsp" />

    <div class="appointments-section">
        <div class="appointments-title">Your Appointments</div>

        <div class="table-container">
            <table class="table table-bordered table-striped table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>Appointment DateTime</th>
                        <th>Price</th>
                        <th>Reason</th>
                        <th>Service Name</th>
                        <th>Garage</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${appointments}" var="a">
                        <tr>
                            <td>${a[1]}</td>
                            <td>₹${a[4]}</td>
                            <td>${a[3]}</td>
                            <td>${a[6]}</td>
                            <td>${a[5]}</td>
                            <td>
                                <span class="status-badge 
                                    ${a[2] == 'Pending' ? 'badge-pending' :
                                      a[2] == 'Booked' ? 'badge-booked' :
                                      a[2] == 'Rejected' ? 'badge-rejected' :
                                      a[2] == 'Cancelled' ? 'badge-cancelled' :
                                      a[2] == 'Rescheduled' ? 'badge-rescheduled' :
                                      'badge-other'}">
                                    ${a[2]}
                                </span>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <jsp:include page="userfooter.jsp" />
</body>
</html>
