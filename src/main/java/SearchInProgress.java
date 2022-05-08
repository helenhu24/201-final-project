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

/**
 * Servlet implementation class SearchDispatcher
 */
@WebServlet("/SearchInProgress")
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
        	sortBy = "numApps";
        }
        
        
        String email = "empty";
        
	    for (Cookie c : request.getCookies()){
	    	if (c.getName().compareTo("loginID") == 0) {
	    		email = c.getValue();
	    		
	    	}
	    }
	    

        
        ArrayList<Company> arr = CompanyDataParser.getCompanies(keyWord,sortBy,"inProgress", email);
        request.setAttribute("key_word", keyWord);
        request.setAttribute("sort", sortBy);
        request.setAttribute("arr", arr);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
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