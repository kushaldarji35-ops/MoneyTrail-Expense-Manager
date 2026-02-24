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
    border-radius:12px;
}

.table th{
    background-color:rgb(0, 0, 0);
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

    <div class="card p-4">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h3 class="mb-0">Expense List</h3>

                <a href="expense" class="btn btn-success">
                    <i class="bi bi-cash-stack"></i> New Expense
                </a>
            </div>

            <div class="card-body">

                <table class="table table-bordered table-hover text-center align-middle">

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
                    
                                	 <!-- View -->
                                    <a href="viewexpense?expenseId=${e.expenseId}" 
                                       class="btn btn-sm btn-info">
                                       <i class="bi bi-eye-fill"></i>
                                    </a>

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
       
        <jsp:include page="AdminFooter.jsp"></jsp:include>

    </div>


</body>
</html>
