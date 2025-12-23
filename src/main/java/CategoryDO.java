
public class CategoryDO {

	int cat_id;
	String main_category;
	String sub_category;
	int cat_order;
	int is_active;
	String creationdat;
	String lastupdated;
	public CategoryDO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CategoryDO(int cat_id, String main_category, String sub_category, int cat_order, int is_active,
			String creationdat, String lastupdated) {
		super();
		this.cat_id = cat_id;
		this.main_category = main_category;
		this.sub_category = sub_category;
		this.cat_order = cat_order;
		this.is_active = is_active;
		this.creationdat = creationdat;
		this.lastupdated = lastupdated;
	}
	
	
}
