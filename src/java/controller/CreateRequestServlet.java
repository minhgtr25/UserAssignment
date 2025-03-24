package controller;

import dal.LeaveRequestDAO;
import model.User;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/create-request")
public class CreateRequestServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String title = request.getParameter("title");
        String reason = request.getParameter("reason");
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        LeaveRequestDAO dao = new LeaveRequestDAO();
        boolean inserted = dao.insertLeaveRequest(title, reason, fromDate, toDate, user.getUserId());

        if (inserted) {
            response.sendRedirect("request.jsp?success=true");
        } else {
            response.sendRedirect("request.jsp?error=sql");
        }
    }
}
