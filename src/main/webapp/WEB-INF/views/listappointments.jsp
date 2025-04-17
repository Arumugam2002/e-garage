<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Appointments</title>

<%@include file="admincss.jsp" %>

</head>
<body>
<%@include file="adminheader.jsp" %>
<%@include file="adminsidebar.jsp" %>
<main id="main" class="main">

    

    <section class="section dashboard">
      <div class="row">

        <!-- Left side columns -->
        <div class="col-lg-12">
          <div class="row">

           

          

           

            <!-- Reports -->
            <div class="col-12">
              <div class="card">

               

                <div class="card-body">
                  <h5 class="card-title">Appointments <span>/List Appointments</span></h5>


					 <div class="table-responsive">
            <table class="table table-bordered table-striped table-hover datatable datatable-table" id="myTable">
                <thead class="table-dark">
                    <tr>
                        <th>Appointment DateTime</th>
                        
                        <th>Price</th>
                        <th>Reason</th>
                        
                        <th>Service Name</th>
                        <th>Service Provider Name</th>
                        <th>Vehicle Name</th>
                        <th>Booked By</th>
                         <th>Status</th>
                        <th>Action</th> 
                        <th>Update Status</th>
                        
                       
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${allAppointments}" var="a">
                        <tr>
                            <td>${a[1]}</td>
                            <td>${a[4]}</td>
                            <td>${a[3]}</td>
                            
                            <td>${a[6]}</td>
                            <td>${a[5]}</td>
                             <td>${a[7]}  ${a[8]}</td>
                             <td>${a[9]}  ${a[10]}</td>
                            
                            <td>
    <span class="badge" style="background-color: 
        ${a[2] == 'Pending' ? '#ffc107' : 
         a[2] == 'Booked' ? '#28a745' : 
         a[2] == 'Rejected' ? '#dc3545' : 
         a[2] == 'Cancelled' ? '#6c757d' : 
         a[2] == 'Rescheduled' ? '#17a2b8' : 
         '#007bff'}">
        ${a[2]}
    </span>
</td>
                            <td>
    <div class="d-flex flex-row gap-2">
        <a href="viewappointment?id=${a[0]}" class="btn btn-sm btn-success">View</a>
        
        <a href="editappointment?id=${a[0]}" class="btn btn-sm btn-primary">Edit</a>
        <a href="deleteappointment?id=${a[0]}" class="btn btn-sm btn-danger">Delete</a>
    </div>
</td>

<td><form action="updateappointmentstatus" method="post" class="d-inline" id="statusForm-${a[0]}">
            <input type="hidden" name="appointmentId" value="${a[0]}">
            <select name="status" class="form-select form-select-sm d-inline" style="width: auto;"
                onchange="if(confirm('Are you sure you want to change the status to ' + this.value + '?')) { 
                    document.getElementById('statusForm-${a[0]}').submit(); 
                } else { 
                    this.value = '${a[2]}'; 
                }">
                <option value="Pending" ${a[2] == 'Pending' ? 'selected' : ''}>Pending</option>
                <option value="Booked" ${a[2] == 'Booked' ? 'selected' : ''}>Booked</option>
                <option value="Rejected" ${a[2] == 'Rejected' ? 'selected' : ''}>Rejected</option>
                <option value="Cancelled" ${a[2] == 'Cancelled' ? 'selected' : ''}>Cancelled</option>
                <option value="Rescheduled" ${a[2] == 'Rescheduled' ? 'selected' : ''}>Rescheduled</option>
                <option value="InProgress" ${a[2] == 'InProgress' ? 'selected' : ''}>InProgress</option>
                <option value="Completed" ${a[2] == 'Completed' ? 'selected' : ''}>Completed</option>
            </select>
        </form></td>
															
							
                            
                           
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
                  <!-- Line Chart -->
                  
                  <!-- End Line Chart -->

                </div>
                
                <div class="d-flex justify-content-left">
        <a href="appointment" class="btn btn-primary">Add Appointment</a>
    </div>

              </div>
            </div><!-- End Reports -->

            <!-- Recent Sales -->
            <!-- End Recent Sales -->

            <!-- Top Selling -->
            

          </div>
        </div><!-- End Left side columns -->

        <!-- Right side columns -->
        <!-- End Right side columns -->

      </div>
      </div>
    </section>

  </main>
<%@include file="adminfooter.jsp" %>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>

	<script src="https://cdn.datatables.net/2.2.2/js/dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/2.2.2/js/dataTables.bootstrap5.min.js"></script>
		<script src="https://cdn.datatables.net/2.2.2/js/dataTables.min.js"></script>
  	<script src="https://cdn.datatables.net/2.2.2/js/dataTables.bootstrap5.min.js"></script>
  	<script src="https://cdn.datatables.net/buttons/3.2.2/js/dataTables.buttons.js"></script>
  	<script src="https://cdn.datatables.net/buttons/3.2.2/js/buttons.dataTables.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>
  	<script src="https://cdn.datatables.net/buttons/3.2.2/js/buttons.html5.min.js"></script>
  	<script src="https://cdn.datatables.net/buttons/3.2.2/js/buttons.print.min.js"></script>

	<script type="text/javascript">
  
  	$( document ).ready(function() {
  		//let table = new DataTable('#myTable');
  	
  		new DataTable('#myTable', {
  	 	    layout: {
  	 	        topStart: {
  	 	            buttons: ['copy', 'csv', 'excel', 'pdf', 'print']
  	 	        }
  	 	    }
  	 	});
  	
  	});
  	
  	
  	</script>
</body>
</html>


    

