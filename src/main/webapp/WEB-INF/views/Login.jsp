<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

<meta charset="UTF-8">
<title>MoneyTrail - Login</title>

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

    .login-card {
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

<div class="login-card">

    <h3 class="text-center brand-title mb-1">MoneyTrail</h3>
    <p class="text-center text-muted mb-4">Login</p>

    <form action="authenticate" method="post">

        <div class="mb-3">
            <label class="form-label">Email or Phone Number</label>
            <input type="text" name="email" class="form-control" placeholder="Enter email or phone number" required>
        </div>
     
        <div class="mb-3">
    <label class="form-label">Password</label>

    <div class="input-group">
        <input type="password" name="password" id="password" class="form-control" placeholder="Enter password" required>

        <span class="input-group-text" style="cursor:pointer;" onclick="togglePassword()">
            <i class="bi bi-eye-slash" id="toggleIcon"></i>
        </span>
    </div>
</div>


        <div class="d-grid mt-4">
           <button type="submit" class="btn btn-primary btn-lg">Login</button>
        </div>

        <p class="text-center mt-3">
             Don't have an account? <a href="signup">Sign Up</a>
        </p>
        <p class="text-center mt-3">
            Forget Password? <a href="forgetPassword">Click Here</a>
        </p>
        
    </form>

</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
<script>
function togglePassword() {
    const passwordField = document.getElementById("password");
    const icon = document.getElementById("toggleIcon");

    if (passwordField.type === "password") {
        passwordField.type = "text";
        icon.classList.remove("bi-eye-slash");
        icon.classList.add("bi-eye");
    } else {
        passwordField.type = "password";
        icon.classList.remove("bi-eye");
        icon.classList.add("bi-eye-slash");
    }
}
</script>

</html>
