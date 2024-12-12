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

public class JpoDAO {

	private int PAGE_SIZE = AppConfig.getTableSize();
public int insertNewJpo(String jposlno,String department,String deptid,String jposubject,String filename,String filePath) throws SQLException {
        

        System.out.println("JpoDAO insertNewJpo Called"); 
		Connection con = DBConnect.getConnection();
		int lastRecordId = -1;
		if(con != null)
		{
			System.out.println("Database connection successful");
			CallableStatement cstmt = null;			
			try {
				
				int departmentid = -1;
				if(deptid.length() >0)
					departmentid = Integer.parseInt(deptid);
				
				cstmt = con.prepareCall("{call insertNewJpo(?,?,?,?,?,?)}");
				cstmt.setString(1, jposlno);
				cstmt.setString(2, department);
				cstmt.setInt(3, departmentid);
				cstmt.setString(4, jposubject);
				cstmt.setString(5, filename);
				cstmt.registerOutParameter(6, Types.INTEGER);
				cstmt.executeUpdate();
				lastRecordId = cstmt.getInt(6);
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

public HashMap<String, Object> getJpoByDepartment(String deptid,int pagenumber) throws SQLException {
	
	HashMap<String, Object>  myHashMap = new HashMap<>();
	List<JpoDO> totalList = new ArrayList<>();
    System.out.println("JpoDAO getJpoByDepartment called");
	Connection con = DBConnect.getConnection();
	if(con != null)
	{
		System.out.println("Database connection successful");
		CallableStatement cstmt = null;
		ResultSet rs = null;
		try {				
			
			int departmentid = -1;
			if(deptid.length() >0)
				departmentid = Integer.parseInt(deptid);					

			cstmt = con.prepareCall("{call getJpoTotalcountByDepartment(?,?)}");			
			cstmt.setInt(1, departmentid);
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
				
				cstmt = con.prepareCall("{call getAllJpoByDepartment(?,?,?)}");
				cstmt.setInt(1, departmentid);
				cstmt.setInt(2,PAGE_SIZE);
				cstmt.setInt(3,offset);
				rs = cstmt.executeQuery();
				if(rs != null)
				{
					while (rs.next()) {
						int jpoid = rs.getInt("jpoid");
						String jposlno = rs.getString("jposlno");
		                String department = rs.getString("department");
		                int deptId = rs.getInt("departmentid");
		                String jposubject = rs.getString("jposubject");
		                String filename = rs.getString("filename");
		                Date creationdate = rs.getDate("creationdate");
		                
		                JpoDO jpodo = new JpoDO(jpoid, jposlno,department,deptId,jposubject,filename,creationdate,null);
		                totalList.add(jpodo);
		                System.out.println("jpoid: "+jpoid);
					}
					
					myHashMap.put("totalcount", Integer.valueOf(totalcount));
					myHashMap.put("values", totalList);	
				}
			}else {
				
				System.out.println("No data found in jpo.");
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
