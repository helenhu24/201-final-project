import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/addCompany")
public class addCompany extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//    	need url
		String db = "jdbc:mysql://localhost:3306/PA2";
		
		Enumeration<String> parameterNames = request.getParameterNames();
		String name = request.getParameter("companyname");
		while(parameterNames.hasMoreElements()) {
			String stepnum = parameterNames.nextElement();
//			only gets the number from the names 
			try {
//				parse data
				int num = Integer.parseInt(stepnum);
				System.out.println(num);
				String stage = request.getParameter(stepnum);
				System.out.println(stage);
				
//				sql connection need credentials <-
	    		Class.forName("com.mysql.cj.jdbc.Driver");
				Connection conn = DriverManager.getConnection(db,"user", "pass");
//				insert company name, step number and correlating step with 0 people in each step				
				String sql = "Insert into stages values(?,?,?,0);";
				PreparedStatement prep = conn.prepareStatement(sql);
				prep.setString(1, name);
				prep.setInt(2, num);
				prep.setString(3, stage);
				prep.executeUpdate();

				
			}
			catch(NumberFormatException e) {} catch (ClassNotFoundException e) {} catch (SQLException e) {}
		}
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection(db,"user", "pass");
//			how to store which step person is at? name,numapps
			String sqlmain = "Insert into company values(?,0)";
			PreparedStatement prep = conn.prepareStatement(sqlmain);
			prep.setString(1, name);
			prep.executeUpdate();
		} catch (ClassNotFoundException e) {} catch (SQLException e) {}

    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
