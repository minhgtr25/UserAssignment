<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.User" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    HttpSession sessionUser = request.getSession();
    User user = (User) sessionUser.getAttribute("user");

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Tạo đơn nghỉ phép</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/function.css">
    <script src="js/request.js"></script>
</head>
<body>
<div class="d-flex" id="wrapper">
    <!-- Sidebar -->
    <div class="bg-primary" id="sidebar-wrapper">
        <div class="sidebar-heading text-center py-4 text-white fs-4 fw-bold">
            <i class="fas fa-solar-panel me-2"></i>ABC Company
        </div>
        <div class="list-group list-group-flush my-3">
            <a href="dashboard.jsp" class="sidebar-link active text-white">
                <i class="fas fa-tachometer-alt"></i>
                <span>Dashboard</span>
            </a>
            <a href="request.jsp" class="sidebar-link text-white">
                <i class="fas fa-users"></i>
                <span>Tạo đơn xin nghỉ</span>
            </a>
            <a href="leave-list.jsp" class="sidebar-link text-white">
                <i class="fas fa-chart-bar"></i>
                <span>Đơn đã tạo</span>
            </a>
            <a href="#" class="sidebar-link text-white">
                <i class="fas fa-tasks"></i>
                <span>Quản lý nhân sự</span>
            </a>
            <a href="#" class="sidebar-link text-white">
                <i class="fas fa-cog"></i>
                <span>Quản lý đơn</span>
            </a>
            <a href="logout" class="sidebar-link text-white">
                <i class="fas fa-sign-out-alt"></i>
                <span>Đăng xuất</span>
            </a>
        </div>
    </div>

    <!-- Page Content -->
    <div id="page-content-wrapper">
        <nav class="navbar navbar-expand-lg top-navbar px-4 py-2">
            <div class="d-flex align-items-center">
                <h5 class="fs-4 m-0">Tạo đơn nghỉ phép</h5>
            </div>
            <div class="ms-auto profile-dropdown">
                <div class="dropdown">
                    <button class="btn dropdown-toggle" type="button" id="profileDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                        <div class="profile-info">
                            <span class="profile-name d-none d-md-block ms-2">Xin chào, <%= user.getFullName() %></span>
                        </div>
                    </button>
                    <ul class="dropdown-menu shadow" aria-labelledby="profileDropdown">
                        <li><a class="dropdown-item" href="#"><i class="fas fa-user me-2"></i>Hồ sơ</a></li>
                        <li><a class="dropdown-item" href="#"><i class="fas fa-cog me-2"></i>Cài đặt</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="logout"><i class="fas fa-sign-out-alt me-2"></i>Đăng xuất</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container-fluid px-4 py-4">
            <div class="card shadow-sm border-0">
                <div class="card-body">
                    <form action="create-request" method="post">
                        <div class="mb-3">
                            <label for="title" class="form-label">Tiêu đề</label>
                            <input type="text" class="form-control" id="title" name="title" required>
                        </div>
                        <div class="mb-3">
                            <label for="reason" class="form-label">Lý do</label>
                            <textarea class="form-control" id="reason" name="reason" rows="4" required></textarea>
                        </div>
                        <div class="row mb-3">
                            <div class="col">
                                <label for="fromDate" class="form-label">Từ ngày</label>
                                <input type="date" class="form-control" id="fromDate" name="fromDate" required>
                            </div>
                            <div class="col">
                                <label for="toDate" class="form-label">Đến ngày</label>
                                <input type="date" class="form-control" id="toDate" name="toDate" required>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-success">Gửi yêu cầu</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>