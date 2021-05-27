package DeliveryVillain;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class StoreDAO {

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
    
   
    public static int addStore(Store store, String userID) {
		int updateCnt = 0;

		try {                      
			// SQL ���ǹ��� �����Ѵ�.
			String sql = "insert into store values (?, ?, ?, ?)";
			
			PreparedStatement prStmt = con.prepareStatement(sql);

			prStmt.setInt(1, store.getsno());
			prStmt.setString(2, store.getName());
			prStmt.setString(3, userID);
			prStmt.setString(4, store.getPhoneNumber());
			
			updateCnt = prStmt.executeUpdate();  		
		} catch( SQLException ex ) {

			System.err.println("\n  ??? SQL exec error in insertStore(): " + ex.getMessage() );
		}

		return updateCnt;
	}
    public static int setStoreInfo(User user, Store store){
    	loadConnect();
    	String sql = "select * from store where id = ?";
    	
    	try {
    		prstmt = con.prepareStatement(sql);
    		prstmt.setString(1, user.getID());
    		rs = prstmt.executeQuery();
    		if (rs.next()) {
    			
    			
    			store.setsno(rs.getInt(1));
    			store.setName(rs.getString(2));
    			store.setPhoneNumber(rs.getString(4));
    			
    			
    			return 0;
    		}
    		return -1;
    		
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	return -2;
    }
    
}
