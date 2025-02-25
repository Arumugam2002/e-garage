<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard | E-Garage</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            display: flex;
            height: 100vh;
        }
        .sidebar {
            width: 250px;
            background: #343a40;
            color: white;
            padding-top: 20px;
        }
        .sidebar a {
            color: white;
            text-decoration: none;
            padding: 10px;
            display: block;
        }
        .sidebar a:hover {
            background: #495057;
        }
    </style>
</head>
<body>




    <div class="sidebar">
        <h4 class="text-center">E-Garage Admin</h4>
        <a href="admindashboard">Dashboard</a>
        <a href="listusers">Users</a>
        <a href="listvehicles">Vehicles</a>
        <a href="listservices">Services</a>
        <a href="listserviceproviders">Service Providers</a>
        <!-- <a href="#appointments">Appointments</a>
        <a href="#reports">Reports</a> -->
        <a href="liststates">States</a>
        <a href="listcity">Cities</a>
        <a href="logout" class="text-danger">Logout</a>
    </div>