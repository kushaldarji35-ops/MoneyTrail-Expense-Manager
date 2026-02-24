<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Expense</title>

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
    <div class="row justify-content-center">
        <div class="col-md-8">

            <div class="card shadow-lg">
                <div class="card-header bg-danger text-white text-center">
                    <h4>Add New Expense</h4>
                </div>

                <div class="card-body">

                    <form action="saveexpense" method="post">

                        <!-- Title -->
                        <div class="mb-3">
                            <label class="form-label">Expense Title</label>
                            <input type="text" name="title" class="form-control" placeholder="Enter expense title" required>
                        </div>

                        <!-- Category -->
                        <div class="mb-3">
                            <label class="form-label">Category</label>
                            
                            <select name="categoryId" class="form-control" required>
                                <option value="1">Select Category</option>
                                <c:forEach items="${categoryList}" var="c">
                                    <option value="${c.categoryId}">${c.categoryName}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <!-- SubCategory -->
                        <div class="mb-3">
                            <label class="form-label">Sub Category</label>
                            <select name="subCategoryId" class="form-control" required>
                                <option value="1">Select SubCategory</option>
                                <c:forEach items="${subCategoryList}" var="sc">
                                    <option value="${sc.subCategoryId}">${sc.subCategoryName}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <!-- Vendor -->
                        <div class="mb-3">
                            <label class="form-label">Vendor</label>
                            <select name="vendorId" class="form-control">
                                <option value="1">Select Vendor</option>
                                <c:forEach items="${vendorList}" var="v">
                                    <option value="${v.vendorId}">${v.vendorName}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <!-- Account -->
                        <div class="mb-3">
                            <label class="form-label">Account</label>
                            <select name="accountId" class="form-control" required>
                                <option value="1">Select Account</option>
                                <c:forEach items="${accountList}" var="a">
                                    <option value="${a.accountId}">${a.accountName}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <!-- Status -->
                        <div class="mb-3">
                            <label class="form-label">Status</label>
                            <select name="statusId" class="form-control" required>
                                <option value="1">Select Status</option>
                                <c:forEach items="${statusList}" var="s">
                                    <option value="${s.statusId}">${s.statusName}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <!-- Amount -->
                        <div class="mb-3">
                            <label class="form-label">Amount</label>
                            <input type="number" step="0.01" name="amount" class="form-control" placeholder="Enter amount" required>
                        </div>

                        <!-- Date -->
                        <div class="mb-3">
                            <label class="form-label">Date</label>
                            <input type="date" name="date" class="form-control" required>
                        </div>

                        <!-- Description -->
                        <div class="mb-3">
                            <label class="form-label">Description</label>
                            <textarea name="description" class="form-control" rows="3" placeholder="Enter description"></textarea>
                        </div>

                        <div class="text-center">
                            <button type="submit" class="btn btn-danger px-4">Save Expense</button>
                            <a href="listexpense" class="btn btn-secondary px-4">Cancel</a>
                        </div>

                    </form>

                </div>
            </div>

        </div>
    </div>
    <jsp:include page="AdminFooter.jsp"></jsp:include>
</div>

</body>
</html>
