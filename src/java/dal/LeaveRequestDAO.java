package dal;

import model.LeaveRequest;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LeaveRequestDAO {

    // Thêm đơn nghỉ phép
    public boolean insertLeaveRequest(String title, String reason, String fromDate, String toDate, int createdBy) {
        boolean success = false;

        try (Connection conn = DBConnect.getConnection()) {
            String sql = "INSERT INTO Leave_Request (title, reason, from_date, to_date, created_by) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, title);
            stmt.setString(2, reason);
            stmt.setString(3, fromDate);
            stmt.setString(4, toDate);
            stmt.setInt(5, createdBy);

            int rows = stmt.executeUpdate();
            success = rows > 0;

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return success;
    }

    // Lấy danh sách đơn nghỉ phép của 1 người dùng
    public List<LeaveRequest> getRequestsByUser(int userId) {
        List<LeaveRequest> list = new ArrayList<>();

        try (Connection conn = DBConnect.getConnection()) {
            String sql = "SELECT * FROM Leave_Request WHERE created_by = ? ORDER BY created_at DESC";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                LeaveRequest req = new LeaveRequest(
                    rs.getInt("request_id"),
                    rs.getString("title"),
                    rs.getString("reason"),
                    rs.getDate("from_date"),
                    rs.getDate("to_date"),
                    rs.getString("status"),
                    rs.getInt("created_by"),
                    rs.getInt("processed_by"),
                    rs.getString("processed_reason"),
                    rs.getTimestamp("created_at")
                );
                list.add(req);
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return list;
    }

    // (Tùy chọn) Lấy đơn của cấp dưới cho leader sau này
    public List<LeaveRequest> getRequestsBySubordinates(List<Integer> subordinateIds) {
        List<LeaveRequest> list = new ArrayList<>();

        if (subordinateIds == null || subordinateIds.isEmpty()) return list;

        try (Connection conn = DBConnect.getConnection()) {
            StringBuilder sql = new StringBuilder("SELECT * FROM Leave_Request WHERE created_by IN (");
            for (int i = 0; i < subordinateIds.size(); i++) {
                sql.append("?");
                if (i < subordinateIds.size() - 1) sql.append(",");
            }
            sql.append(") ORDER BY created_at DESC");

            PreparedStatement stmt = conn.prepareStatement(sql.toString());
            for (int i = 0; i < subordinateIds.size(); i++) {
                stmt.setInt(i + 1, subordinateIds.get(i));
            }

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                LeaveRequest req = new LeaveRequest(
                    rs.getInt("request_id"),
                    rs.getString("title"),
                    rs.getString("reason"),
                    rs.getDate("from_date"),
                    rs.getDate("to_date"),
                    rs.getString("status"),
                    rs.getInt("created_by"),
                    rs.getInt("processed_by"),
                    rs.getString("processed_reason"),
                    rs.getTimestamp("created_at")
                );
                list.add(req);
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return list;
    }
}
