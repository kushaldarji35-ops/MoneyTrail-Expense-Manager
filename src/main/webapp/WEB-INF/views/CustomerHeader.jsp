<!-- Header -->
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
    <div class="container-fluid">

        <!-- Logo / Title -->
        <span class="navbar-brand fw-bold">
           Welcome ${sessionScope.user.firstName}
        </span>

    
            <div class="header-actions">
        <div class="user-info">
            <img src="${sessionScope.user.profilePicURL != null ? sessionScope.user.profilePicURL : 'https://cdn-icons-png.flaticon.com/512/149/149071.png'}" 
                 alt="Profile">

            <a href="logout" class="btn btn-sm btn-danger ms-3">
               <i class="bi bi-box-arrow-right"></i> Logout
            </a>
        </div>
        </div>
        </div>
    </div>
</nav>