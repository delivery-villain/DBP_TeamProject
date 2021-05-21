package DeliveryVillain;

import java.sql.*;

public class UserDAO {
	
	private static Connection con = null;
	private static PreparedStatement prstmt = null;
	private static Statement stmt         = null;
	private static ResultSet rs = null;
	
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
    
    public static int login(String userID, String userPassword){
    	String sql = "select password from User where id = ?";
    	try {
    		prstmt = con.prepareStatement(sql);
    		prstmt.setString(1, userID);
    		rs = prstmt.executeQuery();
    		if (rs.next()) {
    			if(rs.getString(1).equals(userPassword)) {
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
