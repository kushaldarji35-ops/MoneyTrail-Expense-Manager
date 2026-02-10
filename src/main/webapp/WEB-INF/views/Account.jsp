<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MoneyTrail - Add Account</title>
<jsp:include page="AdminCSS.jsp"></jsp:include>

<style>
		body {
			background-color: linear-gradient(135deg, #43cea2, #185a9d);
		}

		.card {
			margin-top: 80px;
			border-radius: 14px;
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
						<h3 class="text-center brand mb-4">MoneyTrail</h3>
    			<h4><p class="text-center text-muted mb-4">Add New Account</p></h4>


    <form action="account" method="post">

        <!-- Account Name -->
        <div class="form-lable">
            <label class="form-label">Account Name</label>
            <input type="text"
                   name="title"
                   class="form-control"
                   placeholder="Enter account (Cash, Bank, UPI...)"
                   required>
        </div>
		<br>	
        <!-- Opening Balance -->
        <div class="form-lable">
            <label class="form-label">Opening Balance</label>
            <input type="number"
                   name="amount"
                   class="form-control"
                   placeholder="Enter starting balance"
                   step="0.01"
                   required>
        </div>

        <!-- Button -->
        <div class="text-center mt-3">
            <button type="submit" class="btn btn-primary btn-lg">
                Save Account
            </button>
        </div>

        <p class="text-center mt-3">
            <a href="admin-dashboard" class="btn btn-secondary"> Cancel</a>
        </p>

    </form>
    
					</div>
					<jsp:include page="AdminFooter.jsp"></jsp:include>
				</div>
			</div>
		</div>
		
		
		
    
</div>
			

</body>
</html>
