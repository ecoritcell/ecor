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
import customclasses.DBConnect;
public class UserDAO {

public List<UserDO> getUserDetails(String username, String password, String modulename) throws SQLException {
	
    System.out.println("UserDO getUserDetails called");
	List<UserDO> totalList = new ArrayList<>();

    if(username.length()>0 && password.length() > 0) {
    	Connection con = DBConnect.getConnection();
    	if(con != null)
    	{
    		System.out.println("Database connection successful");
    		CallableStatement cstmt = null;
    		ResultSet rs = null;
    		try {				
    			cstmt = con.prepareCall("{call getUserDetails(?,?,?)}");
    			cstmt.setString(1, username);
    			cstmt.setString(2, password);
    			cstmt.setString(3, modulename);
    			rs = cstmt.executeQuery();
    			if(rs != null)
    			{
    				while (rs.next()) {
    					int userid = rs.getInt("userid");
    					String usrname = rs.getString("username");
    	                String module = rs.getString("module");
    	                int level = rs.getInt("level");
    	                int active = rs.getInt("active");
    	                UserDO userdo = new UserDO(userid, usrname,"","","",module,level,active,null,null);
    	                totalList.add(userdo);
    	                System.out.println("userid: "+userid);
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
    	

    }
    
		  
     
    return totalList;
}

}
