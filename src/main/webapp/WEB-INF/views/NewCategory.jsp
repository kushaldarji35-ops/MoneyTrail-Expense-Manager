<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MoneyTrail - Add Category</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    body {
        min-height: 100vh;
        background: linear-gradient(135deg, #43cea2, #185a9d);
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .card-box {
        width: 100%;
        max-width: 420px;
        padding: 30px;
        border-radius: 14px;
        background: #fff;
        box-shadow: 0 10px 25px rgba(0,0,0,0.2);
    }

    .brand {
        font-weight: bold;
        color: #185a9d;
    }
</style>
</head>

<body>

<div class="card-box">

    <h3 class="text-center brand mb-1">MoneyTrail</h3>
    <p class="text-center text-muted mb-4">Add New Category</p>

    <form action="saveCategory" method="post">

        <!-- Category Name -->
        <div class="mb-3">
            <label class="form-label">Category Name</label>
            <input type="text"
                   name="categoryName"
                   class="form-control"
                   placeholder="Enter category (e.g. Food, Travel)"
                   required>
        </div>

        <!-- Buttons -->
        <div class="d-grid">
            <button type="submit" class="btn btn-primary btn-lg">
                Save Category
            </button>
        </div>

        <p class="text-center mt-3">
            <a href="admin-dashboard">← Back to Dashboard</a>
        </p>

    </form>

</div>

</body>
</html>
