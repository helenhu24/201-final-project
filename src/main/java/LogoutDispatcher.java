import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class LogoutDispatcher
 */
@WebServlet("/LogoutDispatcher") // denotes this as a servlet; referenced Piazza for this
public class LogoutDispatcher extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        // TODO Remove userID cookie
    	// I referenced https://www.javatpoint.com/cookies-in-servlet for how to utilize cookies
    	response.setContentType("text/html");
    	Cookie c = new Cookie("userName", "test");
    	c.setMaxAge(0);
    	response.addCookie(c);
    	response.sendRedirect("index.jsp");

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        doGet(request, response);
    }

}
