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
import customclasses.DBConnect;

import customclasses.AppConfig;

public class AnrDAO {

	  private int PAGE_SIZE = AppConfig.getTableSize();
	
	  public HashMap<String, Object> getAnrist1(String fyear,int pagenumber) throws SQLException {
			
			HashMap<String, Object>  anrMap = new HashMap<>();
			List<AnrDO> listAnr = new ArrayList<>();			
			
	        System.out.println("AnrDAO getAnrist called");
			Connection con = DBConnect.getConnection();
			if(con != null)
			{
				System.out.println("Database connection successful");
				CallableStatement cstmt = null;
				ResultSet rs = null;
				try {				
										
					cstmt = con.prepareCall("{call getAnrTotalCountByYear(?,?)}");
					cstmt.setString(1, fyear);
					cstmt.registerOutParameter(2, Types.INTEGER);
					cstmt.executeUpdate();
					int totalcount = cstmt.getInt(2);
					cstmt.close();
					
					System.out.println("totalcount = "+totalcount);
					int offset = 0;
					pagenumber -=1;
					
					if(pagenumber>0 && totalcount >(pagenumber*PAGE_SIZE) ) {
						offset = pagenumber*PAGE_SIZE;
					}				
					
					if(totalcount > 0) {
						
						cstmt = con.prepareCall("{call getAnrByYear(?,?,?)}");
						cstmt.setString(1, fyear);
						cstmt.setInt(2,PAGE_SIZE);
						cstmt.setInt(3,offset);
						rs = cstmt.executeQuery();
						if(rs != null)
						{
							

							while (rs.next()) {
								int anrid = rs.getInt("anrid");
								String fYear = rs.getString("fyear");
				                String filesubject = rs.getString("filesubject");
				                String filename = rs.getString("filename");
				                String filepath = "";
								/*
								 * filepath = AppConfig.getFilePath(); if(filepath.length() > 0) filepath =
								 * filepath +File.separator+ filename;
								 */

				                Date creationdate = rs.getDate("creationdate");
				                
				                AnrDO anr = new AnrDO(anrid, fYear,filesubject,filename,filepath,creationdate,totalcount);
				                listAnr.add(anr);
								/* System.out.println("anrid: "+anrid); */
							}
							anrMap.put("totalcount", Integer.valueOf(totalcount));
							anrMap.put("values", listAnr);							
						}
						
					}else {
						 System.out.println("No data found in gmanr for year = "+ fyear);
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
	         
	        return anrMap;
	    }
	  
	  
	public List<AnrDO> getAnrist(String fyear,int pagenumber) throws SQLException {
		
		List<AnrDO> listAnr = new ArrayList<>();
        System.out.println("AnrDAO getAnrist called");
		Connection con = DBConnect.getConnection();
		if(con != null)
		{
			System.out.println("Database connection successful");
			CallableStatement cstmt = null;
			ResultSet rs = null;
			try {				
				
				
				cstmt = con.prepareCall("{call getAnrTotalCountByYear(?,?)}");
				cstmt.setString(1, fyear);
				cstmt.registerOutParameter(2, Types.INTEGER);
				cstmt.executeUpdate();
				int totalcount = cstmt.getInt(2);
				cstmt.close();
				
				int offset = 0;
				pagenumber -=1;
				
				if(pagenumber>0 && totalcount >(pagenumber*PAGE_SIZE) ) {
					offset = pagenumber*PAGE_SIZE;
				}				
				
				if(totalcount > 0) {
					
					cstmt = con.prepareCall("{call getAnrByYear(?,?,?)}");
					cstmt.setString(1, fyear);
					cstmt.setInt(2,PAGE_SIZE);
					cstmt.setInt(3,offset);
					rs = cstmt.executeQuery();
					if(rs != null)
					{
						while (rs.next()) {
							int anrid = rs.getInt("anrid");
							String fYear = rs.getString("fyear");
			                String filesubject = rs.getString("filesubject");
			                String filename = rs.getString("filename");
			                String filepath = "";
							/*
							 * filepath = AppConfig.getFilePath(); if(filepath.length() > 0) filepath =
							 * filepath +File.separator+ filename;
							 */

			                Date creationdate = rs.getDate("creationdate");
			                
			                AnrDO anr = new AnrDO(anrid, fYear,filesubject,filename,filepath,creationdate,totalcount);
			                listAnr.add(anr);
							/* System.out.println("anrid: "+anrid); */
						}
						
					}
					
				}else {
					 System.out.println("No data found in gmanr for year = "+ fyear);
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
         
        return listAnr;
    }
	
	
	public List<String> getDistinctYearList() throws SQLException {
		
		List<String> listYear = new ArrayList<>();
        System.out.println("AnrDAO getDistinctYearList called");
		Connection con = DBConnect.getConnection();
		if(con != null)
		{
			System.out.println("Database connection successful");
			CallableStatement cstmt = null;
			ResultSet rs = null;
			try {				
				cstmt = con.prepareCall("{call getAllDistinctYear()}");
				rs = cstmt.executeQuery();
				if(rs != null)
				{
					while (rs.next()) {						
		                String fYear = rs.getString("fyear");		                
		                listYear.add(fYear);
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
        return listYear;
    }
	
	
public int insertNewAnr(String fYear,String fileSubject,String fileName,String filePath) throws SQLException {
        
        System.out.println("AnrDAO insertNewAnr Called"); 
		Connection con = DBConnect.getConnection();
		int anrId = -1;
		if(con != null)
		{
			System.out.println("Database connection successful");
			CallableStatement cstmt = null;			
			try {
				
				cstmt = con.prepareCall("{call insertNewAnr(?,?,?,?)}");
				cstmt.setString(1, fYear);
				cstmt.setString(2, fileSubject);
				cstmt.setString(3, fileName);				
				cstmt.registerOutParameter(4, Types.INTEGER);
				cstmt.executeUpdate();
				anrId = cstmt.getInt(4);
				 System.out.println("New Anr ID: "+anrId );				
				
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
         
        return anrId;
    }
	
}
