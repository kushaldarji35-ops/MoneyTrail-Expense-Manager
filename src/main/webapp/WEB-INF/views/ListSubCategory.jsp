<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MoneyTrail - SubCategory List</title>
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

    .header-bar{
        display:flex;
        justify-content:space-between;
        align-items:center;
    }
</style>

</head>
<body>
<!-- header -->
	<jsp:include page="AdminHeader.jsp"></jsp:include>

	<!-- Sidebar -->
	<jsp:include page="AdminSidebar.jsp"></jsp:include>



<div class="content">

    <div class="card p-4">

        <!-- Header -->
        <div class="header-bar mb-3">
            <h3>📊 SubCategory List</h3>

            <a href="newSubCategory" class="btn btn-primary">
                + Add SubCategory
            </a>
        </div>

        <!-- Table -->
        <table class="table table-bordered table-hover text-center align-middle">
            <thead class="table-dark">
                <tr>
                    <th width="70">#</th>
                    <th>SubCategory Name</th>
                    <th width="150">Status</th>
                    <th width="180">Action</th>
                </tr>
            </thead>

            <tbody>

                <!-- Empty Check -->
                <c:if test="${empty subCategoryList}">
                    <tr>
                        <td colspan="4" class="text-center text-muted p-4">
                            No SubCategories Available
                        </td>
                    </tr>
                </c:if>

                <!-- Data Loop -->
                <c:forEach var="sub" items="${subCategoryList}" varStatus="i">

                    <tr>
                        <td>${i.index + 1}</td>

                        <td>
                            <strong>${sub.subCategoryName}</strong>
                        </td>

                        <td>
                            <c:choose>

                                <c:when test="${sub.active}">
                                    <span class="badge bg-success">
                                        Active
                                    </span>
                                </c:when>

                                <c:otherwise>
                                    <span class="badge bg-secondary">
                                        Inactive
                                    </span>
                                </c:otherwise>

                            </c:choose>
                        </td>

                        <td>

                            <a href="editSubCategory?subcategoryId=${sub.subCategoryId}"
                               class="btn btn-warning btn-sm">
                               Edit
                            </a>

                            <a href="deleteSubCategory?subcategoryId=${sub.subCategoryId}"
                               class="btn btn-danger btn-sm"
                               onclick="return confirm('Delete this subcategory?')">
                               Delete
                            </a>

                        </td>
                    </tr>

                </c:forEach>

            </tbody>
        </table>

    </div>
    <jsp:include page="AdminFooter.jsp"></jsp:include>
    
</div>


</body>
</html>
