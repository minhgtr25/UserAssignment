package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Xóa session nếu tồn tại
        HttpSession session = request.getSession(false); // false để tránh tạo session mới
        if (session != null) {
            session.invalidate();
        }

        // Chuyển về trang đăng nhập
        response.sendRedirect("login.jsp");
    }
}
