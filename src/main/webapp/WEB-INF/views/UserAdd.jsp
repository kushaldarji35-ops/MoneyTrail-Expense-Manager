<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add User</title>

<jsp:include page="AdminCSS.jsp"></jsp:include>

<style>

body{
    background-color:#f4f6f9;
}

.main-container{
    margin-left:250px;
    padding:30px;
}

.card{
    width:500px;
    margin:auto;
    border-radius:10px;
    box-shadow:0px 2px 10px rgba(0,0,0,0.2);
}

.card-header{
    background-color:#343a40;
    color:white;
    font-size:20px;
    text-align:center;
}

.btn-save{
    width:100%;
}

</style>
</head>

<body>
 <jsp:include page="AdminHeader.jsp"></jsp:include>
  <jsp:include page="AdminSidebar.jsp"></jsp:include>

<div class="content">

<div class="card">

<div class="card-header">
Add New User
</div>

<div class="card-body">

<form action="saveUser" method="post">

<div class="form-group">
<label>First Name</label>
<input type="text" name="firstName" class="form-control" required>
</div>

<div class="form-group">
<label>Last Name</label>
<input type="text" name="lastName" class="form-control" required>
</div>

<div class="form-group">
<label>Email</label>
<input type="email" name="email" class="form-control" required>
</div>

<div class="form-group">
<label>Password</label>
<input type="password" name="password" class="form-control" required>
</div>

<div class="form-group">
<label>Role</label>
<select name="role" class="form-control">
<option value="USER">Customer</option>
<option value="ADMIN">Admin</option>
</select>
</div>

<br>

<button type="submit" class="btn btn-primary btn-save">
Save User
</button>

</form>

</div>
</div>

</div>

</body>
</html>