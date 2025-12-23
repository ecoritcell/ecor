import java.util.Date;

public class CircularsDO {

	
	int record_id;
	int category_id;
	String category_name;
	String letter_no;
	String letter_subject;
	String letter_date;
	String file_name;
	Date creationdate;
	Date lastupdated;
	public CircularsDO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CircularsDO(int record_id, int category_id, String category_name, String letter_no,
			String letter_subject, String letter_date, String file_name, Date creationdate, Date lastupdated) {
		super();
		this.record_id = record_id;
		this.category_id = category_id;
		this.category_name = category_name;
		this.letter_no = letter_no;
		this.letter_subject = letter_subject;
		this.letter_date = letter_date;
		this.file_name = file_name;
		this.creationdate = creationdate;
		this.lastupdated = lastupdated;
	}
	
	
}
