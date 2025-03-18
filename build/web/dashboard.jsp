<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.User" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    HttpSession sessionUser = request.getSession();
    User user = (User) sessionUser.getAttribute("user");

    if (user == null) {
        response.sendRedirect("login");
        return;
    }
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/dashboard.css">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>
<body>
    <div class="d-flex" id="wrapper">
        <!-- Sidebar -->
        <div class="bg-primary text-white" id="sidebar-wrapper">
            <div class="sidebar-heading text-center py-4 primary-text fs-4 fw-bold border-bottom">Admin Panel</div>
            <div class="list-group list-group-flush my-3">
                <a href="#" class="list-group-item list-group-item-action bg-transparent text-white fw-bold">Dashboard</a>
                <a href="#" class="list-group-item list-group-item-action bg-transparent text-white fw-bold">Users</a>
                <a href="#" class="list-group-item list-group-item-action bg-transparent text-white fw-bold">Reports</a>
                <a href="#" class="list-group-item list-group-item-action bg-transparent text-white fw-bold">Settings</a>
                <a href="LogoutServlet" class="list-group-item list-group-item-action bg-transparent text-white fw-bold">Logout</a>
            </div>
        </div>
        <!-- Page Content -->
        <div id="page-content-wrapper" class="w-100">
            <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm px-4">
                <h2 class="fs-4 m-0">Dashboard</h2>
            </nav>
            <div class="container-fluid px-4 mt-4">
                <div class="row">
                    <div class="col-md-12">
                        <h4 class="text-center">Welcome, <%= user.getFullName() %>!</h4>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>