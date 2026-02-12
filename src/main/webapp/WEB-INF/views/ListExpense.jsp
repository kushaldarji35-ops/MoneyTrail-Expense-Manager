<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Expense List</title>

<jsp:include page="AdminCSS.jsp"></jsp:include>

<style>

.card{
    margin-top:60px;
    border-radius:15px;
}

.table th{
    background-color:#dc3545;
    color:white;
}

</style>

</head>
<body>

<!-- Header -->
<jsp:include page="AdminHeader.jsp"></jsp:include>

<!-- Sidebar -->
<jsp:include page="AdminSidebar.jsp"></jsp:include>


<div class="content">

    <div class="container-fluid">

        <div class="card shadow-lg">

            <div class="card-header d-flex justify-content-between align-items-center">
                <h4 class="mb-0">Expense List</h4>

                <a href="expense" class="btn btn-danger">
                    <i class="bi bi-cash-stack"></i> New Expense
                </a>
            </div>

            <div class="card-body">

                <table class="table table-bordered table-hover text-center">

                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Title</th>
                            <th>Category</th>
                            <th>SubCategory</th>
                            <th>Vendor</th>
                            <th>Account</th>
                            <th>Status</th>
                            <th>Amount</th>
                            <th>Date</th>
                            <th>Action</th>
                        </tr>
                    </thead>

                    <tbody>

                        <c:forEach items="${expenseList}" var="e">

                            <tr>
                                <td>${e.expenseId}</td>
                                <td>${e.title}</td>
                                <td>${e.categoryId}</td>
                                <td>${e.subCategoryId}</td>
                                <td>${e.vendorId}</td>
                                <td>${e.accountId}</td>
                                <td>${e.statusId}</td>
                                <td>₹ ${e.amount}</td>
                                <td>${e.date}</td>

                                <td>

                                    <!-- Edit -->
                                    <a href="editexpense?expenseId=${e.expenseId}" 
                                       class="btn btn-sm btn-warning">
                                       <i class="bi bi-pencil-square"></i>
                                    </a>

                                    <!-- Delete -->
                                    <a href="deleteexpense?expenseId=${e.expenseId}" 
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

    </div>

<jsp:include page="AdminFooter.jsp"></jsp:include>

</div>

</body>
</html>
