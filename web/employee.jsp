<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.User" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="dal.EmployeeDAO" %>
<%@ page import="java.util.*" %>
<%
    HttpSession sessionUser = request.getSession();
    User user = (User) sessionUser.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String keyword = request.getParameter("keyword") != null ? request.getParameter("keyword") : "";
    EmployeeDAO dao = new EmployeeDAO();
    List<User> staffList = dao.searchActiveUsersByName(keyword);
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý nhân sự</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/function.css">
</head>
<body>
<div class="d-flex" id="wrapper">
    <!-- Sidebar -->
    <div class="bg-primary" id="sidebar-wrapper">
        <div class="sidebar-heading text-center py-4 text-white fs-4 fw-bold">
            <i class="fas fa-solar-panel me-2"></i>ABC Company
        </div>
        <div class="list-group list-group-flush my-3">
            <a href="dashboard.jsp" class="sidebar-link text-white">
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

            <%-- Chỉ Leader và Manager mới được xem Quản lý nhân sự --%>
            <% if (role.equalsIgnoreCase("Leader") || role.equalsIgnoreCase("Manager")) { %>
                <a href="employee.jsp" class="sidebar-link text-white">
                    <i class="fas fa-tasks"></i>
                    <span>Quản lý nhân sự</span>
                </a>
            <% } %>

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
                <h5 class="fs-4 m-0">Quản lý nhân sự</h5>
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
            <form method="get" class="mb-3">
                <div class="input-group">
                    <input type="text" class="form-control" name="keyword" placeholder="Tìm kiếm theo tên..." value="<%= keyword %>">
                    <button class="btn btn-primary" type="submit">Tìm kiếm</button>
                </div>
            </form>

            <div class="card shadow-sm border-0">
                <div class="card-body">
                    <table class="table table-hover">
                        <thead class="table-light">
                            <tr>
                                <th>Họ tên</th>
                                <th>Username</th>
                                <th>Vai trò</th>
                                <th>Xem chi tiết</th>
                            </tr>
                        </thead>
                        <tbody>
                        <% for (User u : staffList) { %>
                            <tr>
                                <td><%= u.getFullName() %></td>
                                <td><%= u.getUsername() %></td>
                                <td><%= u.getRole() %></td>
                                <td><a href="employee-detail.jsp?userId=<%= u.getUserId() %>" class="btn btn-sm btn-outline-info">Xem đơn nghỉ</a></td>
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
