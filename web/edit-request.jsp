<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.User" %>
<%@ page import="model.LeaveRequest" %>
<%@ page import="dal.LeaveRequestDAO" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.Date" %>
<%
    HttpSession sessionUser = request.getSession();
    User user = (User) sessionUser.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String requestIdStr = request.getParameter("requestId");
    int requestId = Integer.parseInt(requestIdStr);
    LeaveRequestDAO dao = new LeaveRequestDAO();
    LeaveRequest leave = dao.getRequestByIdAndUser(requestId, user.getUserId());

    if (leave == null || !"Inprogress".equals(leave.getStatus())) {
        response.sendRedirect("leave-list.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Chỉnh sửa đơn nghỉ</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/function.css">
</head>
<body>
<div class="container py-5">
    <div class="card shadow-sm">
        <div class="card-header bg-primary text-white">
            <h5 class="mb-0">Chỉnh sửa đơn nghỉ phép</h5>
        </div>
        <div class="card-body">
            <form action="update-request" method="post">
                <input type="hidden" name="requestId" value="<%= leave.getRequestId() %>" />
                <div class="mb-3">
                    <label class="form-label">Tiêu đề</label>
                    <input type="text" name="title" class="form-control" value="<%= leave.getTitle() %>" required />
                </div>
                <div class="mb-3">
                    <label class="form-label">Lý do</label>
                    <textarea name="reason" class="form-control" rows="4" required><%= leave.getReason() %></textarea>
                </div>
                <div class="row mb-3">
                    <div class="col">
                        <label class="form-label">Từ ngày</label>
                        <input type="date" name="fromDate" class="form-control" value="<%= leave.getFromDate() %>" required />
                    </div>
                    <div class="col">
                        <label class="form-label">Đến ngày</label>
                        <input type="date" name="toDate" class="form-control" value="<%= leave.getToDate() %>" required />
                    </div>
                </div>
                <button type="submit" class="btn btn-success">Cập nhật</button>
                <a href="leave-list.jsp" class="btn btn-secondary ms-2">Hủy</a>
            </form>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
