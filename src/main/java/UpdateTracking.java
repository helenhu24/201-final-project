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


@WebServlet("/UpdateTracking")
public class UpdateTracking extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public UpdateTracking() {
    }
    public String temp = "";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get loginID
        String loginID = "";
	    for (Cookie c : request.getCookies()){
	    	if (c.getName().compareTo("loginID") == 0) {
	    		loginID = c.getValue();
	    	}
	    }
	    // Get company and status ID
	    System.out.println(request.getParameter("companyID"));
	    System.out.println(request.getParameter("status"));
	    int id = Integer.parseInt(request.getParameter("companyID"));
	    int stage = Integer.parseInt(request.getParameter("status"));
	    // Update status
	    String db = Constant.URL;
		String user =  Constant.DBUserName;
		String pwd = Constant.DBPassword;
		
		String q = "UPDATE bridge SET progress = ? WHERE companyID = ? AND loginID = ?";
		try(Connection conn = DriverManager.getConnection(db,user,pwd);
				PreparedStatement stmt = conn.prepareStatement(q);){
            	Class.forName("com.mysql.jdbc.Driver");
            	stmt.setInt(1, stage);
            	stmt.setInt(2, id);
            	stmt.setString(3, loginID);
            	stmt.executeUpdate();
            	
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
        request.getRequestDispatcher("/SearchInProgress").forward(request, response);
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
