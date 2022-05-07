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

/**
 * Servlet implementation class UserAdd
 */
@WebServlet("/Userremove")
public class UserRemove {
    private static final long serialVersionUID = 1L;
    
    public UserRemove() {
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	boolean notlog = true;
	    for (Cookie c : request.getCookies()){
	    	if (c.getName().compareTo("email") == 0) {
	    		notlog = false;
	    		String email = c.getValue();
//	    		need to have all companies have input form with company id
	    		String coID = request.getParameter("coID");
	    		int num = Integer.parseInt(coID);
	    		
	    		String db =Constant.URL;
	    		String user =  Constant.DBUserName;
	    		String pwd = Constant.DBPassword;
	    		String sql = "delete from bridge where companyID = ? and loginID = '?'";
	    		try(Connection conn = DriverManager.getConnection(db,user,pwd);
	    				PreparedStatement stmt = conn.prepareStatement(sql);){
	                	Class.forName("com.mysql.jdbc.Driver");
	                	stmt.setInt(1, num);
	                	stmt.setString(2, email);
	                	
	    		} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	            request.getRequestDispatcher("/Index.jsp").forward(request, response);
	            break;
	    	}
	    }
	    if(notlog) {
	    	request.setAttribute("unableAdd", "Unable to remove Company from list because user is not logged in!");
	    	request.getRequestDispatcher("/Index.jsp").forward(request, response);
	    }
    	
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }
}
