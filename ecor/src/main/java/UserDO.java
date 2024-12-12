import java.sql.Date;

public class UserDO {

	int userid;
	String username;
	String userpassword;
	String email;
	String mobile;
	String module;
	int level;
	int active; 	
	Date creationdate;
	Date lastupdated;
	
	public UserDO() {
		// TODO Auto-generated constructor stub
		super();
	}

	public UserDO(int userid, String username, String userpassword, String email, String mobile, String module,
			int level, int active, Date creationdate, Date lastupdated) {
		super();
		this.userid = userid;
		this.username = username;
		this.userpassword = userpassword;
		this.email = email;
		this.mobile = mobile;
		this.module = module;
		this.level = level;
		this.active = active;
		this.creationdate = creationdate;
		this.lastupdated = lastupdated;
	}
	
	
}
