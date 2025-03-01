<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Services</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

    <div class="container mt-5">
        <div class="card shadow-lg p-4">
            <h2 class="text-center mb-4">Add Service</h2>
            <form action="saveservices" method="post">
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
                    <input type="number" class="form-control" name="allInclusivePrice" required>
                </div>
                
                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Get Services</button>
                </div>
            </form>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
