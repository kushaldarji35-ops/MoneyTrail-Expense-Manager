<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

						    <div class="form-label">
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
				            <a href="admin-dashboard" class="btn btn-secondary"> Cancel</a>
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
