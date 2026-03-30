<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

<jsp:include page="AdminCSS.jsp"></jsp:include>

<!-- Chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>

<style>
.chart-card {
    background: #fff;
    border-radius: 10px;
    padding: 15px;
    box-shadow: 0 2px 6px rgba(0,0,0,0.1);
}
.chart-title {
    font-weight: 600;
    margin-bottom: 10px;
}
canvas {
    max-height: 300px;
}
</style>

</head>
<body>

<!-- Header -->
<jsp:include page="AdminHeader.jsp"></jsp:include>

<!-- Sidebar -->
<jsp:include page="AdminSidebar.jsp"></jsp:include>

<!-- Main Content -->
<div class="content">

    <h3>Dashboard</h3>
    <p class="text-muted">Welcome to the admin dashboard.</p>

    <!-- Cards -->
    <div class="row">

        <div class="col-md-3">
            <div class="card card-box p-3">
                <h6>Total Users</h6>
                <h3>${totalUser}</h3>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card card-box p-3">
                <h6>Total Categories</h6>
                <h3>${totalCategory}</h3>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card card-box p-3">
                <h6>Total Expenses</h6>
                <h3>₹ ${totalExpense}</h3>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card card-box p-3">
                <h6>Monthly Spending</h6>
                <h3>₹1240</h3>
            </div>
        </div>

    </div>

    <!-- Charts Row -->
    <div class="row mt-4">

        <!-- Line Chart -->
        <div class="col-md-8">
            <div class="chart-card">
                <h6 class="chart-title">Expense Overview</h6>
                <canvas id="expenseChart"></canvas>
            </div>
        </div>

        <!-- Pie Chart -->
        <div class="col-md-4">
            <div class="chart-card">
                <h6 class="chart-title">Distribution</h6>
                <canvas id="pieChart"></canvas>
            </div>
        </div>

    </div>

    <!-- Footer -->
    <jsp:include page="AdminFooter.jsp"></jsp:include>

</div>

<!-- ================== CHART SCRIPTS ================== -->

<script>
/* LINE CHART */
const lineCtx = document.getElementById('expenseChart').getContext('2d');

new Chart(lineCtx, {
    type: 'line',
    data: {
        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
        datasets: [{
            label: 'Expenses (₹)',
            data: [1200, 1900, 1500, 2200, 1800, 2400,
                   2100, 2600, 2300, 2800, 2500, 3000],
            borderColor: '#4361ee',
            backgroundColor: 'rgba(67, 97, 238, 0.1)',
            tension: 0.4,
            fill: true,
            pointBackgroundColor: '#4361ee',
            pointBorderColor: '#fff',
            pointBorderWidth: 2,
            pointRadius: 4
        }]
    },
    options: {
        responsive: true,
        plugins: {
            legend: { position: 'top' }
        },
        scales: {
            y: {
                beginAtZero: true,
                ticks: {
                    callback: value => '₹' + value
                }
            }
        }
    }
});


/* PIE CHART */
const pieCtx = document.getElementById('pieChart').getContext('2d');

new Chart(pieCtx, {
    type: 'pie',
    data: {
        labels: ['Users', 'Categories', 'Expenses'],
        datasets: [{
            data: [
                ${totalUser != null ? totalUser : 0},
                ${totalCategory != null ? totalCategory : 0},
                ${totalExpense != null ? totalExpense : 0}
            ],
            backgroundColor: [
                '#4e73df',
                '#1cc88a',
                '#e74a3b'
            ]
        }]
    },
    options: {
        responsive: true,
        plugins: {
            legend: {
                position: 'bottom'
            }
        }
    }
});
</script>

</body>
</html>