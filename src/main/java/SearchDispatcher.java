import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
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
@WebServlet("/SearchDispatcher")
public class SearchDispatcher extends HttpServlet {
   // @Serial
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor.
     */
    public SearchDispatcher() {
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
        String loggedIn = request.getParameter("loggedIn");
        
        request.setAttribute("search", keyWord);
        request.setAttribute("sort", sortBy);
        if(loggedIn.equals("true")) {
        	request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
        else if(loggedIn.equals("false")){
        	request.getRequestDispatcher("/AllCompanies.jsp").forward(request, response);
        }
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