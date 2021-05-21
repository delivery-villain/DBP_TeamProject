package DeliveryVillain;
 
import java.sql.*;

public class DB {
	
	static  Connection con         = null;
    static  Statement stmt         = null;
    static  ResultSet rs           = null ;
    
    static String driver= "com.mysql.jdbc.Driver";
    static String URL = "jdbc:mysql://localhost:3306/DeliveryVillain";
    
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
    
    // �־��� ������Ʈ ���� ���Ǹ� �����Ͽ�  update count ��ȯ
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
    
    // ��� �������� �˻�
    public static ResultSet selectAllStore() {
  	   String sql = "select * from store;";
  	   System.out.println("   >> SQL : " + sql + "\n");

  	   return selectQuery(sql);
     }
    
    // ��� �������� �˻�
    public static ResultSet selectAllUser() {
  	   String sql = "select * from User;";
  	   System.out.println("   >> SQL : " + sql + "\n");

  	   return selectQuery(sql);
     }
    
    public static int signIn(String userName, String userID, String userPassword, String userPhoneNumber, boolean userType ) {
    	String sql = "insert into User values ("+ userName +", " + userID + ", " + userPassword + ", " + userPhoneNumber +", "+ userType + ")";
    	updateQuery(sql);
    	return 0;	
    }
    public static int signIn2(String userName, String userID, String userPassword, String userPhoneNumber, boolean userType ) {
    	String sql = "insert into User values (?, ?, ?, ?, ?)";
    	loadConnect();
    	
    
    	return 0;	
    }
    
    public static int insertUser(User user) {
		int updateCnt = 0;

		try {                      
			// SQL ���ǹ��� �����Ѵ�.
			String sql = "insert into User values (?, ?, ?, ?, ?)";
			
			PreparedStatement prStmt = con.prepareStatement(sql);

			prStmt.setString(1, user.getName());
			prStmt.setString(2, user.getID());
			prStmt.setString(3, user.getPassword());
			prStmt.setString(4, user.getPhoneNumber());
			prStmt.setBoolean(5, user.isUserType());
			
			updateCnt = prStmt.executeUpdate();  		
		} catch( SQLException ex ) {

			System.err.println("\n  ??? SQL exec error in insertBanker(): " + ex.getMessage() );
		}

		return updateCnt;
	}
    
    
    
    
    
}
