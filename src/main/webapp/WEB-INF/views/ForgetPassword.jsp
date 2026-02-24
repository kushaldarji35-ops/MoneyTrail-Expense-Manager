	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>MoneyTrail - Forgot Password</title>
	
	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
	
	<style>
	    body {
	        min-height: 100vh;
	        background: linear-gradient(135deg, #43cea2, #185a9d);
	        display: flex;
	        align-items: center;
	        justify-content: center;
	    }
	
	    .forgot-card {
	        width: 100%;
	        max-width: 400px;
	        background: #ffffff;
	        padding: 30px;
	        border-radius: 14px;
	        box-shadow: 0 10px 25px rgba(0,0,0,0.2);
	    }
	
	    .brand-title {
	        font-weight: bold;
	        color: #185a9d;
	    }
	</style>
	</head>
	<body>
	
	<div class="forgot-card">
	
	    <h3 class="text-center brand-title mb-1">MoneyTrail</h3>
	    <p class="text-center text-muted mb-4">Reset your password</p>
	
	    <form action="resetPassword" method="post">
	
		       <label class="form-label">Email or Phone Number</label>
				<input type="email" name="email" class="form-control"
		       	placeholder="Enter email or phone number" required>
	
	        <div class="d-grid mt-4">
	            <button type="submit" class="btn btn-primary btn-lg">Send OTP</button>
	        </div>
	
	        <p class="text-center mt-3">
	            Remembered your password? <a href="login">Login</a>
	        </p>
	
	    </form>
	
	</div>
	
	<!-- Bootstrap JS -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	
	

	</body>
	</html>