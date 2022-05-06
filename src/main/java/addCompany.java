package main.java;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//gay

@WebServlet("/addCompany")
public class addCompany extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//    	need url
		String db = "jdbc:mysql://somodi-paul-mysql-1.cm4toibfd749.us-east-1.rds.amazonaws.com:3306/Final_Project";
		
		Enumeration<String> parameterNames = request.getParameterNames();
		String name = request.getParameter("companyname");
		int coID = 0;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection(db, "admin", "ILoveDunkin!");
//			how to store which step person is at? name,numapps
			String sqlmain = "Insert into Company(companyName,numApps) values (?,0);";
			PreparedStatement prep = conn.prepareStatement(sqlmain);
			prep.setString(1, name);
			prep.executeUpdate();
			String sql = "Select companyID from Company where companyName = ?";
			PreparedStatement prep2 = conn.prepareStatement(sql);
			prep2.setString(1, name);
			ResultSet res = prep2.executeQuery();
			res.next();
			coID = res.getInt("companyID");
			
		} catch (ClassNotFoundException e) {} catch (SQLException e) {
		}
		while(parameterNames.hasMoreElements()) {
			String stepnum = parameterNames.nextElement();
//			only gets the number from the names 
			try {
//				parse data
				int num = Integer.parseInt(stepnum);
				String stage = request.getParameter(stepnum);
				
//				sql connection need credentials <-
	    		Class.forName("com.mysql.cj.jdbc.Driver");
				Connection conn = DriverManager.getConnection(db,"admin", "ILoveDunkin!");
//				insert company name, step number and correlating step with 0 people in each step				
				String sql = "INSERT INTO stages (companyID, stepnum, stage, people) VALUES (?,?,?,0)";
				PreparedStatement prep = conn.prepareStatement(sql);
				prep.setInt(1, coID);
				prep.setInt(2, num);
				prep.setString(3, stage);
				prep.executeUpdate();
			}
			catch(NumberFormatException e) {} catch (ClassNotFoundException e) {} catch (SQLException e) {}
		}


    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
