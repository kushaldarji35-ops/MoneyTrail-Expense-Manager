<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Status</title>

<jsp:include page="AdminCSS.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="AdminHeader.jsp"></jsp:include>
	<jsp:include page="AdminSidebar.jsp"></jsp:include>

<div class="content">

	<h2 class="mb-3">Status List</h2>

	<a href="addstatus" class="btn btn-primary mb-3">Add Status</a>

	<table class="table table-bordered table-hover text-center align-middle">
		<thead class="table-dark">
			<tr>
				<th>Status ID</th>
				<th>Status</th>
				<th>Action</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach items="${statusList}" var="s">
				<tr>
					<td>${s.statusId}</td>
					<td>${s.status}</td>
					<td>
						
                                	 <!-- View -->
                                    <a href="viewstatus?statusId=${s.statusId}" 
                                       class="btn btn-sm btn-info">
                                       <i class="bi bi-eye-fill"></i>
                                    </a>

                                    <!-- Edit -->
                                    <a href="editstatus?statusId=${s.statusId}" 
                                       class="btn btn-sm btn-warning">
                                       <i class="bi bi-pencil-square"></i>
                                    </a>

                                    <!-- Delete -->
                                    <a href="deletestatus?statusId=${s.statusId}" 
                                       class="btn btn-sm btn-danger"
                                       onclick="return confirm('Are you sure you want to delete this expense?')">
                                       <i class="bi bi-trash"></i>
                                    </a>
					</td>
				</tr>
			</c:forEach>

			<c:if test="${empty statusList}">
				<tr>
					<td colspan="3" class="text-center">No Status Found</td>
				</tr>
			</c:if>
		</tbody>
	</table>
	<jsp:include page="AdminFooter.jsp"></jsp:include>

</div>

</body>
</html>