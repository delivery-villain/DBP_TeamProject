package DeliveryVillain;

public class Menu {
	
	private String name;
	private int price;
	private int count;
	private int sno;
	
	public Menu(String name, int price) {
		this.name = name;
		this.price = price;
		this.count = 1;
		this.sno = -1;
	}
	
	public Menu() {
		this.name = null;
		this.price = 0;
		this.count = 0;
		this.sno = -1;
	}
	
	
	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	

}
