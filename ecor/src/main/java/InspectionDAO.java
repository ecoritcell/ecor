import java.io.File;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import customclasses.DBConnect;

import customclasses.AppConfig;

public class InspectionDAO {

	private int PAGE_SIZE = AppConfig.getTableSize();
public int insertNewInspection(String gminspno,String gminsploc,String gminspdate,String gminspnote,String gminspcompliance,String gminspfilename,String filePath) throws SQLException {
        

        System.out.println("InspectionDAO insertNewInspection Called"); 
		Connection con = DBConnect.getConnection();
		int lastRecordId = -1;
		if(con != null)
		{
			System.out.println("Database connection successful");
			CallableStatement cstmt = null;			
			try {
				
				cstmt = con.prepareCall("{call insertNewInspection(?,?,?,?,?,?,?)}");
				cstmt.setString(1, gminspno);
				cstmt.setString(2, gminsploc);
				cstmt.setString(3, gminspdate);
				cstmt.setString(4, gminspnote);
				cstmt.setString(5, gminspcompliance);
				cstmt.setString(6, gminspfilename);
				cstmt.registerOutParameter(7, Types.INTEGER);
				cstmt.executeUpdate();
				lastRecordId = cstmt.getInt(7);
				 System.out.println("New Record ID: "+lastRecordId );				
				
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

public HashMap<String,Object> getAllInspection(int pagenumber) throws SQLException {
	
	HashMap<String, Object>  myHashMap = new HashMap<>();
	List<InspectionDO> totalList = new ArrayList<>();
    System.out.println("InspectionDO getAllInspection called");
	Connection con = DBConnect.getConnection();
	if(con != null)
	{
		System.out.println("Database connection successful");
		CallableStatement cstmt = null;
		ResultSet rs = null;
		try {				
			
			cstmt = con.prepareCall("{call getGmInspectionTotalCount(?)}");			
			cstmt.registerOutParameter(1, Types.INTEGER);
			cstmt.executeUpdate();
			int totalcount = cstmt.getInt(1);
			cstmt.close();

			int offset = 0;
			pagenumber -=1;
			
			if(pagenumber>0 && totalcount >(pagenumber*PAGE_SIZE) ) {
				offset = pagenumber*PAGE_SIZE;
			}	
			
			
			if(totalcount > 0) {
				
				cstmt = con.prepareCall("{call getAllGmInspection(?,?)}");
				cstmt.setInt(1,PAGE_SIZE);
				cstmt.setInt(2,offset);
				rs = cstmt.executeQuery();
				if(rs != null)
				{
					while (rs.next()) {
						int gminspid = rs.getInt("gminspid");
						String gminspno = rs.getString("gminspno");
		                String gminsploc = rs.getString("gminsploc");
		                String gminspdate = rs.getString("gminspdate");
		                String gminspnote = rs.getString("gminspnote");
		                String gminspcompliance = rs.getString("gminspcompliance");
		                String gminspfilename = rs.getString("gminspfilename");
		                Date creationdate = rs.getDate("creationdate");
		                
		                InspectionDO inspdo = new InspectionDO(gminspid, gminspno,gminsploc,gminspdate,gminspnote,gminspcompliance,gminspfilename,creationdate,null);
		                totalList.add(inspdo);
		                System.out.println("gminspid: "+gminspid);
					}
					
					myHashMap.put("totalcount", Integer.valueOf(totalcount));
					myHashMap.put("values", totalList);	
					
				}
				
			}else {
				 System.out.println("No data found in gminspection.");
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
