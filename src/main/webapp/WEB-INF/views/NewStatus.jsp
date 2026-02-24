<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Status</title>

<jsp:include page="AdminCSS.jsp"></jsp:include>

<style>
body {
    background-color: #f4f6f9;
}

.card {
    margin-top: 100px;
    border-radius: 15px;
}
</style>
</head>
<body>

<jsp:include page="AdminHeader.jsp"></jsp:include>
<jsp:include page="AdminSidebar.jsp"></jsp:include>

<div class="content">
    <div class="row justify-content-center">
        <div class="col-md-5">
            <div class="card shadow">
                
                <div class="card-header bg-dark text-white text-center">
                    <h4>Add Payment Status</h4>
                </div>

                <div class="card-body">
                    <form action="savestatus" method="post">

                        <!-- Status Dropdown -->
                        <div class="mb-3">
                            <label class="form-label fw-bold">Select Status</label>
                            <select name="status" class="form-select" required>
                                <option value="">-- Choose Status --</option>
                                <option value="Paid">Paid</option>
                                <option value="UnPaid">UnPaid</option>
                                <option value="Partial Paid">Partial Paid</option>
                            </select>
                        </div>

                        <!-- Buttons -->
                        <div class="text-center">
                            <a href="admin-dashboard" class="btn btn-secondary">
                                Back
                            </a>

                            <button type="submit" class="btn btn-success">
                                Save Status
                            </button>
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
