package DeliveryVillain;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;
import java.time.OffsetDateTime;

public class OrderDAO {
	private static Connection con = null;
	private static PreparedStatement prstmt = null;
	private static Statement stmt         = null;
	private static ResultSet rs = null;
	
	static String driver= "com.mysql.jdbc.Driver";
    static String URL = "jdbc:mysql://localhost:3306/DeliveryVillain?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";

    
    public static void loadConnect()  {
	   		try {
	   		// ������ �ݴ´�.
		   		if( stmt != null ) stmt.close();
		   		if( con != null ) con.close();
   		} catch (SQLException ex ) {};  
   	             
		    // ����̹� �ε�
		 try {
 	         Class.forName(driver);
	 
	 	} catch ( java.lang.ClassNotFoundException e ) {
	         System.err.println("** Driver loaderror in loadConnect: " + e.getMessage() );
	         e.printStackTrace();
	         
		}
		
	 	try {
	         
	         // �����ϱ�
	         con  = DriverManager.getConnection(URL, "root", "onlyroot");
	         
	         System.out.println("\n"+URL+"�� �����");
					
					 
		} catch( SQLException ex ) 
		{
	        
	         System.err.println("** connection error in loadConnect: " + ex.getMessage() );
	         ex.printStackTrace();
	 	}
    }
    
    public static int updateQuery(String sql) { 
  	   int count;
  	   
  	   try {
  		   // Statement ���� 
  		   stmt = con.createStatement();
  		   count = stmt.executeUpdate(sql);  
  		   return count;

  	   } catch( SQLException ex ) 	    {
  		   System.err.println("** SQL exec error in updateQuery() : " + ex.getMessage() );
  		   return 0;
  	   }	
     }
    
    public static void disconnect()  {
 	   try {
 		   	// ������ �ݴ´�.
 		   if( stmt != null ) stmt.close();
 		   if( con != null ) con.close();
 	   	} catch (SQLException ex ) {};    
    }
 // �־��� select ���Ǹ� �����Ͽ�  ResultSet ��ȯ
    public static ResultSet selectQuery(String sql) { 
 	   try {
 		   // Statement ���� 
 		   stmt = con.createStatement();
 		            
 			   
 		   rs = stmt.executeQuery(sql);  

 	   } catch( SQLException ex ) 	    {
 		   System.err.println("** SQL exec error in selectQuery() : " + ex.getMessage() );
 	   }
 			
 	   return rs;
 		
    }
    
    
    public static int addOrder(Order order, int sno) {
		int updateCnt = 0;

		try {                      
			// SQL ���ǹ��� �����Ѵ�.
			String sql = "insert into cart (userID, address, orders, store, menu, stype, date)" + " values (?, ?, ?, ?, ?, ?, ?)";
			
			PreparedStatement prStmt = con.prepareStatement(sql);

			
			prStmt.setString(1, order.getUserID());
			prStmt.setString(2, order.getAddress());
			prStmt.setString(3, order.getOrder());
			prStmt.setInt(4, sno);
			prStmt.setString(5, order.getMenus());
			prStmt.setString(6, order.getType());
			prStmt.setString(7, order.getDateTime().toString());
			
			
			updateCnt = prStmt.executeUpdate();  		
		} catch( SQLException ex ) {

			System.err.println("\n  ??? SQL exec error in insertOrder(): " + ex.getMessage() );
		}

		return updateCnt;
	}
    
    
    public static Order getOrder(int sno) {
		try {                      
			// SQL ���ǹ��� �����Ѵ�.
			String sql = "select * from cart where store = ?" ;
			
			PreparedStatement prStmt = con.prepareStatement(sql);

			prStmt.setInt(1, sno);

			ResultSet rs = prStmt.executeQuery();  
			if (rs.next())  { 
				Order order = getOrderFromRS(rs);
				return order;
			}			
		} catch( SQLException ex ) {             
			System.err.println("\n  ??? SQL exec error in getStore(): " + ex.getMessage() );
		}

		return null;
	}
	
	  
	public static Vector<Order> getAllOrders()  {
		Vector<Order> orders = new Vector<Order>();

		Order order;

		ResultSet rs = getAllOrdersRS();

		try {
			while (rs.next())  {
				order = getOrderFromRS(rs);
				orders.addElement(order);
			}
		} catch( SQLException ex ) 	    {
			System.err.println("** SQL exec error in getAllStores() : " + ex.getMessage() );
		}	
		
		return orders;	
	}
	
	public static Vector<Order> getAllOrders(int sno)  {
		Vector<Order> orders = new Vector<Order>();

		Order order;

		ResultSet rs = getAllOrdersRS(sno);

		try {
			while (rs.next())  {
				order = getOrderFromRS(rs);
				orders.addElement(order);
			}
		} catch( SQLException ex ) 	    {
			System.err.println("** SQL exec error in getAllStores() : " + ex.getMessage() );
		}	
		
		return orders;	
	}
	
	public static ResultSet getAllOrdersRS(int sno) {
		try {                      
			// SQL ���ǹ��� �����Ѵ�.
			String sql ="select * from cart where store = ?" ;

			PreparedStatement prStmt = null;
			prStmt = con.prepareStatement(sql);
			prStmt.setInt(1, sno);

			ResultSet rs = prStmt.executeQuery(); 

			return rs;
			
		} catch( SQLException ex ) {             
			System.err.println("\n  ??? SQL exec error in getAllMenuRS(): " + ex.getMessage() );
		}

		return null;
	}
	
	
	
	public static ResultSet getAllOrdersRS() {
		try {                      
			// SQL ���ǹ��� �����Ѵ�.
			String sql = "select * from cart" ;

			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);  

			return rs;
			
		} catch( SQLException ex ) {             
			System.err.println("\n  ??? SQL exec error in getAllMenuRS(): " + ex.getMessage() );
		}

		return null;
	}
	
    
    public static Order getOrderFromRS(ResultSet rs) {  
    	Order order = new Order();

		try {
			if (rs.getRow() ==  0)
				return null;
			
			order.setSno(rs.getInt("id"));
			order.setUserID(rs.getString("userID"));// ResultSet�� ��Ʈ����Ʈ ���� get�Ͽ� �ʵ��� ������ ���� 
			order.setAddress(rs.getString("address"));
			order.setOrder(rs.getString("orders"));
			order.setSno(rs.getInt("store"));// ResultSet�� ��Ʈ����Ʈ ���� get�Ͽ� �ʵ��� ������ ���� 
			order.setMenus(rs.getString("menu"));
			order.setType(rs.getString("stype"));
			order.setDate(rs.getString("date"));
			
			
		} catch( SQLException ex ) 	    {
			System.err.println("\n  ??? SQL exec error in getStoreFromRS(): " + ex.getMessage() );
		}

		return order;
	}
	     
	public static Vector<Order> getMenusFromRS(ResultSet rs) {  
		Vector<Order> stores = new Vector<Order>();
		
		Order order = new Order();

		try {
			while(rs.next()) {
				order = getOrderFromRS(rs);
			
				if (order != null)
					stores.add(order);
			}	
		} catch( SQLException ex ) 	    {
			System.err.println("\n  ??? SQL exec error in getMenusFromRS(): " + ex.getMessage() );
		}

		return stores;
	}
    
}
