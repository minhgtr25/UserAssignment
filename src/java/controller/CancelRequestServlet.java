package controller;

import dal.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/cancel-request")
public class CancelRequestServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("requestId");

        if (idParam != null) {
            try {
                int requestId = Integer.parseInt(idParam);
                try (Connection conn = DBConnect.getConnection()) {
                    String sql = "UPDATE Leave_Request SET status = 'Cancelled' WHERE request_id = ? AND status = 'Inprogress'";
                    PreparedStatement stmt = conn.prepareStatement(sql);
                    stmt.setInt(1, requestId);
                    stmt.executeUpdate();
                }
            } catch (NumberFormatException | SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            }
        }

        response.sendRedirect("leave-list.jsp");
    }
}
