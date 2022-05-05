import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Util.Business;
import Util.Constant;
import Util.RestaurantDataParser;

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

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        ServletContext servletContext = getServletContext();
        InputStream stream = servletContext.getResourceAsStream(Constant.FileName);
    	BufferedReader br = new BufferedReader(new InputStreamReader(stream));
    	String line;
        // TODO get json file as stream, Initialize FakeYelpAPI by calling its initalize
        // method
        String temp="";
        
        //System.out.print("rdp made");
        try {
        	
        	while((line=br.readLine())!=null) {
        		temp+=line;
        		//System.out.println(temp);
        	}
			
			System.out.println("json string built");
			//System.out.println(temp);
        }
		catch(FileNotFoundException ex) {
			System.out.println("The file could not be found. \n");
			//continue;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        System.out.println("after catch blocks");
   
        RestaurantDataParser.Init(temp);
        System.out.println("json loaded");
        
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO
    	String keyWord = request.getParameter("searchInput");
        String sortBy = request.getParameter("sort_by");
        String searchType = request.getParameter("Selection");
        
        ArrayList<Business> arr = RestaurantDataParser.getBusinesses(keyWord,sortBy,searchType);
        request.setAttribute("key_word", keyWord);
        request.setAttribute("search_type", searchType);
        request.setAttribute("business_array", arr);
        request.getRequestDispatcher("/search.jsp").forward(request, response);
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