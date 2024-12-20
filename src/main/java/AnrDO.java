import java.sql.Date;

public class AnrDO {

	int anrId;
	int slNo;
	String fYear;
	String fileSubject;
	String fileName;
	String filePath;
	Date creationDate;
	int totalCount;
	
	public AnrDO() {
		// TODO Auto-generated constructor stub
		super();
	}
	
	public AnrDO(int anrId,String fYear, String fileSubject, String fileName, String filePath,Date creationDate,int totalCount) {
		// TODO Auto-generated constructor stub
		super();
		this.anrId = anrId;
		this.fYear = fYear;
		this.fileSubject = fileSubject;
		this.fileName = fileName;
		this.filePath = filePath;
		this.creationDate = creationDate;		
		this.totalCount = totalCount;
	}

	
}
