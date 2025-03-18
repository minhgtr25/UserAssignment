package model;

public class User {
    private int userID;
    private String fullName;
    private String email;

    public User(int userID, String fullName, String email) {
        this.userID = userID;
        this.fullName = fullName;
        this.email = email;
    }

    public int getUserID() {
        return userID;
    }

    public String getFullName() {
        return fullName;
    }

    public String getEmail() {
        return email;
    }
}
