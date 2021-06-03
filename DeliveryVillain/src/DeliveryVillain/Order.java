package DeliveryVillain;

import java.util.ArrayList;
import java.time.OffsetDateTime;

public class Order {
	private int sno;
	private String userID;
	private String address;
	private String order;
	private int storeNum;
	private String menus;
	private String type;
	private String date;
	private OffsetDateTime dateTime;
	
	private ArrayList<Menu> list = new ArrayList<>();
	
	public Order(String userID, String address, String order, String type, int storeNum) {
		this.userID = userID;
		this.address = address;
		this.order = order;
		this.type = type;
		this.storeNum = storeNum;
		this.dateTime = OffsetDateTime.now();
		this.date = dateTime.toString();
		
	}
	
	public Order() {
		this.order = "";
	}
	
	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getSno() {
		return sno;
	}


	public void setSno(int sno) {
		this.sno = sno;
	}


	public String getUserID() {
		return userID;
	}


	public void setUserID(String userID) {
		this.userID = userID;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getOrder() {
		return order;
	}


	public void setOrder(String order) {
		this.order = order;
	}


	public String getMenus() {
		return menus;
	}


	public void setMenus(String menus) {
		this.menus = menus;
	}


	public OffsetDateTime getDateTime() {
		return dateTime;
	}


	public void setDateTime(OffsetDateTime dateTime) {
		this.dateTime = dateTime;
	}


	public void setList(ArrayList<Menu> list) {
		this.list = list;
	}


	
	

	public ArrayList<Menu> getList() {
		return list;
	}


}
