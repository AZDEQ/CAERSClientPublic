package main;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Properties;

// Main class. Get values from configuration, invoke List API and parse JSON.

public class ParseJSON {
	public static void main(String[] args) throws IOException, SQLException {
		utilities.ReadPropertyFile readPropertyFile = new utilities.ReadPropertyFile();
		Properties properties = readPropertyFile.properties();
		utilities.Log log = new utilities.Log(properties);
		utilities.PostgreSQL postgreSQL = null;
		
		try {
			String reportingYearStartString = properties.getProperty("reportingYearStart");
			int reportingYearStart = Integer.parseInt(reportingYearStartString);
			int currentYear = Calendar.getInstance().get(Calendar.YEAR);
			for (int reportingYearToProcess = reportingYearStart; reportingYearToProcess <= currentYear; reportingYearToProcess++)
			{
				properties.setProperty("reportingYearStart", String.valueOf(reportingYearToProcess));
				
				// Initialize Invoke object with bearer token
				
				api.Invoke invoke = new api.Invoke(properties);
				
				// Get list response to process
				
				String listAPIResponse = invoke.list();
				
				postgreSQL = new utilities.PostgreSQL(properties);
						
				parse.JSON parseJSON = new parse.JSON(properties);
				
				// Process List. List will iterate through AFId's and invoke Detail if necessary.
				// When processing list, start from the root of the JSON (e.g., facilitySite) and
				// recursively process child branches
				
				parseJSON.list(invoke, postgreSQL, listAPIResponse, String.valueOf(reportingYearToProcess));
			}
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