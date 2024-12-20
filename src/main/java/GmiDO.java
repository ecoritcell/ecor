import java.sql.Date;

public class GmiDO {

	int gminsid;
	String slno;
	String instruction;
	String filename;
	Date creationdate;
	Date lastupdated;
	
	public GmiDO() {
		// TODO Auto-generated constructor stub
		super();
	}
	
	public GmiDO(int gminsid,String slno, String instruction, String fileName,Date creationDate,Date lastupdated) {
		// TODO Auto-generated constructor stub
		super();
		this.gminsid = gminsid;
		this.slno = slno;
		this.instruction = instruction;
		this.filename = fileName;
		this.creationdate = creationDate;	
		this.lastupdated = lastupdated;
	}
}
