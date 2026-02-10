<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>

<jsp:include page="AdminCSS.jsp"></jsp:include>

<style>

body{
    background:#eef2f7;
}

.profile-card{
    max-width:900px;
    margin:60px auto;
    border:none;
    border-radius:14px;
    box-shadow:0 6px 20px rgba(0,0,0,0.08);
}

.profile-img{
    width:140px;
    height:140px;
    object-fit:cover;
    border-radius:50%;
    border:4px solid #0d6efd;
}

.label{
    font-weight:600;
    color:#555;
}

.value{
    font-weight:500;
}

</style>

</head>
<body>

<!-- Navbar -->
<jsp:include page="AdminHeader.jsp"></jsp:include>
<jsp:include page="AdminSidebar.jsp"></jsp:include>


<div class="content">

    <div class="card profile-card p-4">

        <div class="row">

            <!-- Profile Image -->
            <div class="col-md-4 text-center">

                <c:choose>

                    <c:when test="${not empty user.profilePicURL}">
                        <img src="${user.profilePicURL}" class="profile-img">
                    </c:when>

                    <c:otherwise>
                        <img src="https://cdn-icons-png.flaticon.com/512/149/149071.png"
                             class="profile-img">
                    </c:otherwise>

                </c:choose>

                <h4 class="mt-3">
                    ${user.firstName} ${user.lastName}
                </h4>

                <!-- Active Badge -->
                <c:if test="${user.active}">
                    <span class="badge bg-success">Active</span>
                </c:if>

                <c:if test="${!user.active}">
                    <span class="badge bg-danger">Inactive</span>
                </c:if>

            </div>


            <!-- User Details -->
            <div class="col-md-8">

                <div class="row mb-3">
                    <div class="col-4 label">User ID:</div>
                    <div class="col-8 value">${user.userId}</div>
                </div>

                <div class="row mb-3">
                    <div class="col-4 label">Email:</div>
                    <div class="col-8 value">${user.email}</div>
                </div>

                <div class="row mb-3">
                    <div class="col-4 label">Contact:</div>
                    <div class="col-8 value">${user.contact_num}</div>
                </div>

                <div class="row mb-3">
                    <div class="col-4 label">Gender:</div>
                    <div class="col-8 value">${user.gender}</div>
                </div>

                <div class="row mb-3">
                    <div class="col-4 label">Role:</div>
                    <div class="col-8 value">
                        <span class="badge bg-info text-dark">
                            ${user.role}
                        </span>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-4 label">Created At:</div>
                    <div class="col-8 value">
                        ${user.createdAt}
                    </div>
                </div>

            </div>

        </div>


        <!-- Buttons -->
        <div class="text-end mt-4">

            <a href="ListUsers" class="btn btn-secondary">
                Back
            </a>

            <a href="edituser?userId=${user.userId}"
               class="btn btn-warning">
               Edit
            </a>

        </div>

    </div>

</div>

</body>
</html>
