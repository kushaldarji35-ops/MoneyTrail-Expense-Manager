<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MoneyTrail - Admin Dashboard</title>

<!-- Bootstrap + Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

<style>

body{
    overflow-x:hidden;
}

/* Sidebar */
.sidebar{
    height:100vh;
    background:#185a9d;
    color:white;
    position:fixed;
    width:240px;
}

.sidebar h4{
    font-weight:bold;
}

.sidebar a{
    color:white;
    text-decoration:none;
    display:block;
    padding:12px;
    border-radius:8px;
    margin-bottom:5px;
}

.sidebar a:hover{
    background:#43cea2;
}

/* Main content */
.main-content{
    margin-left:240px;
}

/* Header */
.header{
    background:white;
    box-shadow:0 2px 10px rgba(0,0,0,0.1);
    padding:15px;
}

/* Footer */
.footer{
    background:#f1f1f1;
    padding:10px;
    text-align:center;
}

.card-box{
    border:none;
    border-radius:12px;
    box-shadow:0 5px 15px rgba(0,0,0,0.08);
}

</style>
</head>

<body>

<!-- Sidebar -->
<div class="sidebar p-3">

    <h4 class="text-center mb-4">💰 MoneyTrail</h4>

    <a href="#"><i class="bi bi-speedometer2"></i> Dashboard</a>
    <a href="newCategory"><i class="bi bi-tags"></i> Manage Categories</a>
    <a href="#"><i class="bi bi-cash-stack"></i> View Expenses</a>
    <a href="#"><i class="bi bi-graph-up"></i> Reports</a>
    <a href="#"><i class="bi bi-people"></i> Users</a>

</div>


<!-- Main Content -->
<div class="main-content">

    <!-- Header -->
    <div class="header d-flex justify-content-between align-items-center">

        <h5 class="mb-0">Admin Dashboard</h5>

        <div>
            Welcome, <b>Admin</b>
            <a href="logout" class="btn btn-sm btn-danger ms-3">
                Logout
            </a>
        </div>

    </div>


    <!-- Dashboard Body -->
    <div class="container mt-4">

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

    </div>


    <!-- Footer -->
    <div class="footer mt-5">
        © 2026 MoneyTrail | Designed by Kushal Darji
    </div>

</div>

</body>
</html>
