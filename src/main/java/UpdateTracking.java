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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
//import java.io.Serial;
import java.util.Scanner;



@WebServlet("/UpdateTracking")
public class UpdateTracking extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public UpdateTracking() {
    }
    public String temp = "";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String loginID = "";
	    for (Cookie c : request.getCookies()){
	    	if (c.getName().compareTo("loginID") == 0) {
	    		loginID = c.getValue();
	    	}
	    }
	    // Get company and status ID
//	    System.out.println(request.getParameter("companyID"));
//	    System.out.println(request.getParameter("status"));
	    int id = Integer.parseInt(request.getParameter("companyID"));
	    int stage = Integer.parseInt(request.getParameter("status"));
	    // Update status
	    String db = Constant.URL;
		String user =  Constant.DBUserName;
		String pwd = Constant.DBPassword;
		
		String sql = "select progress from bridge WHERE companyID = ? AND loginID = ?";
		try(Connection conn = DriverManager.getConnection(db,user,pwd);
				PreparedStatement stmt = conn.prepareStatement(sql);){
            	Class.forName("com.mysql.jdbc.Driver");
            	stmt.setInt(1, id);
            	stmt.setString(2, loginID);
            	ResultSet res = stmt.executeQuery();
            	res.next();
            	int oldstage = res.getInt("progress");
            	
        		String q = "UPDATE bridge SET progress = ? WHERE companyID = ? AND loginID = ?";
				PreparedStatement stmt2 = conn.prepareStatement(q);
	            stmt2.setInt(1, stage);
	           	stmt2.setInt(2, id);
	           	stmt2.setString(3, loginID);
	           	stmt2.executeUpdate();
	           	
//	           	getting the num of people at old stage
            	String sqlold = "Select people from stages where companyID = ? and stepnum = ?";
            	PreparedStatement stold = conn.prepareStatement(sqlold);
            	stold.setInt(1, id);
            	stold.setInt(2,oldstage);
            	ResultSet rs2 = stold.executeQuery();
            	rs2.next();
            	int oldpeople = rs2.getInt("people");
            	oldpeople -=1;
	           	
//            	getting num of people at new stage
            	String sql2 = "Select people from stages where companyID = ? and stepnum = ?";
            	PreparedStatement st = conn.prepareStatement(sql2);
            	st.setInt(1, id);
            	st.setInt(2,stage);
            	ResultSet rs = st.executeQuery();
            	rs.next();
            	int people = rs.getInt("people");
            	people+=1;
            	
//            	updating accordingly
            	String sqlupdate = "Update stages set people = ? where companyID = ? and stepnum = ?";
            	PreparedStatement st2 = conn.prepareStatement(sqlupdate);
            	st2.setInt(1, people);
            	st2.setInt(2, id);
            	st2.setInt(3, stage);
            	st2.executeUpdate();
            	
            	st2.setInt(1, oldpeople);
            	st2.setInt(3, oldstage);
            	st2.executeUpdate();
            	
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
        request.getRequestDispatcher("/SearchAll").forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }
}
