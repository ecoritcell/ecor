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

public class GmiDAO {

	private int PAGE_SIZE = AppConfig.getTableSize();
public int insertNewGmi(String slno,String instruction,String filename,String filePath) throws SQLException {
        
        System.out.println("AnrDAO insertNewGmi Called"); 
		Connection con = DBConnect.getConnection();
		int lastRecordId = -1;
		if(con != null)
		{
			System.out.println("Database connection successful");
			CallableStatement cstmt = null;			
			try {
				
				cstmt = con.prepareCall("{call insertNewGmInstruction(?,?,?,?)}");
				cstmt.setString(1, slno);
				cstmt.setString(2, instruction);
				cstmt.setString(3, filename);				
				cstmt.registerOutParameter(4, Types.INTEGER);
				cstmt.executeUpdate();
				lastRecordId = cstmt.getInt(4);
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

public HashMap<String,Object> getAllGmi(int pagenumber) throws SQLException {
	
	HashMap<String, Object>  myHashMap = new HashMap<>();
	List<GmiDO> totalList = new ArrayList<>();
    System.out.println("AnrDAO getAllGmi called");
	Connection con = DBConnect.getConnection();
	if(con != null)
	{
		System.out.println("Database connection successful");
		CallableStatement cstmt = null;
		ResultSet rs = null;
		try {				
			
			
			cstmt = con.prepareCall("{call getGmInstructionTotalCount(?)}");			
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
				
				cstmt = con.prepareCall("{call getAllGMInstruction(?,?)}");
				cstmt.setInt(1,PAGE_SIZE);
				cstmt.setInt(2,offset);
				rs = cstmt.executeQuery();
				if(rs != null)
				{
					while (rs.next()) {
						int gminsid = rs.getInt("gminsid");
						String slno = rs.getString("slno");
		                String instruction = rs.getString("instruction");
		                String filename = rs.getString("filename");
		                Date creationdate = rs.getDate("creationdate");
		                
		                GmiDO gmido = new GmiDO(gminsid, slno,instruction,filename,creationdate,null);
		                totalList.add(gmido);
						/* System.out.println("gminsid: "+gminsid); */
					}
					myHashMap.put("totalcount", Integer.valueOf(totalcount));
					myHashMap.put("values", totalList);							
					
				}
				
			}else {
				
				 System.out.println("No data found in gmi.");
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
