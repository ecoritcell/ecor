package customclasses;
import java.sql.Date;

public class StationDO {

	int stationid;
	String rlycode;
	String divisioncode;
	String stationcode;
	String stationdesc;
	String state;
	int statusflag;
	Date creationdate;
	Date lastupdated;
	
	public StationDO() {
		// TODO Auto-generated constructor stub
		super();
	}

	public StationDO(int stationid, String rlycode, String divisioncode, String stationcode, String stationdesc,
			String state, int statusflag, Date creationdate, Date lastupdated) {
		super();
		this.stationid = stationid;
		this.rlycode = rlycode;
		this.divisioncode = divisioncode;
		this.stationcode = stationcode;
		this.stationdesc = stationdesc;
		this.state = state;
		this.statusflag = statusflag;
		this.creationdate = creationdate;
		this.lastupdated = lastupdated;
	}

	public String getStationcode() {
		return stationcode;
	}

	public void setStationcode(String stationcode) {
		this.stationcode = stationcode;
	}

	public String getStationdesc() {
		return stationdesc;
	}

	public void setStationdesc(String stationdesc) {
		this.stationdesc = stationdesc;
	}


	
}
