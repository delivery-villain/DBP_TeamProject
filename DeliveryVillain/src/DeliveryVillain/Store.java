package DeliveryVillain;

public class Store {
	private int sno;
	private String sphonenumber;
	private String sname;
	
	public String getPhoneNumber() {
		return this.sphonenumber;
	}
	
	public void setPhoneNumber(String phoneNumber) {
		this.sphonenumber = phoneNumber;
	}
	
	public String getName() {
		return this.sname;
	}
	
	public void setName(String name) {
		this.sname = name;
	}
	
	public int getsno() {
		return this.sno;
	}
	
	public void setsno(int sno) {
		this.sno = sno;
	}

}
