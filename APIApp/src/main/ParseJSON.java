package main;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Properties;

public class ParseJSON {
	public static void main(String[] args) throws IOException, SQLException {
		utilities.ReadPropertyFile readPropertyFile = new utilities.ReadPropertyFile();
		Properties properties = readPropertyFile.properties();
		utilities.Log log = new utilities.Log(properties);
		utilities.PostgreSQL postgreSQL = null;
		
		try {			
			api.Invoke invoke = new api.Invoke(properties);
			String listAPIResponse = invoke.list();			
			postgreSQL = new utilities.PostgreSQL(properties);
			String reportingYear = properties.getProperty("reportingYear");
			parse.JSON parseJSON = new parse.JSON(properties);
			parseJSON.list(invoke, postgreSQL, listAPIResponse, reportingYear);
	    }
		catch (Exception e) {
			try {
		    	log.write(e);
		    	} catch (Exception e1) {
				e1.printStackTrace();
			}
	    }
		finally {
			if (postgreSQL != null) {
				postgreSQL.getConnection().close();
			}
		}
	}
}
