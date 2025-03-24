<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Đăng nhập</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/login.css" />
    <script defer src="login.js"></script>
</head>
<body class="d-flex justify-content-center align-items-center vh-100 bg-light">
    <div class="card p-4 shadow" style="width: 350px">
        <h2 class="text-center">Đăng nhập</h2>
        <form action="login" method="post" onsubmit="return validateLogin()">
            <div class="mb-3">
                <label for="username" class="form-label">Tên đăng nhập</label>
                <input type="text" id="username" name="username" class="form-control" placeholder="Nhập tên đăng nhập" required />
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Mật khẩu</label>
                <div class="input-group">
                    <input type="password" id="password" name="password" class="form-control" placeholder="Nhập mật khẩu" required />
                </div>
            </div>
            <div class="mb-3 form-check">
                <input type="checkbox" class="form-check-input" id="rememberMe" name="rememberMe" />
                <label class="form-check-label" for="rememberMe">Ghi nhớ đăng nhập</label>
            </div>
            <button type="submit" class="btn btn-primary w-100">Đăng nhập</button>
            <p class="text-danger text-center mt-2" id="error-message">
                <% if (request.getParameter("error") != null) { %>
                    <%= request.getParameter("error").equals("invalid") ? "Sai tên đăng nhập hoặc mật khẩu!" : "Lỗi kết nối cơ sở dữ liệu!" %>
                <% } %>
            </p>
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
