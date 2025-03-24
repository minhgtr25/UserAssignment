package dal;

import model.LeaveRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class EmployeeListDAO {

    public List<LeaveRequest> getRequestsByUserId(int userId) {
        List<LeaveRequest> list = new ArrayList<>();
        String sql = "SELECT * FROM LeaveRequests WHERE user_id = ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                LeaveRequest req = new LeaveRequest();
                req.setRequestId(rs.getInt("request_id"));
                req.setCreatedBy(rs.getInt("user_id"));
                req.setTitle(rs.getString("title"));
                req.setReason(rs.getString("reason"));
                req.setFromDate(rs.getDate("from_date"));
                req.setToDate(rs.getDate("to_date"));
                req.setStatus(rs.getString("status"));
                list.add(req);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
} 
