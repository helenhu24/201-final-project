
import java.util.regex.Pattern;

public class Constant {
    //TODO replace it with your DB credentials
	static public String URL = "jdbc:mysql://somodi-paul-mysql-1.cm4toibfd749.us-east-1.rds.amazonaws.com:3306/Final_Project";
    static public String DBUserName = "admin";
    static public String DBPassword = "ILoveDunkin!";
    static public String FileName = "/restaurant_data.json";

    static public Pattern namePattern = Pattern.compile("^[ A-Za-z]+$");
    static public Pattern emailPattern = Pattern.compile("^[a-zA-Z0-9_+&*-]+(?:\\."
            + "[a-zA-Z0-9_+&*-]+)*@"
            + "(?:[a-zA-Z0-9-]+\\.)+[a-z"
            + "A-Z]{2,7}$");

}
