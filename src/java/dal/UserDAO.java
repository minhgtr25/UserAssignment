package dal;

import model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {

    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;
        Connection conn = null;
        try {
            conn = DBConnect.getConnection();
            String sql = "SELECT * FROM Users WHERE Email = ? AND Password = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                user = new User(rs.getInt("UserID"), rs.getString("FullName"), rs.getString("Email"));
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) try { conn.close(); } catch (SQLException ignored) {}
        }
        return user;
    }
}
