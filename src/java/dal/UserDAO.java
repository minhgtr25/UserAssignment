package dal;

import model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {

    public User getUserByUsernameAndPassword(String username, String password) {
        User user = null;
        Connection conn = null;

        try {
            conn = DBConnect.getConnection();
            String sql = "SELECT * FROM [User] WHERE username = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Xử lý trường hợp manager_id có thể null
                Integer managerId = rs.getObject("manager_id") != null ? rs.getInt("manager_id") : null;

                user = new User(
                    rs.getInt("user_id"),
                    rs.getString("full_name"),
                    rs.getString("username"),
                    rs.getString("password"),
                    rs.getString("role"),
                    managerId
                );
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) try { conn.close(); } catch (SQLException ignored) {}
        }

        return user;
    }
}
