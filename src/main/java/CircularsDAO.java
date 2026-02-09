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
import java.util.Map;

import customclasses.AppConfig;
import customclasses.DBConnect;

public class CircularsDAO {

	private int PAGE_SIZE = AppConfig.getTableSize();
	public int insertNewCircular(String cat_group, String cat_id,String ltr_date,String ltr_no,String ltr_subject,String filename,String filePath) throws SQLException {
	        

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
						cstmt = con.prepareCall("{call insertNewCircular(?,?,?,?,?,?,?)}");
						cstmt.setString(1, cat_group);
						cstmt.setInt(2, category);
						cstmt.setString(3, ltr_date);
						cstmt.setString(4, ltr_no);
						cstmt.setString(5, ltr_subject);
						cstmt.setString(6, filename);
						cstmt.registerOutParameter(7, Types.INTEGER);
						cstmt.executeUpdate();
						
						lastRecordId = cstmt.getInt(7);
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
	
	public int updateCircular(String record_id, String cat_id,String ltr_date,String ltr_no,String ltr_subject,String filename) throws SQLException {
	        

			int lastRecordId = -1;
	        System.out.println("CircularsDAO updateCircular Called"); 
			Connection con = DBConnect.getConnection();
			if(con != null)
			{
				System.out.println("Database connection successful");
				CallableStatement cstmt = null;			
				try {
					
					int recordid = -1;
					if(record_id.length() >0)
						recordid = Integer.parseInt(record_id);
					
					int category = -1;
					if(cat_id.length() >0)
						category = Integer.parseInt(cat_id);
					if(recordid !=-1 && category != -1) {
						cstmt = con.prepareCall("{call updateCircular(?,?,?,?,?,?,?)}");
						cstmt.setInt(1, recordid);
						cstmt.setInt(2, category);
						cstmt.setString(3, ltr_date);
						cstmt.setString(4, ltr_no);
						cstmt.setString(5, ltr_subject);
						cstmt.setString(6, filename);
						cstmt.registerOutParameter(7, Types.INTEGER);
						cstmt.executeUpdate();
						
						lastRecordId = cstmt.getInt(7);
						System.out.println("Updated Record ID: "+lastRecordId );
						
					}else {
						
						System.out.println("Invalid record id = "+record_id +"or category id = "+category);
					}
					
								
					
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
	         
	        return lastRecordId;
	}
	
	public Map<String, String> deleteCircular(String record_id) throws SQLException {
        
		Map<String, String> valuesMap = new HashMap<>();
		valuesMap.put("deleted_record_id", "-1");
		valuesMap.put("deleted_file_name", "");
				
        System.out.println("CircularsDAO deleteCircular Called"); 
		Connection con = DBConnect.getConnection();
		if(con != null)
		{
			System.out.println("Database connection successful");
			CallableStatement cstmt = null;			
			try {
				
				int recordid = -1;
				if(record_id.length() >0)
					recordid = Integer.parseInt(record_id);
				
				if(recordid !=-1) {
					cstmt = con.prepareCall("{call deleteCircular(?,?,?)}");
					cstmt.setInt(1, recordid);					
					cstmt.registerOutParameter(2, Types.INTEGER);
					cstmt.registerOutParameter(3, Types.VARCHAR);
					cstmt.executeUpdate();					
					int lastRecordId = cstmt.getInt(2);
					String filename = cstmt.getString(3);
					
					valuesMap.put("deleted_record_id", Integer.toString(lastRecordId));
					valuesMap.put("deleted_file_name", filename);
					
					System.out.println("Deleted Record ID: "+lastRecordId );
					
				}else {
					
					System.out.println("Invalid record id = "+record_id);
				}				
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
         
        return valuesMap;
	}
	
	public HashMap<String, Object> getCircularsByCategory(int cat_id,int pagenumber, String cat_group) throws SQLException {
		
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
				
				cstmt = con.prepareCall("{call getCircularsByCategory(?,?,?,?)}");
				cstmt.setString(1, cat_group);
				cstmt.setInt(2, cat_id);
				cstmt.setInt(3,PAGE_SIZE);
				cstmt.setInt(4,offset);
				rs = cstmt.executeQuery();
				if(rs != null)
				{
					int totalcount = -1;
					while (rs.next()) {
						
						if(totalcount == -1)
							totalcount = rs.getInt("total_count");
						
						int record_id = rs.getInt("record_id");
						String category_group = rs.getString("category_group");
						int category_id = rs.getInt("category_id");
		                String cat_name = rs.getString("category_name");
		                String ltr_no = rs.getString("letter_no");
		                String subject = rs.getString("letter_subject");
		                String ltr_date = rs.getString("letter_date");
		                String formatted_date = rs.getString("formatted_date");
		                String filename = rs.getString("file_name");
		                
		                		                
		                CircularsDO circ_do = new CircularsDO(record_id,category_group, category_id,cat_name,
		                		ltr_no,subject,ltr_date,formatted_date,filename,null,null);
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
