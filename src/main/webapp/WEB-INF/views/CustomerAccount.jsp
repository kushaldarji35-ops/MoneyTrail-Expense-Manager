<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Account</title>

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

<h3>Account List</h3>

<button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#accountModal">
+ Add Account
</button>

</div>

<table class="table table-bordered table-hover text-center align-middle">

<thead>
<tr>
<th>Account Id</th>
<th>Title</th>
<th>Ex Default</th>
<th>Amount</th>
<th>Action</th>
</tr>
</thead>

<tbody>

<c:forEach items="${accounts}" var="a">

<tr>

<td>${a.accountId}</td>
<td>${a.title}</td>

<td>
<c:choose>
<c:when test="${a.exDefault}">
Yes
</c:when>
<c:otherwise>
No
</c:otherwise>
</c:choose>
</td>

<td>${a.amount}</td>

<td>


<a href="editcustomeraccount?accountId=${a.accountId}" 
class="btn btn-sm btn-warning">
<i class="bi bi-pencil-square"></i>
</a>

<a href="deletecustomeraccount?accountId=${a.accountId}" 
class="btn btn-sm btn-danger"
onclick="return confirm('Delete this account?')">
<i class="bi bi-trash"></i>
</a>

</td>

</tr>

</c:forEach>

</tbody>

</table>

</div>

</div>


<!-- ================= POPUP MODAL ================= -->

<div class="modal fade" id="accountModal" tabindex="-1">

<div class="modal-dialog">

<div class="modal-content">

<div class="modal-header bg-primary text-white">

<h5 class="modal-title">Add New Account</h5>

<button type="button" class="btn-close" data-bs-dismiss="modal"></button>

</div>


<div class="modal-body">

<form action="savecustomeraccount" method="post">

<!-- Account Type -->
<div class="mb-3">

<label class="form-label">Account Type</label>

<select name="title" class="form-control" required>

<option value="">Select Account Type</option>
<option value="Cash">Cash</option>
<option value="Debit Card">Debit Card</option>
<option value="Credit Card">Credit Card</option>
<option value="UPI">UPI</option>

</select>

</div>


<!-- Opening Balance -->

<div class="mb-3">

<label class="form-label">Opening Balance</label>

<input type="number"
name="amount"
class="form-control"
step="0.01"
placeholder="Enter starting balance"
required>

</div>


<div class="text-center">

<button type="submit" class="btn btn-primary">
Save Account
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