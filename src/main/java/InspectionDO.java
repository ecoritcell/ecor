import java.sql.Date;

public class InspectionDO {

	int gminspid;
	String gminspno;
	String gminsploc;
	String gminspdate;
	String gminspnote;
	String gminspcompliance;
	String gminspfilename;
	Date creationdate;
	Date lastupdated;
	
	public InspectionDO() {
		// TODO Auto-generated constructor stub
		super();
	}

	public InspectionDO(int gminspid, String gminspno, String gminsploc, String gminspdate, String gminspnote,
			String gminspcompliance, String gminspfilename, Date creationdate, Date lastupdated) {
		super();
		this.gminspid = gminspid;
		this.gminspno = gminspno;
		this.gminsploc = gminsploc;
		this.gminspdate = gminspdate;
		this.gminspnote = gminspnote;
		this.gminspcompliance = gminspcompliance;
		this.gminspfilename = gminspfilename;
		this.creationdate = creationdate;
		this.lastupdated = lastupdated;
	}
	
	
}
