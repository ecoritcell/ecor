package customclasses;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.text.SimpleDateFormat;

public class OqaUpdateDAO {
	
	  public String getLastUpdatedDate() throws SQLException {
						
	        System.out.println("OqaUpdateDAO getLastUpdatedDate called");
	        String lastUpdatedDateString = "";
			Connection con = DBConnect.getConnection();
			if(con != null)
			{
				System.out.println("Database connection successful");
				CallableStatement cstmt = null;
				ResultSet rs = null;
				try {
					
					cstmt = con.prepareCall("{call getOqaLastUpdatedDate()}");
					rs = cstmt.executeQuery();
					if(rs != null)
					{
						while (rs.next()) {

			               // Date updatedDate = rs.getDate("lastUpdatedDate");
							 String updatedDate = rs.getString("lastUpdatedDate");
			                if(updatedDate !=null) {
			                	
			                	try {
									
									 SimpleDateFormat fromDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
									 SimpleDateFormat toDateFormat = new SimpleDateFormat("dd-MM-yyyy");
									 String reformattedStr = toDateFormat.format(fromDateFormat.parse(updatedDate));
									 lastUpdatedDateString = reformattedStr;
									 
								} catch (Exception e) {
									// TODO: handle exception
									System.out.println("Error in formatting date");
									System.out.println(e.toString());
								}
			                }
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
	         
	        return lastUpdatedDateString;
	    }
	  
	  
	
public String updateOqaLastUpdatedItem(String item) throws SQLException {
        
        System.out.println("OqaUpdateDAO updateOqaLastUpdatedItem Called"); 
		Connection con = DBConnect.getConnection();
		String lastUpdatedDate = "";
		if(con != null)
		{
			System.out.println("Database connection successful");
			CallableStatement cstmt = null;			
			try {
				
				cstmt = con.prepareCall("{call updateLastUpdatedItem(?,?)}");
				cstmt.setString(1, item);
				cstmt.registerOutParameter(2, Types.VARCHAR);
				cstmt.executeUpdate();								
				lastUpdatedDate = cstmt.getString(2);
				
			}catch (SQLException e){
				
				System.out.println("Error in preparedstatement");
				e.printStackTrace();
			}
			finally {
				
			    try { if (cstmt != null) cstmt.close(); } catch (Exception e) {};				
			}
		}
		else {
			System.out.println("error in database connection");
		}		  
         
        return lastUpdatedDate;
    }
	
}
