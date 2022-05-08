import java.util.ArrayList;

public class Company {

	public String id;
	
	public String name;
	
	public int numApps;
	
	ArrayList<String> stages;
	
	public Company(String companyID, String companyName, int numApps) {
		// TODO Auto-generated constructor stub
		this.id = companyID;
		this.name = name;
		this.numApps = numApps;
	}

	public Company() {
		// TODO Auto-generated constructor stub
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
