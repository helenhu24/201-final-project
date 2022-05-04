import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class LoginDispatcher
 */
@WebServlet("/LoginDispatcher") // referenced Piazza for this syntax
public class LoginDispatcher extends HttpServlet {
    private static final long serialVersionUID = 1L;


    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	response.setContentType("text/html");
        String sql = "SELECT * FROM User WHERE email=?";
        try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			System.out.println("Error");
		}
        try (Connection conn = DriverManager.getConnection(Constant.URL, Constant.DBUserName, Constant.DBPassword)){
        	PreparedStatement ps = conn.prepareStatement(sql); // see if there's a user in the database with this email..
        	ps.setString(1,  request.getParameter("login_email").toString());
        	ResultSet rs = ps.executeQuery(); // execute...
        	if (rs.next()) { // if we found a match...
        		// if password matches what's in the database...
        		if (rs.getString("password").compareTo(request.getParameter("password").toString()) == 0) {
            		String firstname = rs.getString("fname");
            		String lastname = rs.getString("lname");
            		request.setAttribute("name", firstname + " " + lastname);
            		// set cookie: referenced https://www.javatpoint.com/cookies-in-servlet
            		Cookie cookie = new Cookie("userName", firstname + "#" + lastname);
            		cookie.setMaxAge(60*60);
            		response.addCookie(cookie);
            		response.sendRedirect("index.jsp");
        		}
        		else { // otherwise, incorrect password, return error...
            		request.setAttribute("error", "Error: Incorrect Password.");
            		request.getRequestDispatcher("Login.jsp").include(request, response);
        		}
        	}
        	else { // if we didn't find in database, email hasn't been registered, return error..
        		request.setAttribute("error", "Error: User with email " + request.getParameter("login_email") + " does not exist.");
        		request.getRequestDispatcher("Login.jsp").include(request, response);
        	}
        }
        catch (SQLException e) {
        	System.out.println("SQL Exception: " + e.getMessage());
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
