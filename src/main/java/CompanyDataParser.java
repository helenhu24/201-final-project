package main.java;
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
						bus.setName(rs.getString("restaurant_name"));
						bus.setId(rs.getString("restaurant_id"));
						System.out.println("name set in rdp");
					
					}
					
					//return bus;
			} catch(SQLException ex) {
					System.out.println("SQLException: " + ex.getMessage() + " in getCompanyName");
			}
		
		sql = "{CALL GetCompanyDetails(?)}";
		try(Connection conn = DriverManager.getConnection(db,user,pwd);
					CallableStatement stmt4 = conn.prepareCall(sql);){
					stmt4.setString(1, id);
						
						ResultSet rs4 = stmt4.executeQuery();
						if(!rs4.next()) {
							bus = null;
						}
						else {
				
							bus.setImageUrl(rs4.getString("image_url"));
							List<String> disp = new ArrayList<String>();
							String address = rs4.getString("address");
							System.out.println("address:  " + address);
							//disp.add(rs.getString("address"));
							disp.add(address);
							Location loc = new Location();
							loc.setDisplayAddress(disp);
							bus.setLocation(loc);
							bus.setPhone(rs4.getString("phone_no"));
							bus.setPrice(rs4.getString("estimated_price"));
							bus.setUrl(rs4.getString("yelp_url"));
							
						
						}
						
						//return bus;
				} catch(SQLException ex) {
						System.out.println("SQLException: " + ex.getMessage() + " in getCompanyDetails");
				}
		
		sql = "{CALL GetCompanyCategory(?)}";
		try(Connection conn = DriverManager.getConnection(db,user,pwd);
					CallableStatement stmt5 = conn.prepareCall(sql);){
					stmt5.setString(1, id);
					List<Category> cats = new ArrayList<Category>();
						
						ResultSet rs5 = stmt5.executeQuery();
						if(!rs5.next()) {
							bus = null;
						}
						else {
							while(rs5.next()) {
								Category cat = new Category();
								cat.setTitle(rs5.getString("category_name"));
								cats.add(cat);
								bus.setCategories(cats);
					
							}
						}
						
						//return bus;
				} catch(SQLException ex) {
						System.out.println("SQLException: " + ex.getMessage() + " in getCompanyCategory");
				}
		
		sql = "{CALL GetCompanyReview(?)}";
		try(Connection conn = DriverManager.getConnection(db,user,pwd);
					CallableStatement stmt6 = conn.prepareCall(sql);){
					stmt6.setString(1, id);
						
						ResultSet rs6 = stmt6.executeQuery();
						if(!rs6.next()) {
							bus = null;
						}
						else {
							bus.setReviewCount(rs6.getInt("review_count"));
							bus.setRating(rs6.getFloat("rating"));
						}
						
						//return bus;
				} catch(SQLException ex) {
						System.out.println("SQLException: " + ex.getMessage() + " in getCompanyReview");
				}
		
		
        
        //TODO return Company based on id
		System.out.println("Company returned");
		System.out.println(bus.getName());
        return bus;
        
    }

    /**
     * @param keyWord    the search keyword
     * @param sort       the sort option (price, review count, rating)
     * @param searchType search in category or name
     * @return the list of Company matching the criteria
     */
    public static ArrayList<Company> getCompanies(String keyWord, String sort, String searchType) {
        ArrayList<Company> Companies = new ArrayList<Company>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
        	System.out.print("ClassNotFound in getCompanies");
            e.printStackTrace();
        }
        
        System.out.println(keyWord);
        System.out.println(sort);
        System.out.println(searchType);
        
		String db ="jdbc:mysql://localhost:3306/CS201PA2_Users";
		String user =  Constant.DBUserName;
		String pwd = Constant.DBPassword;
		String sql = "";
		
		if(sort.equals("Review_Count")) {
			if(searchType.equals("name")) {
				sql= "{CALL nameByReviewCount(?)}";
			} else if(searchType.equals("category")) {
				sql= "{CALL categoryByReviewCount(?)}";
			}
		}
		else if(sort.equals("Rating")) {
			if(searchType.equals("name")) {
				sql= "{CALL nameByRating(?)}";
			} else if(searchType.equals("category")) {
				sql= "{CALL categoryByRating(?)}";
			}
		}
		else if(sort.equals("Price")) {
			if(searchType.equals("name")) {
				sql= "{CALL nameByPrice(?)}";
			} else if(searchType.equals("category")) {
				sql= "{CALL categoryByPrice(?)}";
			}
			
		}else {
			System.out.println("else in getCompanies");
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
						Companies.add(getCompany(rs.getString("restaurant_id")));
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