<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add New Income</title>

<jsp:include page="AdminCSS.jsp"></jsp:include>

<style>
 body{
        background-color:#f4f6f9;
    }

    .card{
        border:none;
        border-radius:12px;
        box-shadow:0 4px 12px rgba(0,0,0,0.08);
}

.btn-add{
    float:right;
}
</style>

</head>

<body>

    <!-- Header -->
    <jsp:include page="AdminHeader.jsp"></jsp:include>

    <!-- Sidebar -->
    <jsp:include page="AdminSidebar.jsp"></jsp:include>

    <div class="content">
        <div class="row justify-content-center">
            <div class="col-md-7 col-lg-6">

                <div class="card shadow">
                    <div class="card-body p-4">

                        <h3 class="text-center brand mb-2">MoneyTrail</h3>
                        <h4>
                            <p class="text-center text-muted mb-4">
                                <i class="bi bi-cash-stack text-success"></i>
                                Add New Income
                            </p>
                        </h4>

                        <form action="saveIncome" method="post">

                            <!-- Title -->
                            <div class="mb-3">
                                <label class="form-label">Income Title</label>
                                <input type="text"
                                       name="title"
                                       class="form-control"
                                       placeholder="e.g. Salary, Freelancing"
                                       required>
                            </div>

                            <!-- Date -->
                            <div class="mb-3">
                                <label class="form-label">Income Date</label>
                                <input type="date"
                                       name="date"
                                       class="form-control"
                                       required>
                            </div>

                            <!-- Account -->
                            <div class="mb-3">
                                <label class="form-label">Account</label>
                                <select name="accountId" class="form-select" required>
                                    <option value="-1">-- Select Account --</option>
                                    <c:forEach items="${accountList}" var="acc">
                                        <option value="${acc.accountId}">
                                            ${acc.accountName}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>

                            <!-- Amount -->
                            <div class="mb-3">
                                <label class="form-label">Amount</label>
                                <input type="number"
                                       name="amount"
                                       class="form-control"
                                       placeholder="Enter income amount"
                                       required>
                            </div>

                            <!-- Description -->
                            <div class="mb-3">
                                <label class="form-label">Description</label>
                                <textarea name="description"
                                          class="form-control"
                                          rows="3"
                                          placeholder="Optional description"></textarea>
                            </div>

                            <!-- Status -->
                            <div class="mb-3">
                                <label class="form-label">Status</label>
                                <select name="statusId" class="form-select" required>
                                    <option value="1">Active</option>
                                    <option value="0">Inactive</option>
                                </select>
                            </div>

                            <!-- Buttons -->
                            <div class="text-center mt-4">
                                <button type="submit" class="btn btn-success btn-lg">
                                    <i class="bi bi-check-circle"></i>
                                    Save Income
                                </button>
                            </div>

                            <p class="text-center mt-3">
                                <a href="admin-dashboard" class="btn btn-secondary">
                                    Cancel
                                </a>
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
