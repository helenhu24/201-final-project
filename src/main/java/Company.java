
public class Company {

	public String id;
	
	public String name;
	
	public int numApps;
	public Company() {
		
	}
	public Company(String mid, String mname, int mnumApps) {
		id = mid;
		name = mname;
		numApps = mnumApps;
	}
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getName() {
	return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public int getNumApps() {
	return numApps;
	}
	
	public void setNumApps(int numApps) {
		this.numApps = numApps;
	}
	
}
