package controller;

import dal.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import model.User;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Date;

@WebServlet("/update-request")
public class UpdateRequestServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            int requestId = Integer.parseInt(request.getParameter("requestId"));
            String title = request.getParameter("title");
            String reason = request.getParameter("reason");
            Date fromDate = Date.valueOf(request.getParameter("fromDate"));
            Date toDate = Date.valueOf(request.getParameter("toDate"));

            try (Connection conn = DBConnect.getConnection()) {
                String sql = "UPDATE Leave_Request SET title = ?, reason = ?, from_date = ?, to_date = ? WHERE request_id = ? AND created_by = ? AND status = 'Inprogress'";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, title);
                stmt.setString(2, reason);
                stmt.setDate(3, fromDate);
                stmt.setDate(4, toDate);
                stmt.setInt(5, requestId);
                stmt.setInt(6, user.getUserId());
                stmt.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("leave-list.jsp");
    }
}
