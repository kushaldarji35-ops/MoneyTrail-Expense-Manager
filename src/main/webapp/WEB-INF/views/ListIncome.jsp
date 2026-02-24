<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Income</title>

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
<!-- header -->
	<jsp:include page="AdminHeader.jsp"></jsp:include>

	<!-- Sidebar -->
	<jsp:include page="AdminSidebar.jsp"></jsp:include>
<div class="content">

    <div class="card shadow">
        <div class="card-body">

            <!-- Header -->
            <h3 class="mb-4">
                <i class="bi bi-cash-stack text-success"></i>
                Income List

                <a href="newIncome" class="btn btn-success btn-add">
                    <i class="bi bi-plus-circle"></i> Add Income
                </a>
            </h3>

            <!-- Table -->
            <table class="table table-bordered table-hover text-center align-middle">

                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Title</th>
                        <th>Date</th>
                        <th>Account</th>
                        <th>Description</th>
                        <th>Amount</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>

                    <c:forEach items="${incomeList}" var="income">
                        <tr>
                            <td>${income.incomeId}</td>
                            <td>${income.title}</td>
                            <td>${income.date}</td>
                            <td>${income.accountId}</td>
                            <td>${income.description}</td>

                            <td class="text-success fw-bold">
                                ₹ ${income.amount}
                            </td>

                            <td>
                                <span class="badge bg-success">
                                    ${income.statusId}
                                </span>
                            </td>

                            <td>
                            	
                                	 <!-- View -->
                                    <a href="viewincome?incomeId=${income.incomeId}" 
                                       class="btn btn-sm btn-info">
                                       <i class="bi bi-eye-fill"></i>
                                    </a>

                                    <!-- Edit -->
                                    <a href="editincome?incomeId=${income.incomeId}" 
                                       class="btn btn-sm btn-warning">
                                       <i class="bi bi-pencil-square"></i>
                                    </a>

                                    <!-- Delete -->
                                    <a href="deleteincome?incomeId=${income.incomeId}" 
                                       class="btn btn-sm btn-danger"
                                       onclick="return confirm('Are you sure you want to delete this expense?')">
                                       <i class="bi bi-trash"></i>
                                    </a>

                            </td>
                        </tr>
                    </c:forEach>

                </tbody>

            </table>

        </div>
    </div>
    <jsp:include page="AdminFooter.jsp"></jsp:include>

</div>

</body>
</html>
