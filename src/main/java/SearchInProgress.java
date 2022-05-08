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
 * Servlet implementation class SearchInProgress
 */
@WebServlet(urlPatterns = "/SearchInProgress/*", loadOnStartup = 1)
public class SearchInProgress extends HttpServlet {
   // @Serial
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     */
    public SearchInProgress() {
    }
    public String temp = "";


    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO
    	String keyWord = request.getParameter("search");
        String sortBy = request.getParameter("sort");
        if (keyWord == null) {
        	keyWord = "";
        }
        if (sortBy == null) {
        	sortBy = "alphabetical";
        }
        
        // Get loginID
        String loginID = "";
	    for (Cookie c : request.getCookies()){
	    	if (c.getName().compareTo("loginID") == 0) {
	    		loginID = c.getValue();
	    		System.out.println("loginID is " + loginID);
	    	}
	    }
        
        ArrayList<Company> arr = CompanyDataParser.getCompanies(keyWord,sortBy, "All");
        request.setAttribute("search", keyWord);
        request.setAttribute("sort", sortBy);
        request.setAttribute("arr", arr);
        request.getRequestDispatcher("/AllCompanies.jsp").forward(request, response);
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
