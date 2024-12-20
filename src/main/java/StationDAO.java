import java.io.File;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import customclasses.StationDO;
import customclasses.DBConnect;
public class StationDAO {


public List<StationDO> getStationByDivisioncode(String divcode) throws SQLException {
	
	List<StationDO> totalList = new ArrayList<>();
    System.out.println("StationDAO getStationByDivisioncode called");
	Connection con = DBConnect.getConnection();
	if(con != null)
	{
		System.out.println("Database connection successful");
		CallableStatement cstmt = null;
		ResultSet rs = null;
		try {		
			if(divcode == null)
				divcode = "";
			cstmt = con.prepareCall("{call getStationbyDivisioncode(?)}");
			cstmt.setString(1, divcode);
			rs = cstmt.executeQuery();
			if(rs != null)
			{
				while (rs.next()) {
					int stnid = rs.getInt("STATIONID");
					String stncode = rs.getString("STATIONCODE");
	                String stndesc = rs.getString("STATIONDESC");

	                StationDO stndo = new StationDO(stnid,null,divcode, stncode,stndesc,null,1,null,null);
	                totalList.add(stndo);
					/* System.out.println("stnid: "+stnid); */
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
     
    return totalList;
}

}
