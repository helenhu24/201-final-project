package main.java;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//gay

@WebServlet("/DetailDispatcher")
public class DetailDispatcher extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("companyID");
		CompanyDataParser co = new CompanyDataParser();
		Company comp = co.getCompany(id);
		co.setStages(id);
		String email = "";
	    for (Cookie c : request.getCookies()){
	    	if (c.getName().compareTo("loginID") == 0) {
	    		email = c.getValue();
	    		break;
	    	}
	    }
		co.setProgress(id, email);
		
		int progress = co.prog;
		ArrayList<String> stage = co.stage;
		ArrayList<Integer> people = co.people;
		
        request.setAttribute("stage", stage);
        request.setAttribute("people", people);
        request.setAttribute("company", comp);
        request.setAttribute("progress", progress);
        request.getRequestDispatcher("/CompanyDetails.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}

