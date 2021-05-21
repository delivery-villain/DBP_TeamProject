package DeliveryVillain;

public class User {
	
	private String name;
	private String ID;
	private String password;
	private String phoneNumber;
	private boolean userType;

	public User(String name, String userID,  String password, String phoneNumber, boolean userType) {
		this.name = name;
		this.ID =userID;
		this.password = password;
		this.phoneNumber = phoneNumber;
		this.userType = userType;
	}
	public User(String userID, String password) {
		this.name = null;
		this.ID =userID;
		this.password = password;
		this.phoneNumber = null;
	}
	
	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public boolean isUserType() {
		return userType;
	}
	public void setUserType(boolean userType) {
		this.userType = userType;
	}
	
	
}


