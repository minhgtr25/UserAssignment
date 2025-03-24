<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.User" %>
<%@ page import="model.LeaveRequest" %>
<%@ page import="dal.EmployeeDAO" %>
<%@ page import="dal.EmployeeListDAO" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="java.util.*" %>
<%
    HttpSession sessionUser = request.getSession();
    User currentUser = (User) sessionUser.getAttribute("user");
    if (currentUser == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int userId = Integer.parseInt(request.getParameter("userId"));
    EmployeeDAO employeeDAO = new EmployeeDAO();
    EmployeeListDAO requestDAO = new EmployeeListDAO();

    User targetUser = employeeDAO.getUserById(userId);
    List<LeaveRequest> requests = requestDAO.getRequestsByUserId(userId);
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chi tiết nhân sự</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/function.css">
</head>
<body>
<div class="d-flex" id="wrapper">
    <!-- Sidebar giống dashboard -->
    <div class="bg-primary" id="sidebar-wrapper">
        <div class="sidebar-heading text-center py-4 text-white fs-4 fw-bold">
            ABC Company
        </div>
        <div class="list-group list-group-flush my-3">
            <a href="dashboard.jsp" class="sidebar-link text-white">Dashboard</a>
            <a href="request.jsp" class="sidebar-link text-white">Tạo đơn xin nghỉ</a>
            <a href="leave-list.jsp" class="sidebar-link text-white">Đơn đã tạo</a>
            <a href="employee.jsp" class="sidebar-link active text-white">Quản lý nhân sự</a>
            <a href="#" class="sidebar-link text-white">Quản lý đơn</a>
            <a href="logout" class="sidebar-link text-white">Đăng xuất</a>
        </div>
    </div>

    <!-- Page Content -->
    <div id="page-content-wrapper">
        <nav class="navbar navbar-expand-lg top-navbar px-4 py-2">
            <div class="d-flex align-items-center">
                <h5 class="fs-4 m-0">Thông tin nhân sự</h5>
            </div>
            <div class="ms-auto profile-dropdown">
                <div class="dropdown">
                    <button class="btn dropdown-toggle" type="button" id="profileDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                        <div class="profile-info">
                            <span class="profile-name d-none d-md-block ms-2">Xin chào, <%= currentUser.getFullName() %></span>
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
            <div class="card mb-4">
                <div class="card-body">
                    <h5 class="card-title"><%= targetUser.getFullName() %></h5>
                    <p class="card-text mb-1"><strong>Username:</strong> <%= targetUser.getUsername() %></p>
                    <p class="card-text"><strong>Vai trò:</strong> <%= targetUser.getRole() %></p>
                </div>
            </div>

            <div class="card">
                <div class="card-header">Danh sách đơn nghỉ</div>
                <div class="card-body">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Tiêu đề</th>
                                <th>Từ ngày</th>
                                <th>Đến ngày</th>
                                <th>Trạng thái</th>
                            </tr>
                        </thead>
                        <tbody>
                        <% for (LeaveRequest r : requests) { %>
                            <tr>
                                <td><%= r.getTitle() %></td>
                                <td><%= r.getFromDate() %></td>
                                <td><%= r.getToDate() %></td>
                                <td><%= r.getStatus() %></td>
                            </tr>
                        <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
