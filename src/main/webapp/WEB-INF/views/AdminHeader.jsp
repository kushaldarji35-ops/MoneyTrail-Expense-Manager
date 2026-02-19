<!-- Header -->
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
    <div class="container-fluid">

        <!-- Logo / Title -->
        <span class="navbar-brand fw-bold">
            Admin Panel
        </span>

        <!-- Right Side -->
        <div class="ms-auto">

            <span class="me-3 fw-semibold">
                Welcome ${sessionScope.user.firstName}
            </span>

            <a href="logout" class="btn btn-sm btn-danger ms-3">
               <i class="bi bi-box-arrow-right"></i> Logout
            </a>
        </div>
    </div>
</nav>