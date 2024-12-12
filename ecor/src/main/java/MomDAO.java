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

public class MomDAO {

	private int PAGE_SIZE = AppConfig.getTableSize();
public int insertNewMom(String momno,String momwith,String momdate,String momdetail,String momcompliances,String momfilename,String filePath) throws SQLException {
        

        System.out.println("MomDAO insertNewMom Called"); 
		Connection con = DBConnect.getConnection();
		int lastRecordId = -1;
		if(con != null)
		{
			System.out.println("Database connection successful");
			CallableStatement cstmt = null;			
			try {
				
				cstmt = con.prepareCall("{call insertNewMom(?,?,?,?,?,?,?)}");
				cstmt.setString(1, momno);
				cstmt.setString(2, momwith);
				cstmt.setString(3, momdate);
				cstmt.setString(4, momdetail);
				cstmt.setString(5, momcompliances);
				cstmt.setString(6, momfilename);
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

public HashMap<String,Object> getAllMom(int pagenumber) throws SQLException {
	
	HashMap<String, Object>  myHashMap = new HashMap<>();
	List<MomDO> totalList = new ArrayList<>();
    System.out.println("MomDO getAllMom called");
	Connection con = DBConnect.getConnection();
	if(con != null)
	{
		System.out.println("Database connection successful");
		CallableStatement cstmt = null;
		ResultSet rs = null;
		try {
			
			cstmt = con.prepareCall("{call getGmMomTotalCount(?)}");			
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
				
				cstmt = con.prepareCall("{call getAllMom(?,?)}");
				cstmt.setInt(1,PAGE_SIZE);
				cstmt.setInt(2,offset);
				rs = cstmt.executeQuery();
				if(rs != null)
				{
					while (rs.next()) {
						int gmmomid = rs.getInt("gmmomid");
						String momno = rs.getString("momno");
		                String momwith = rs.getString("momwith");
		                String momdate = rs.getString("momdate");
		                String momdetail = rs.getString("momdetail");
		                String momcompliances = rs.getString("momcompliances");
		                String momfilename = rs.getString("momfilename");
		                Date creationdate = rs.getDate("creationdate");
		                
		                MomDO momdo = new MomDO(gmmomid, momno,momwith,momdate,momdetail,momcompliances,momfilename,creationdate,null);
		                totalList.add(momdo);
		                System.out.println("gmmomid: "+gmmomid);
					}
					
					myHashMap.put("totalcount", Integer.valueOf(totalcount));
					myHashMap.put("values", totalList);		
				}
			}else {
				 System.out.println("No data found in mom.");
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
