<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Dashboard</title>

<jsp:include page="CustomerCSS.jsp"></jsp:include>
</head>
<body>

	<!-- Header -->
	<jsp:include page="CustomerHeader.jsp"></jsp:include>

	<!-- Sidebar -->
	<jsp:include page="CustomerSidebar.jsp"></jsp:include>

	<!-- Main Content -->
	<div class="content">
		<h3> <center>Home</center></h3>
		<h4> <p class="text-muted"> Expense Manager </p></h4>

		<div class="row">

			<div class="col-md-3">
				<div class="card card-box p-3">
					<h6>Expenses</h6>
					<h3>₹ ${totalExpense}</h3>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card card-box p-3">
					<h6>QTR Expense</h6>
					<h3>₹60,000</h3>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card card-box p-3">
					<h6>Income</h6>
					<h3>₹ ${totalIncome}</h3>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card card-box p-3">
					<h6>QTR Income</h6>
					<h3>₹8,200</h3>
				</div>
			</div>

		</div>


	</div>

</body>
</html>