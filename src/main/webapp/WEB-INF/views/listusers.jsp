<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Users</title>

<%@include file="admincss.jsp"%>

</head>
<body>
	<%@include file="adminheader.jsp"%>
	<%@include file="adminsidebar.jsp"%>
	<main id="main" class="main">

		<div class="pagetitle">
			<h1>Dashboard</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="index.html">Home</a></li>
					<li class="breadcrumb-item active">Dashboard</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section dashboard">
			<div class="row">

				<!-- Left side columns -->
				<div class="col-lg-12">
					<div class="row">







						<!-- Reports -->
						<div class="col-12">
							<div class="card">



								<div class="card-body">
									<h5 class="card-title">
										Users <span>/ListUsers</span>
									</h5>

									<div class="container mt-5">

										<div class="table-responsive">
											<table
												class="table table-hover table-striped table-bordered text-center datatable datatable-table"
												id="myTable">
												<thead class="table-dark">
													<tr>
														<th>First Name</th>
														<th>Last Name</th>
														<th>Email</th>
														<th>Contact No</th>
														<th>Gender</th>
														<th>Role</th>
														 <th>Created On</th> 
														<th>Action</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${userList}" var="u">
														<tr>
															<td>${u.firstName}</td>
															<td>${u.lastName}</td>
															<td>${u.email}</td>
															<td>${u.contactNo}</td>
															<td>${u.gender}</td>
															<td>${u.role}</td>
															   <td>${u.createAt }</td> 
															<td>
																<div class="d-flex flex-row gap-2">
																	<a href="viewuser?id=${u.id}"
																		class="btn btn-sm btn-success">View</a> <a
																		href="deleteuser?id=${u.id}"
																		class="btn btn-sm btn-danger">Delete</a> <a href="edituser?id=${u.id}"
																		class="btn btn-sm btn-primary">Edit</a>
																</div>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
									<!-- Line Chart -->

									<!-- End Line Chart -->

								</div>

							</div>
						</div>
						<!-- End Reports -->

						<!-- Recent Sales -->
						<!-- End Recent Sales -->

						<!-- Top Selling -->


					</div>
				</div>
				<!-- End Left side columns -->

				<!-- Right side columns -->
				<!-- End Right side columns -->

			</div>
		</section>

	</main>
	<%@include file="adminfooter.jsp"%>

	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>

	<script src="https://cdn.datatables.net/2.2.2/js/dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/2.2.2/js/dataTables.bootstrap5.min.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			let table = new DataTable('#myTable', {
				order: [[2, 'asc']]
			});
		});
	</script>
</body>
</html>