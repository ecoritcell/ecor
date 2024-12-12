import java.sql.Date;

public class JpoDO {

	int jpoid;
	String jposlno;
	String department;
	int departmentid;
	String jposubject;
	String filename;
	Date creationdate;
	Date lastupdated;
	
	public JpoDO() {
		// TODO Auto-generated constructor stub
		super();
	}

	public JpoDO(int jpoid, String jposlno, String department,int departmentid, String jposubject,String filename, Date creationdate, Date lastupdated) {
		super();
		this.jpoid = jpoid;
		this.jposlno = jposlno;
		this.department = department;
		this.departmentid = departmentid;
		this.jposubject = jposubject;
		this.filename = filename;
		this.creationdate = creationdate;
		this.lastupdated = lastupdated;
	}
	
	
}
