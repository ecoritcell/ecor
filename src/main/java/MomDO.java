import java.sql.Date;

public class MomDO {

	int gmmomid;
	String momno;
	String momwith;
	String momdate;
	String momdetail;
	String momcompliances;
	String momfilename;
	Date creationdate;
	Date lastupdated;
	
	public MomDO() {
		// TODO Auto-generated constructor stub
		super();
	}
	
	public MomDO(int gmmomid,String momno, String momwith,String momdate,String momdetail,String momcompliances, String momfilename,Date creationDate,Date lastupdated) {
		// TODO Auto-generated constructor stub
		super();
		this.gmmomid = gmmomid;
		this.momno = momno;
		this.momwith = momwith;
		this.momdate = momdate;
		this.momdetail = momdetail;
		this.momcompliances = momcompliances;
		this.momfilename = momfilename;
		this.creationdate = creationDate;	
		this.lastupdated = lastupdated;
	}
}
