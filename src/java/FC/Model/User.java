package FC.Model;

/**
 * User model representing the user entity.
 */
public class User {
    private int userId;        // Unique ID for the user
    private String firstName;  // User's first name
    private String lastName;   // User's last name
    private String email;      // User's email address
    private String gender;     // User's gender
    private String nicNumber;  // User's NIC number
    private String password;   // User's encrypted password
    private String phone;      // User's phone number
    private String address;    // User's address
    private String userRole;   // Role of the user (e.g., admin, customer)
    private String createdAt;  // Timestamp of when the account was created
    private String updatedAt;  // Timestamp of the last update

    // Default constructor
    public User() {
    }

    // Parameterized constructor
    public User(int userId, String firstName, String lastName, String email, String gender, String nicNumber, String password, String phone, String address, String userRole, String createdAt, String updatedAt) {
        this.userId = userId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.gender = gender;
        this.nicNumber = nicNumber;
        this.password = password;
        this.phone = phone;
        this.address = address;
        this.userRole = userRole;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getNicNumber() {
        return nicNumber;
    }

    public void setNicNumber(String nicNumber) {
        this.nicNumber = nicNumber;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getUserRole() {
        return userRole;
    }

    public void setUserRole(String userRole) {
        this.userRole = userRole;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public String getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(String updatedAt) {
        this.updatedAt = updatedAt;
    }
}
