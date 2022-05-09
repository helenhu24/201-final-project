package main.java;



import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
//import java.io.Serial;
import java.util.Scanner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
@SpringBootApplication
@RestController

/**
 * Servlet implementation class UserAdd
 */
public class UserAdd extends HttpServlet{
    private static final long serialVersionUID = 1L;
    
    public UserAdd() {
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	boolean notlog = true;
	    for (Cookie c : request.getCookies()){
	    	if (c.getName().compareTo("loginID") == 0) {
	    		notlog = false;
	    		String email = c.getValue();
//	    		need to have all companies have input form with company i
	    		String coID = request.getParameter("companyID");
	    		int num = Integer.parseInt(coID);
	    		
	    		String db =Constant.URL;
	    		String user =  Constant.DBUserName;
	    		String pwd = Constant.DBPassword;
	    		String sql = "Insert into bridge values(?,?,1)";
	    		try(Connection conn = DriverManager.getConnection(db,user,pwd);
	    				PreparedStatement stmt = conn.prepareStatement(sql);){
	                	Class.forName("com.mysql.jdbc.Driver");
	                	stmt.setString(1, email);
	                	stmt.setInt(2, num);
	                	stmt.executeUpdate();
	                	String sql2 = "Select people from stages where companyID = ? and stepnum = 1";
	                	PreparedStatement st = conn.prepareStatement(sql2);
	                	st.setInt(1, num);
	                	ResultSet rs = st.executeQuery();
	                	rs.next();
	                	int people = rs.getInt("people");
	                	people+=1;
	                	String sqlupdate = "Update stages set people = ? where companyID = ? and stepnum = 1";
	                	PreparedStatement st2 = conn.prepareStatement(sql2);
	                	st2.setInt(1, people);
	                	st2.setInt(2, num);
	                	st2.executeUpdate();
	    		} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	            request.getRequestDispatcher("/SearchAll").forward(request, response);
	            break;
	    	}
	    }
	    if(notlog) {
	    	request.setAttribute("unableAdd", "Unable to add Company to list because user is not logged in!");
	    	request.getRequestDispatcher("/AllCompanies.jsp").forward(request, response);
	    }
    	
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }
}
