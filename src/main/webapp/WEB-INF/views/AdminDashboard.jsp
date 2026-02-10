<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>


<jsp:include page="AdminCSS.jsp"></jsp:include>
</head>
<body>

	<!-- header -->
	<jsp:include page="AdminHeader.jsp"></jsp:include>


	<!-- Sidebar -->
	<jsp:include page="AdminSidebar.jsp"></jsp:include>

	<!-- Main Content -->
	<div class="content">
		<h3>Dashboard</h3>
		<p class="text-muted">Welcome to the admin dashboard.</p>

		<div class="row">

            <!-- Card 1 -->
            <div class="col-md-3">
                <div class="card card-box p-3">
                    <h6>Total Users</h6>
                    <h3>120</h3>
                </div>
            </div>

            <!-- Card 2 -->
            <div class="col-md-3">
                <div class="card card-box p-3">
                    <h6>Total Categories</h6>
                    <h3>15</h3>
                </div>
            </div>

            <!-- Card 3 -->
            <div class="col-md-3">
                <div class="card card-box p-3">
                    <h6>Total Expenses</h6>
                    <h3>₹45,000</h3>
                </div>
            </div>

            <!-- Card 4 -->
            <div class="col-md-3">
                <div class="card card-box p-3">
                    <h6>Monthly Spending</h6>
                    <h3>₹8,500</h3>
                </div>
            </div>

        </div>
        <!-- Footer -->
		<jsp:include page="AdminFooter.jsp"></jsp:include>

    </div>

	</div>


</body>
</html>