
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.lang.reflect.Type;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;

import javax.servlet.annotation.WebServlet;

/**
 * A class that pretends to be the Yelp API
 */

public class CompanyDataParser {
    private static Boolean ready = false;

    /**
     * Initializes the DB with json data 
     *
     * @param responseString the Yelp json string
     */
  
    public static Company getCompany(String id) {
        try {
            Class.forName("com.mysql.jdbc.Driver");

        } catch (ClassNotFoundException e) {
        	System.out.print("ClassNotFound in getCompany");
            e.printStackTrace();
        }
        
		String db =Constant.URL;
		String user =  Constant.DBUserName;
		String pwd = Constant.DBPassword;
		String sql = "{CALL GetCompanyName(?)}";
		Company bus = new Company();
		
		try(Connection conn = DriverManager.getConnection(db,user,pwd);
				CallableStatement stmt = conn.prepareCall(sql);){
				stmt.setString(1, id);
					
					ResultSet rs = stmt.executeQuery();
					if(!rs.next()) {
						bus = null;
						System.out.println("Company null");
					}
					else {
						//bus = new Company();
						bus.setName(rs.getString("companyName"));
						bus.setId(rs.getString("companyID"));
					
					}
					
					//return bus;
			} catch(SQLException ex) {
					System.out.println("SQLException: " + ex.getMessage() + " in getCompanyName");
			}
		
//MODIFY THIS TO GET NUMBER OF APPS AT EACH STAGE	
		sql = "{CALL GetNumApps(?)}"; 
		try(Connection conn = DriverManager.getConnection(db,user,pwd);
					CallableStatement stmt4 = conn.prepareCall(sql);){
					stmt4.setString(1, id);
						
						ResultSet rs4 = stmt4.executeQuery();
						if(!rs4.next()) {
							bus = null;
						}
						else {
				
							bus.setNumApps(rs4.getInt("numApps"));	
						
						}
						
						//return bus;
				} catch(SQLException ex) {
						System.out.println("SQLException: " + ex.getMessage() + " in getNumApps");
				}
		
		
		
        
        //TODO return Company based on id
		System.out.println(bus.getName());
        return bus;
        
    }

    /**
     * @param keyWord    the search keyword
     * @param sort       the sort option (price, review count, rating)
     * @param searchType search in category or name
     * @return the list of Company matching the criteria
     */
    public static ArrayList<Company> getCompanies(String keyWord, String sort, String page) {
    	
  //MODIFY TO ACCOUNT FOR COMPANIES IN PROGRESS
    	
        ArrayList<Company> Companies = new ArrayList<Company>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
        	System.out.print("ClassNotFound in getCompanies");
            e.printStackTrace();
        }
        
        System.out.println(keyWord);
        System.out.println(sort);
        
		String db =Constant.URL;
		String user =  Constant.DBUserName;
		String pwd = Constant.DBPassword;
		String sql = "{CALL GetCompanyName(?)}";
		
		if(page.equals("All")) {
			if(sort.equals("numApps")) {
				sql = "{CALL AllByNumApps(?)}";
			}
			else if(sort.equals("alphabetical")) {
				sql = "{CALL AllByAlphabetical(?)}";
			}
			else {
				sql = "{CALL AllByNumApps(?)}";
			}
		}
		else if(page.equals("inProgress")) {
			if(sort.equals("numApps")) {
				sql = "{CALL InPByNumApps(?)}";
			}
			else if(sort.equals("alphabetical")) {
				sql = "{CALL InPByAlphabetical(?)}";
			}
			else {
				sql = "{CALL InPByNumApps(?)}";
			}
		}
		
		try(Connection conn = DriverManager.getConnection(db,user,pwd);
				CallableStatement stmt = conn.prepareCall(sql);){
					if(keyWord==null) {
						System.out.println("keyWord null");
					}
					System.out.println("keyWord: "+ keyWord);
					stmt.setString(1, keyWord);
					
					ResultSet rs = stmt.executeQuery();
					while(rs.next()) {
						Companies.add(getCompany(rs.getString("companyID")));
					}
			} catch(SQLException ex) {
					System.out.println("SQLException: " + ex.getMessage() + " in getCompanies");
			}
		
        //TODO get list of Company based on the param
        return Companies;

    }
}

//Code adapted from https://stackoverflow.com/questions/23070298/get-nested-json-object-with-gson-using-retrofit
/*class CompanyDeserializer implements JsonDeserializer<CompanyHelper> {
    @Override
    public CompanyHelper deserialize(JsonElement je, Type type, JsonDeserializationContext jdc) throws JsonParseException {
        JsonElement content = je.getAsJsonObject();
        return new Gson().fromJson(content, CompanyHelper.class);
    }
}*/
