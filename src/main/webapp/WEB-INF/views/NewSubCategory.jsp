<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add New Sub Category</title>

<jsp:include page="AdminCSS.jsp"></jsp:include>

<style>
body {
	background-color: linear-gradient(135deg, #43cea2, #185a9d);
}

.card {
	margin-top: 80px;
	border-radius: 14px;
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
			<div class="col-md-6 col-lg-5">
				<div class="card shadow">
					<div class="card-body p-4">

						<h3 class="text-center brand mb-4">MoneyTrail</h3>
						<h4>
							<p class="text-center text-muted mb-4">
								Add New Sub Category
							</p>
						</h4>

						<form action="saveSubCategory" method="post">

							<!-- Category Dropdown -->
							<div class="form-group mb-3">
								<label class="form-label">Select Category Id</label>

								<select name="categoryId" class="form-control" required>
									<option value="-1">-- Select Category Id --</option>

									<c:forEach items="${categoryList}" var="c">
										<option value="${c.categoryId}">
											${c.categoryName}
										</option>
									</c:forEach>
								</select>
							</div>

							<!-- Sub Category Name -->
							<div class="form-group mb-3">
								<label class="form-label">Sub Category Name</label>

								<input type="text"
								       name="subCategoryName"
								       class="form-control"
								       placeholder="Enter Sub Category"
								       required>
							</div>

							<div class="text-center mt-3">
								<button class="btn btn-primary btn-lg">
									Save SubCategory
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
