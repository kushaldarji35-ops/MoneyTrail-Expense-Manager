<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Vendor</title>

<jsp:include page="AdminCSS.jsp"></jsp:include>

<style>
body {
	background-color: #f8f9fa;
}

.card {
	margin-top: 90px;
	border-radius: 12px;
	box-shadow: 0px 4px 10px rgba(0,0,0,0.1);
}

.card-header {
	font-size: 22px;
	font-weight: bold;
	text-align: center;
	background-color: #0d6efd;
	color: white;
	border-radius: 12px 12px 0 0;
}
</style>

</head>
<body>

<!-- header -->
	<jsp:include page="AdminHeader.jsp"></jsp:include>

	<!-- Sidebar -->
	<jsp:include page="AdminSidebar.jsp"></jsp:include>


<div class="content">
	<div class="row justify-content-center">
		<div class="col-md-6 col-lg-5">
				<div class="card shadow">
					<div class="card-body p-4">

			<div class="card">
				<div class="card-header">
					Add Vendor
				</div>

				<div class="card-body">

					<form action="savevendor" method="post">

						<!-- Hidden Vendor ID -->
						<input type="hidden" name="vendorId">

						<!-- Vendor Name -->
						<div class="mb-3">
							<label class="form-label">Vendor Name</label>
							<input type="text" name="vendorName"
								class="form-control"
								placeholder="Enter Vendor Name"
								required>
						</div>

						<div class="text-center">
							<button type="submit" class="btn btn-primary">
								Save Vendor
							</button>

							<a href="admin-dashboard" class="btn btn-secondary">
								Cancel
							</a>
						</div>

					</form>

				</div>
			</div>
			<jsp:include page="AdminFooter.jsp"></jsp:include>

		</div>
	</div>
</div>

</body>
</html>
