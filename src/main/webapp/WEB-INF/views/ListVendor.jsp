<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Vendor</title>

<jsp:include page="AdminCSS.jsp"></jsp:include>

</head>
<body>
	<!-- header -->
	<jsp:include page="AdminHeader.jsp"></jsp:include>

	<!-- Sidebar -->
	<jsp:include page="AdminSidebar.jsp"></jsp:include>
	

<div class="content">

    <h3>Vendor List</h3>

    <a href="newVendor" class="btn btn-primary mb-3">Add Vendor</a>

    <table class="table table-bordered table-hover text-center align-middle">
        <thead class="table-dark">
            <tr>
                <th>Vendor Id</th>
                <th>Vendor Name</th>
                <th>Action</th>
            </tr>
        </thead>

        <tbody>
            <c:forEach items="${vendors}" var="v">
                <tr>
                    <td>${v.vendorId}</td>
                    <td>${v.vendorName}</td>

                    <td>
                      
                                	 <!-- View -->
                                    <a href="viewVendor?vendorId=${v.vendorId}" 
                                       class="btn btn-sm btn-info">
                                       <i class="bi bi-eye-fill"></i>
                                    </a>

                                    <!-- Edit -->
                                    <a href="editVendor?vendorId=${v.vendorId}" 
                                       class="btn btn-sm btn-warning">
                                       <i class="bi bi-pencil-square"></i>
                                    </a>

                                    <!-- Delete -->
                                    <a href="deleteVendor?vendorId=${v.vendorId}" 
                                       class="btn btn-sm btn-danger"
                                       onclick="return confirm('Are you sure you want to delete this expense?')">
                                       <i class="bi bi-trash"></i>
                                    </a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <jsp:include page="AdminFooter.jsp"></jsp:include>
    

</div>

</body>
</html>