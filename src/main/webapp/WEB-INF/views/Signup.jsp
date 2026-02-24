<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

<meta charset="UTF-8">
<title>MoneyTrail - Signup</title>

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

    .signup-card {
        width: 100%;
        max-width: 450px;
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

<div class="signup-card">

    <h3 class="text-center brand-title mb-1">MoneyTrail</h3>
    <p class="text-center text-muted mb-4">Create Account</p>

    <form action="register" method="post" enctype="multipart/form-data">

        <div class="row">
            <div class="col-md-6 mb-3">
                <label class="form-label">First Name</label>
                <input type="text" name="firstName" class="form-control"
                       placeholder="First name" required>
            </div>

            <div class="col-md-6 mb-3">
                <label class="form-label">Last Name</label>
                <input type="text" name="lastName" class="form-control"
                       placeholder="Last name" required>
            </div>
        </div>

        <div class="mb-3">
            <label class="form-label">Mobile Number</label>
            <input type="text" name="contact_num" class="form-control"
                   placeholder="Phone Number" maxlength="10" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Gender</label>
            <select name="gender" class="form-select" required>
                <option value="">Select gender</option>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="email" name="email" class="form-control"
                   placeholder="abc@gmail.com" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Password</label>
            <div class="input-group">
                <input type="password" name="password" id="password"
                       class="form-control" placeholder="Create password" required>
                <span class="input-group-text" style="cursor:pointer;"
                      onclick="togglePassword('password','toggleIcon1')">
                    <i class="bi bi-eye-slash" id="toggleIcon1"></i>
                </span>
            </div>
        </div>
        

        <div class="mb-3">
            <label class="form-label">Confirm Password</label>
            <div class="input-group">
                <input type="password" id="confirmPassword"
                       class="form-control" placeholder="Confirm password" required>
                <span class="input-group-text" style="cursor:pointer;"
                      onclick="togglePassword('confirmPassword','toggleIcon2')">
                    <i class="bi bi-eye-slash" id="toggleIcon2"></i>
                </span>
            </div>
            <small id="passwordError" class="text-danger d-none">
                Passwords do not match
            </small>
        </div>
        
        <!-- Profile Pic URL -->
			<div class="mb-3">
					<label class="form-label">Profile Picture URL</label> <input
						type="file" name="profilePic" class="form-control">
			</div>
			
        <div class="d-grid mt-4">
            <button type="submit" class="btn btn-primary btn-lg">
                Sign Up
            </button>
        </div>

        <p class="text-center mt-3">
            Already have an account? <a href="login">Login</a>
        </p>

    </form>

</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<script>
function togglePassword(fieldId, iconId) {
    const field = document.getElementById(fieldId);
    const icon = document.getElementById(iconId);

    if (field.type === "password") {
        field.type = "text";
        icon.classList.remove("bi-eye-slash");
        icon.classList.add("bi-eye");
    } else {
        field.type = "password";
        icon.classList.remove("bi-eye");
        icon.classList.add("bi-eye-slash");
    }
}

// Password match validation
document.querySelector("form").addEventListener("submit", function (e) {
    const pwd = document.getElementById("password").value;
    const cpwd = document.getElementById("confirmPassword").value;
    const error = document.getElementById("passwordError");

    if (pwd !== cpwd) {
        e.preventDefault();
        error.classList.remove("d-none");
    } else {
        error.classList.add("d-none");
    }
});
</script>

</body>
</html>