import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;


import customclasses.DBConnect;

public class CategoryDAO {
	
public HashMap<String, ArrayList<CategoryDO>> getAllCategory() throws SQLException {
		
		HashMap<String, ArrayList<CategoryDO>>  myHashMap = new HashMap<>();

	    System.out.println("CategoryDAO getAllCategory called");
		Connection con = DBConnect.getConnection();
		if(con != null)
		{
			System.out.println("Database connection successful");
			CallableStatement cstmt = null;
			ResultSet rs = null;
			try {				
				
				cstmt = con.prepareCall("{call getAllCategory()}");
				rs = cstmt.executeQuery();
				if(rs != null)
				{
					
					
					while (rs.next()) {
												
						int cat_id = rs.getInt("cat_id");
						String main_category = rs.getString("main_category");
		                String sub_category = rs.getString("sub_category");
		                CategoryDO cat_do = new CategoryDO(cat_id, main_category,sub_category,
		                		1,1,null,null);
		                myHashMap.computeIfAbsent(main_category, k -> new ArrayList<CategoryDO>()).add(cat_do);
					}
					
				}
								
				
			}catch (SQLException e){
				
				System.out.println("Error in preparedstatement");
				e.printStackTrace();
			}
			finally {
				
				try { if (rs != null) rs.close(); } catch (Exception e) {};
			    try { if (cstmt != null) cstmt.close(); } catch (Exception e) {};				
			}
		}
		else {
			System.out.println("error in database connection");
		}		  
	     
	    return myHashMap;
	}

}
