<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
	
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <title>Reset Password</title>

    <style>
        body {
            background: linear-gradient(135deg, #43cea2, #185a9d);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .reset-card {
            max-width: 420px;
            margin: 60px auto;
            padding: 25px;
            border-radius: 12px;
            background: #fff;
            box-shadow: 0 0 12px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="reset-card">

            <h3 class="text-center mb-4">Reset Password</h3>

            <!-- Success Message -->
            <c:if test="${not empty success}">
                <div class="alert alert-success">${success}</div>
            </c:if>

            <!-- Error Message -->
            <c:if test="${not empty error}">
                <div class="alert alert-danger">${error}</div>
            </c:if>

            <form action="rlogin" method="post">
                
                <!-- Hidden Token Field -->
                <input type="hidden" name="token" value="${param.token}" />

                <!-- New Password -->
                <div class="mb-3">
    <label class="form-label" for="newPassword">New Password</label>

    <div class="input-group">
        <input type="password" name="newPassword" id="newPassword" class="form-control"
               placeholder="Enter new password" required>

        <span class="input-group-text" style="cursor:pointer;" onclick="togglePassword('newPassword','icon1')">
            <i class="bi bi-eye-slash" id="icon1"></i>
        </span>
    </div>
</div>


                <!-- Confirm Password -->
                <div class="mb-3">
    <label class="form-label" for="confirmPassword">Confirm Password</label>

    <div class="input-group">
        <input type="password" name="confirmPassword" id="confirmPassword" class="form-control"
               placeholder="Re-enter new password" required>

        <span class="input-group-text" style="cursor:pointer;" onclick="togglePassword('confirmPassword','icon2')">
            <i class="bi bi-eye-slash" id="icon2"></i>
        </span>
    </div>
</div>

                <!-- Submit Button -->
                <button type="submit" class="btn btn-primary w-100">Reset Password</button>

                <p class="text-center mt-3">
                    <a href="login">Back to Login</a>
                </p>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
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
</script>
</html>