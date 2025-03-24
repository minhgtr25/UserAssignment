package model;

public class User {
    private int userId;
    private String fullName;
    private String username;
    private String password;
    private String role;
    private Integer managerId; // Có thể null nếu là leader

    // Constructor đầy đủ (dùng khi login)
    public User(int userId, String fullName, String username, String password, String role, Integer managerId) {
        this.userId = userId;
        this.fullName = fullName;
        this.username = username;
        this.password = password;
        this.role = role;
        this.managerId = managerId;
    }

    // Getter và Setter
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public Integer getManagerId() {
        return managerId;
    }

    public void setManagerId(Integer managerId) {
        this.managerId = managerId;
    }
    
    public User(int userId, String fullName, String username, String role) {
    this.userId = userId;
    this.fullName = fullName;
    this.username = username;
    this.role = role;
}

}
