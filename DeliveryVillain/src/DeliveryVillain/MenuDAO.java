package DeliveryVillain;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;


public class MenuDAO {
	private static Connection con = null;
	private static PreparedStatement prstmt = null;
	private static Statement stmt         = null;
	private static ResultSet rs = null;
	
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
    
    
    public static int addMenu(Menu menu, int sno) {
		int updateCnt = 0;

		try {                      
			// SQL 질의문을 수행한다.
			String sql = "insert into menu values (?, ?, ?)";
			
			PreparedStatement prStmt = con.prepareStatement(sql);

			prStmt.setString(1, menu.getName());
			prStmt.setInt(2, menu.getPrice());
			prStmt.setInt(3, sno);
			
			updateCnt = prStmt.executeUpdate();  		
		} catch( SQLException ex ) {

			System.err.println("\n  ??? SQL exec error in insertMenu(): " + ex.getMessage() );
		}

		return updateCnt;
	}
    
    public static Menu getMenu(int sno) {
		try {                      
			// SQL 질의문을 수행한다.
			String sql = "select * from menu where sno = ?" ;
			
			PreparedStatement prStmt = con.prepareStatement(sql);

			prStmt.setInt(1, sno);

			ResultSet rs = prStmt.executeQuery();  
			if (rs.next())  { 
				Menu menu = getMenuFromRS(rs);
				return menu;
			}			
		} catch( SQLException ex ) {             
			System.err.println("\n  ??? SQL exec error in getBanker(): " + ex.getMessage() );
		}

		return null;
	}
	
	  
	public static Vector<Menu> getAllMenus()  {
		Vector<Menu> menus = new Vector<Menu>();

		Menu menu;

		ResultSet rs = getAllMenusRS();

		try {
			while (rs.next())  {
				menu = getMenuFromRS(rs);
				menus.addElement(menu);
			}
		} catch( SQLException ex ) 	    {
			System.err.println("** SQL exec error in getAllAccounts() : " + ex.getMessage() );
		}	
		
		return menus;	
	}
	
	public static Vector<Menu> getAllMenus(int sno)  {
		Vector<Menu> menus = new Vector<Menu>();

		Menu menu;

		ResultSet rs = getAllMenusRS(sno);

		try {
			while (rs.next())  {
				menu = getMenuFromRS(rs);
				menus.addElement(menu);
			}
		} catch( SQLException ex ) 	    {
			System.err.println("** SQL exec error in getAllAccounts() : " + ex.getMessage() );
		}	
		
		return menus;	
	}
	
	public static ResultSet getAllMenusRS() {
		try {                      
			// SQL 질의문을 수행한다.
			String sql = "select * from menu" ;

			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);  

			return rs;
			
		} catch( SQLException ex ) {             
			System.err.println("\n  ??? SQL exec error in getAllMenuRS(): " + ex.getMessage() );
		}

		return null;
	}
	
	public static ResultSet getAllMenusRS(int sno) {
		try {                      
			loadConnect();
			// SQL 질의문을 수행한다.
			String sql = "select * from menu where sno = ?" ;
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
	
    
    public static Menu getMenuFromRS(ResultSet rs) {  
    	Menu menu = new Menu();

		try {
			if (rs.getRow() ==  0)
				return null;
			
			menu.setName(rs.getString("name"));   // ResultSet의 애트리뷰트 값을 get하여 필드의 값으로 저장 
			menu.setPrice( rs.getInt("price") );
			menu.setSno( rs.getInt("sno") );
		} catch( SQLException ex ) 	    {
			System.err.println("\n  ??? SQL exec error in getMenuFromRS(): " + ex.getMessage() );
		}

		return menu;
	}
	     
	public static Vector<Menu> getMenusFromRS(ResultSet rs) {  
		Vector<Menu> menus = new Vector<Menu>();
		
		Menu menu = new Menu();

		try {
			while(rs.next()) {
				menu = getMenuFromRS(rs);
			
				if (menu != null)
					menus.add(menu);
			}	
		} catch( SQLException ex ) 	    {
			System.err.println("\n  ??? SQL exec error in getMenusFromRS(): " + ex.getMessage() );
		}

		return menus;
	}
    
}
