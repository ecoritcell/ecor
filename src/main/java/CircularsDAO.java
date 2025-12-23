import java.io.File;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import customclasses.AppConfig;
import customclasses.DBConnect;

public class CircularsDAO {

	private int PAGE_SIZE = AppConfig.getTableSize();
	public int insertNewCircular(String cat_id,String ltr_date,String ltr_no,String ltr_subject,String filename,String filePath) throws SQLException {
	        

			int lastRecordId = -1;
	        System.out.println("CircularsDAO insertNewCircular Called"); 
			Connection con = DBConnect.getConnection();
			if(con != null)
			{
				System.out.println("Database connection successful");
				CallableStatement cstmt = null;			
				try {
					
					int category = -1;
					if(cat_id.length() >0)
						category = Integer.parseInt(cat_id);
					if(category != -1) {
						cstmt = con.prepareCall("{call insertNewCircular(?,?,?,?,?,?)}");
						cstmt.setInt(1, category);
						cstmt.setString(2, ltr_date);
						cstmt.setString(3, ltr_no);
						cstmt.setString(4, ltr_subject);
						cstmt.setString(5, filename);
						cstmt.registerOutParameter(6, Types.INTEGER);
						cstmt.executeUpdate();
						
						lastRecordId = cstmt.getInt(6);
						System.out.println("New Record ID: "+lastRecordId );
						
					}else {
						
						System.out.println("Invalid category");
					}
					
								
					
				}catch (SQLException e){
					
					if(filePath.length() > 0) {
						  File file = new File(filePath) ;
							// check if the file  present or not
							if( file.exists()) {
								file.delete() ;
								System.out.println("File Deleted");
							}
					  }
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
	         
	        return lastRecordId;
	    }

	public HashMap<String, Object> getCircularsByCategory(int cat_id,int pagenumber) throws SQLException {
		
		HashMap<String, Object>  myHashMap = new HashMap<>();
		List<CircularsDO> totalList = new ArrayList<>();
	    System.out.println("CircularsDAO getCircularsByCategory called");
		Connection con = DBConnect.getConnection();
		if(con != null)
		{
			System.out.println("Database connection successful");
			CallableStatement cstmt = null;
			ResultSet rs = null;
			try {				
				
				pagenumber -=1;
				int offset =  pagenumber*PAGE_SIZE;;
				
				cstmt = con.prepareCall("{call getCircularsByCategory(?,?,?)}");
				cstmt.setInt(1, cat_id);
				cstmt.setInt(2,PAGE_SIZE);
				cstmt.setInt(3,offset);
				rs = cstmt.executeQuery();
				if(rs != null)
				{
					int totalcount = -1;
					while (rs.next()) {
						
						if(totalcount == -1)
							totalcount = rs.getInt("total_count");
						
						int record_id = rs.getInt("record_id");
						int category_id = rs.getInt("category_id");
		                String cat_name = rs.getString("category_name");
		                String ltr_no = rs.getString("letter_no");
		                String subject = rs.getString("letter_subject");
		                String ltr_date = rs.getString("letter_date");
		                String filename = rs.getString("file_name");
		                
		                CircularsDO circ_do = new CircularsDO(record_id, category_id,cat_name,
		                		ltr_no,subject,ltr_date,filename,null,null);
		                totalList.add(circ_do);
					}
					
					myHashMap.put("totalcount", Integer.valueOf(totalcount));
					myHashMap.put("values", totalList);	
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
