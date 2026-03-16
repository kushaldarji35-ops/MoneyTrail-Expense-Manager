<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MoneyTrail - Users List</title>

<jsp:include page="AdminCSS.jsp"></jsp:include>
<style>
    body {
        background-color: #f4f6f9;
    }

    .header {
        background: white;
        padding: 15px 30px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.08);
    }

    .card {
        border: none;
        border-radius: 12px;
        box-shadow: 0 6px 18px rgba(0,0,0,0.08);
    }

    table th {
        background: #185a9d;
        color: white;
        text-align: center;
    }

    table td {
        vertical-align: middle;
        text-align: center;
    }
</style>
</head>

<body>

        <jsp:include page="AdminHeader.jsp"></jsp:include>
        <jsp:include page="AdminSidebar.jsp"></jsp:include>

<!-- CONTENT -->
<div class="content">

    <div class="card p-4">

        <div class="d-flex justify-content-between align-items-center mb-3">
            <h3>Users List</h3>

            <a href="adduser" class="btn btn-primary">
                + Add User
            </a>
        </div>

        <table class="table table-bordered table-hover text-center align-middle">

            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Contact</th>
                    <th>Gender</th>
                    <th>Role</th>
                    <th>Status</th>
                    <th>Created At</th>
                    <th>Action</th>
                </tr>
            </thead>

            <tbody>

                <c:forEach items="${users}" var="u">
                    <tr>
                        <td>${u.userId}</td>

                        <td>
                            ${u.firstName} ${u.lastName}
                        </td>

                        <td>${u.email}</td>

                        <td>${u.contact_num}</td>

                        <td>${u.gender}</td>

                        <td>
                            <span class="badge bg-info text-dark">
                                ${u.role}
                            </span>
                        </td>

                        <td>
                            <c:if test="${u.active}">
                                <span class="badge bg-success">Active</span>
                            </c:if>

                            <c:if test="${!u.active}">
                                <span class="badge bg-danger">Inactive</span>
                            </c:if>
                        </td>

                        <td>${u.createdAt}</td>

                        <td>
                                	 <!-- View -->
                                    <a href="viewUser?userId=${u.userId}" 
                                       class="btn btn-sm btn-info">
                                       <i class="bi bi-eye-fill"></i>
                                    </a>

                                    <!-- Edit -->
                                    <a href="editUser?userId=${u.userId}" 
                                       class="btn btn-sm btn-warning">
                                       <i class="bi bi-pencil-square"></i>
                                    </a>

                                    <!-- Delete -->
                                    <a href="deleteUser?userId=${u.userId}" 
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
    <jsp:include page="AdminFooter.jsp"></jsp:include>

</div>

</body>
</html>
