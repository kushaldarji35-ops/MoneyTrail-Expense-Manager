<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Accounts</title>

<jsp:include page="AdminCSS.jsp"></jsp:include>

</head>
<body>
	<!-- header -->
	<jsp:include page="AdminHeader.jsp"></jsp:include>

	<!-- Sidebar -->
	<jsp:include page="AdminSidebar.jsp"></jsp:include>


    <div class="content">

    <div class="card p-4">

        <!-- header row -->
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h3>Account List</h3>

            <a href="account" class="btn btn-primary">
                + Add Account
            </a>
        </div>

    <table class="table table-bordered table-hover text-center align-middle">
        <thead class="table-dark">
            <tr>
                <th>Account Id</th>
                <th>Title</th>
                <th>Ex Default</th>
                <th>Amount</th>
                <th>User Id</th>
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
                    <td>${a.user.userId}</td>

                    <td>

                                	 <!-- View -->
                                    <a href="viewaccount?accountId=${a.accountId}" 
                                       class="btn btn-sm btn-info">
                                       <i class="bi bi-eye-fill"></i>
                                    </a>

                                    <!-- Edit -->
                                    <a href="editaccount?accountId=${a.accountId}" 
                                       class="btn btn-sm btn-warning">
                                       <i class="bi bi-pencil-square"></i>
                                    </a>

                                    <!-- Delete -->
                                    <a href="deleteaccount?accountId=${a.accountId}" 
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