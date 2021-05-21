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
	   		// 연결을 닫는다.
		   		if( stmt != null ) stmt.close();
		   		if( con != null ) con.close();
   		} catch (SQLException ex ) {};  
   	             
		    // 드라이버 로딩
		 try {
 	         Class.forName(driver);
	 
	 	} catch ( java.lang.ClassNotFoundException e ) {
	         System.err.println("** Driver loaderror in loadConnect: " + e.getMessage() );
	         e.printStackTrace();
	         
		}
		
	 	try {
	         
	         // 연결하기
	         con  = DriverManager.getConnection(URL, "root", "onlyroot");
	         
	         System.out.println("\n"+URL+"에 연결됨");
					
					 
		} catch( SQLException ex ) 
		{
	        
	         System.err.println("** connection error in loadConnect: " + ex.getMessage() );
	         ex.printStackTrace();
	 	}
    }
    
    public static void disconnect()  {
 	   try {
 		   	// 연결을 닫는다.
 		   if( stmt != null ) stmt.close();
 		   if( con != null ) con.close();
 	   	} catch (SQLException ex ) {};    
    }
 // 주어진 select 질의를 수행하여  ResultSet 반환
    public static ResultSet selectQuery(String sql) { 
 	   try {
 		   // Statement 생성 
 		   stmt = con.createStatement();
 		            
 			   
 		   rs = stmt.executeQuery(sql);  

 	   } catch( SQLException ex ) 	    {
 		   System.err.println("** SQL exec error in selectQuery() : " + ex.getMessage() );
 	   }
 			
 	   return rs;
 		
    }
    
    // 주어진 업데이트 관련 질의를 수행하여  update count 반환
    public static int updateQuery(String sql) { 
 	   int count;
 	   
 	   try {
 		   // Statement 생성 
 		   stmt = con.createStatement();
 		   count = stmt.executeUpdate(sql);  
 		   return count;

 	   } catch( SQLException ex ) 	    {
 		   System.err.println("** SQL exec error in updateQuery() : " + ex.getMessage() );
 		   return 0;
 	   }	
    }
    
    // 모든 가게정보 검색
    public static ResultSet selectAllStore() {
  	   String sql = "select * from store;";
  	   System.out.println("   >> SQL : " + sql + "\n");

  	   return selectQuery(sql);
     }
    
    // 모든 유저정보 검색
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
			// SQL 질의문을 수행한다.
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
