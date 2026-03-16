<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Expense</title>

<jsp:include page="CustomerCSS.jsp"></jsp:include>

<style>

body{
    background:#f4f6f9;
}

.card{
    margin-top:60px;
    border-radius:12px;
}

.table th{
    background:black;
    color:white;
}

</style>

</head>

<body>

<!-- Header -->
<jsp:include page="CustomerHeader.jsp"></jsp:include>

<!-- Sidebar -->
<jsp:include page="CustomerSidebar.jsp"></jsp:include>


<div class="content">

<div class="card p-4">

<div class="d-flex justify-content-between align-items-center mb-3">

<h3>Expense List</h3>

<button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#expenseModal">
<i class="bi bi-cash-stack"></i> New Expense
</button>

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


<a href="deletecustomerexpense?expenseId=${e.expenseId}" class="btn btn-sm btn-warning">
<i class="bi bi-pencil-square"></i>
</a>

<a href="deletecustomerexpense?expenseId=${e.expenseId}" 
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



<!-- ================= POPUP MODAL ================= -->

<div class="modal fade" id="expenseModal" tabindex="-1">

<div class="modal-dialog modal-lg">

<div class="modal-content">

<div class="modal-header bg-danger text-white">

<h5 class="modal-title">Add New Expense</h5>

<button type="button" class="btn-close" data-bs-dismiss="modal"></button>

</div>


<div class="modal-body">

<form action="savecustomerexpense" method="post">

<!-- Title -->
<div class="mb-3">
<label class="form-label">Expense Title</label>
<input type="text" name="title" class="form-control" required>
</div>


<!-- Category -->
<div class="mb-3">
<label class="form-label">Category</label>

<select name="categoryId" class="form-control" required>

<option value="">Select Category</option>

<c:forEach items="${categoryList}" var="c">
<option value="${c.categoryId}">
${c.categoryName}
</option>
</c:forEach>

</select>

</div>


<!-- SubCategory -->
<div class="mb-3">

<label class="form-label">Sub Category</label>

<select name="subCategoryId" class="form-control" required>

<option value="">Select SubCategory</option>

<c:forEach items="${subCategoryList}" var="sc">
<option value="${sc.subCategoryId}">
${sc.subCategoryName}
</option>
</c:forEach>

</select>

</div>


<!-- Vendor -->
<div class="mb-3">

<label class="form-label">Vendor</label>

<select name="vendorId" class="form-control">

<option value="">Select Vendor</option>

<c:forEach items="${vendorList}" var="v">
<option value="${v.vendorId}">
${v.vendorName}
</option>
</c:forEach>

</select>

</div>


<!-- Account -->
<div class="mb-3">

<label class="form-label">Account</label>

<select name="accountId" class="form-control" required>

<option value="">Select Account</option>

<c:forEach items="${accountList}" var="a">
<option value="${a.accountId}">
${a.title}
</option>
</c:forEach>

</select>

</div>


<!-- Status -->
<div class="mb-3">

<label class="form-label">Status</label>

<select name="statusId" class="form-control" required>

<option value="">Select Status</option>

<c:forEach items="${statusList}" var="s">
<option value="${s.statusId}">
${s.status}
</option>
</c:forEach>

</select>

</div>


<!-- Amount -->
<div class="mb-3">
<label class="form-label">Amount</label>
<input type="number" step="0.01" name="amount" class="form-control" required>
</div>


<!-- Date -->
<div class="mb-3">
<label class="form-label">Date</label>
<input type="date" name="date" class="form-control" required>
</div>


<!-- Description -->
<div class="mb-3">
<label class="form-label">Description</label>
<textarea name="description" class="form-control"></textarea>
</div>


<div class="text-center">

<button type="submit" class="btn btn-danger">
Save Expense
</button>

</div>

</form>

</div>
  <jsp:include page="CustomerFooter.jsp"></jsp:include>
</div>

</div>

</div>

</body>
</html>