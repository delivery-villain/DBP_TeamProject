package DeliveryVillain;

import java.sql.*;

public class UserDAO {
	
	private static Connection con = null;
	private static PreparedStatement prstmt = null;
	private static PreparedStatement prstmt2 = null;
	private static Statement stmt         = null;
	private static ResultSet rs = null;
	private static ResultSet rs2 = null;
	
	static String driver= "com.mysql.jdbc.Driver";
    static String URL = "jdbc:mysql://localhost:3306/DeliveryVillain?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
    
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
    
    public static int login(User user){
    	loadConnect();
    	String sql = "select password from User where id = ?";
    	String sql2 = "select userType from User where id = ?";
    	try {
    		prstmt = con.prepareStatement(sql);
    		prstmt.setString(1, user.getID());
    		prstmt2 = con.prepareStatement(sql2);
    		prstmt2.setString(1, user.getID());
    		rs2 = prstmt2.executeQuery();
    		rs = prstmt.executeQuery();
    		if (rs.next()) {
    			if(rs.getString(1).equals(user.getPassword())) {
    				if (rs2.next()) {
    					user.setUserType(rs2.getBoolean(1));
    				}
    				return 1;
    			}
    			else
    				return 0;
    		}
    		return -1;
    		
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	return -2;
    }
	

}
