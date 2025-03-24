package controller;

import dal.UserDAO;
import model.User;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Lấy dữ liệu từ form
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Gọi DAO để kiểm tra thông tin người dùng
        UserDAO userDAO = new UserDAO();
        User user = userDAO.getUserByUsernameAndPassword(username, password);

        // Nếu thông tin đúng → tạo session
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            // Tùy theo vai trò, có thể redirect về từng trang riêng
            response.sendRedirect("dashboard"); // trang chính sau khi đăng nhập
        } else {
            // Nếu sai → redirect lại login.jsp với lỗi
            response.sendRedirect("login.jsp?error=invalid");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}
