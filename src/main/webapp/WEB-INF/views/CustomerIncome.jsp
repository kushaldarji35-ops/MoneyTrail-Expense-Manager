<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Income</title>

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

.btn-add{
    float:right;
}

</style>

</head>

<body>

<!-- Header -->
<jsp:include page="CustomerHeader.jsp"></jsp:include>

<!-- Sidebar -->
<jsp:include page="CustomerSidebar.jsp"></jsp:include>


<div class="content">

<div class="card shadow">

<div class="card-body">

<h3 class="mb-4">
<i class="bi bi-cash-stack text-success"></i>
Income List

<button class="btn btn-success btn-add"
data-bs-toggle="modal"
data-bs-target="#incomeModal">

<i class="bi bi-plus-circle"></i> Add Income

</button>

</h3>


<table class="table table-bordered table-hover text-center align-middle">

<thead>
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



<a href="editcustomerincome?incomeId=${income.incomeId}" 
class="btn btn-sm btn-warning">
<i class="bi bi-pencil-square"></i>
</a>

<a href="deletecustomerincome?incomeId=${income.incomeId}" 
class="btn btn-sm btn-danger"
onclick="return confirm('Delete this income?')">
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

<div class="modal fade" id="incomeModal" tabindex="-1">

<div class="modal-dialog">

<div class="modal-content">

<div class="modal-header bg-success text-white">

<h5 class="modal-title">

<i class="bi bi-cash-stack"></i>
Add New Income

</h5>

<button type="button"
class="btn-close"
data-bs-dismiss="modal"></button>

</div>


<div class="modal-body">

<form action="savecustomerincome" method="post">


<div class="mb-3">

<label class="form-label">Income Title</label>

<input type="text"
name="title"
class="form-control"
placeholder="Salary / Freelancing"
required>

</div>



<div class="mb-3">

<label class="form-label">Income Date</label>

<input type="date"
name="date"
class="form-control"
required>

</div>



<div class="mb-3">

<label class="form-label">Account</label>

<select name="accountId"
class="form-select"
required>

<option value="-1">-- Select Account --</option>

<c:forEach items="${accountList}" var="acc">

<option value="${acc.accountId}">
${acc.title}
</option>

</c:forEach>

</select>

</div>



<div class="mb-3">

<label class="form-label">Amount</label>

<input type="number"
name="amount"
class="form-control"
placeholder="Enter amount"
required>

</div>



<div class="mb-3">

<label class="form-label">Description</label>

<textarea name="description"
class="form-control"
rows="3"></textarea>

</div>



<div class="mb-3">

<label class="form-label">Status</label>

<select name="statusId"
class="form-select"
required>

<option value="1">Active</option>
<option value="0">Inactive</option>

</select>

</div>



<div class="text-center">

<button type="submit"
class="btn btn-success">

<i class="bi bi-check-circle"></i>
Save Income

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