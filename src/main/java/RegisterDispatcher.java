package main.java;
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
 * Servlet implementation class RegisterDispatcher
 */
@WebServlet("/RegisterDispatcher") // referenced Piazza for this syntax
public class RegisterDispatcher extends HttpServlet {
    private static final long serialVersionUID = 1L;
    /**
     * Default constructor.
     */
    public RegisterDispatcher() {
    }


    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	response.setContentType("text/html");
        String sql = "SELECT * FROM Login WHERE loginID=?";
        try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			System.out.println("Error");
		}
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://somodi-paul-mysql-1.cm4toibfd749.us-east-1.rds.amazonaws.com:3306/Final_Project", "admin", "ILoveDunkin!")){
        	if (Helper.validName("name") == false) { // if name isn't valid, return error...
        		request.setAttribute("error", "Error: Name does not have a valid format.");
        		request.getRequestDispatcher("Register.jsp").include(request, response);
        		return;
        	}
        	PreparedStatement ps = conn.prepareStatement(sql); // see if user already in database...
        	ps.setString(1,  request.getParameter("emailAddress").toString());
        	ResultSet rs = ps.executeQuery(); // execute...
        	if (!rs.next()) { // if not yet registered..
        		// if user entered pasword and password matches confirmed password...
        		if (request.getParameter("confirmPassword").compareTo("") != 0 && request.getParameter("password").toString().compareTo(request.getParameter("confirmPassword")) == 0) {
	        		String sql2 = "INSERT INTO Login (loginID, firstName, lastName, password) VALUES (?, ?, ?, ?)";
	        		PreparedStatement ps2 = conn.prepareStatement(sql2); // add user to database...
	        		String firstname = request.getParameter("firstName").toString();
	        		String lastname = "";
	        		if (request.getParameter("lastName").compareTo("") != 0) {
		        		lastname = request.getParameter("lastName").toString();
	        		} // if last name found, set lastname...
	        		ps2.setString(1,  request.getParameter("emailAddress").toString());
	        		ps2.setString(2,  firstname);
	        		ps2.setString(3,  lastname);
	        		ps2.setString(4,  request.getParameter("confirmPassword").toString());
	        		ps2.executeUpdate();
	        		request.setAttribute("name", firstname + " " + lastname);
	        		// add cookie for user that is now logged in and registered: referenced https://www.javatpoint.com/cookies-in-servlet
	        		Cookie cookie = new Cookie("userName", firstname + "#" + lastname);
	        		cookie.setMaxAge(60*60);
	        		Cookie loginCookie = new Cookie("loginID", request.getParameter("loginemail").toString());
                    loginCookie.setMaxAge(60*60);
                    response.addCookie(cookie);
                    response.addCookie(loginCookie);
	        		response.sendRedirect("index.jsp");
        		}
        		else { // password didn't match conf_pass OR no password entered, return error...
            		request.setAttribute("error", "Error: Password and Confirm Password Must Match & Not Be Blank.");
            		request.getRequestDispatcher("Register.jsp").include(request, response);
        		}
        	}
        	else { // user already found in database, return error
        		request.setAttribute("error", "Error: User with email " + request.getParameter("email") + " is already registered.");
        		request.getRequestDispatcher("Register.jsp").include(request, response);
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
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
