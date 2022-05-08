import java.util.ArrayList;

public class Company {

	public String id;
	
	public String name;
	
	public int numApps;
	
	ArrayList<String> stages;
	
	public int progress;
	
	public Company(String companyID, String companyName, int numApps, ArrayList<String> stages) {
		// TODO Auto-generated constructor stub
		this.id = companyID;
		this.name = name;
		this.numApps = numApps;
		this.stages = stages;
	}
	
	public Company(String companyID, String companyName, int numApps, ArrayList<String> stages, int prog) {
		// TODO Auto-generated constructor stub
		this.id = companyID;
		this.name = name;
		this.numApps = numApps;
		this.stages = stages;
		this.progress = prog;
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
	
	public ArrayList<String> getStages() {
		return stages;
	}
	
	public int getProgress() {
	return progress;
	}
	
	public void setProgress(int progress) {
		this.progress = progress;
	}
	
}
