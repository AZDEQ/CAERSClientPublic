package api;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.SQLException;
import java.text.MessageFormat;
import java.util.Properties;

import org.json.JSONException;
import org.json.simple.parser.ParseException;

// Class to invoke REST APIs' utilizing OAuth2

public class Invoke {	
    private String bearerToken;
    public String getBearerToken() { return this.bearerToken; }
    public void setBearerToken(String bearerToken) { this.bearerToken = bearerToken; }

    private String reportingYear;
    public String getReportYear() { return this.reportingYear; }
    public void setReportYear(String reportYear) { this.reportingYear = reportYear; }
    
    private Properties properties;
    public Properties getProperties() { return this.properties; }
    public void setProperties(Properties properties) { this.properties = properties; }
 
    public Invoke(Properties properties) throws ClassNotFoundException, SQLException, IOException, ParseException, JSONException
    {
    	this.properties = properties;
		api.BearerToken bearerToken = new api.BearerToken();
		bearerToken.setProperties(properties);		
		this.bearerToken = bearerToken.oAuth2();
		this.reportingYear = properties.getProperty("reportingYearStart");
    }
    
    // Make API detail/list REST API call to EPA. Retry once on timeout.
    
    public String aPI(String aPIUrl) throws IOException, ParseException, JSONException
    {
    	HttpURLConnection httpURLConnection = null;
    	httpURLConnection = connect(aPIUrl);
    	int responseCode = -1;
    	try
    	{
    		responseCode = httpURLConnection.getResponseCode();
    	}
    	catch (java.net.SocketTimeoutException e)
    	{
    		try
    		{
    			System.out.println("SocketTimeoutException. Trying again...");
    			responseCode = httpURLConnection.getResponseCode();
    		}
    		catch (java.net.SocketTimeoutException e1)
    		{
    			throw new RuntimeException("HttpResponseCode: " + e.toString());
    		}
    	}
	    
		if (responseCode != 200) {
	    	if (responseCode == 401) {
	    		
	    		// Bearer Token may expire for large detail records.
	    		// Refresh token and retry making the API call once again
	    		
	    		System.out.println("Bearer Token expired. Refreshing token and trying again...");
	    		api.BearerToken bearerTokenRefresh = new api.BearerToken();
	    		bearerTokenRefresh.setProperties(properties);
	    		this.bearerToken = bearerTokenRefresh.oAuth2();
	    		httpURLConnection = connect(aPIUrl);
	    		int responseCodeRefresh = -1;
	    		
	    		try
	    		{
	    			responseCodeRefresh = httpURLConnection.getResponseCode();
	    		}
	    		catch (java.net.SocketTimeoutException e)
	    		{
	    			try
	    			{
	    				System.out.println("SocketTimeoutException. Trying again...");
	    				responseCodeRefresh = httpURLConnection.getResponseCode();
	    			}
	    			catch (java.net.SocketTimeoutException e1)
	    			{
	    				throw new RuntimeException("HttpResponseCode: " + e1.toString());
	    			}
	    		}

	    		if (responseCodeRefresh != 200) {
	    			throw new RuntimeException("Retried API call after refreshing Bearer Token but failed again. HttpResponseCode: " + responseCode);
	    		}
	    	}	    	
	    	else {
			    throw new RuntimeException("HttpResponseCode: " + responseCode);	    		
	    	}
		}
	    
	    String stringBuffer = bufferedReader(httpURLConnection);    
	    return stringBuffer; 
	}    
    
    // Set connection properties (Bearer Token, etc)
    
    private HttpURLConnection connect(String aPIUrl) throws IOException
    {
		URL url = new URL(aPIUrl);
		
		// Set connection properties, connect and return connection object
		
		HttpURLConnection httpURLConnection = (HttpURLConnection)url.openConnection();
		httpURLConnection.setRequestProperty("Authorization", "bearer " + bearerToken);
		httpURLConnection.setRequestProperty("Content-Type","application/json");
		httpURLConnection.setRequestProperty("Connection","keep-alive");
		httpURLConnection.setRequestProperty("Accept-Encoding","gzip, deflate, br");
		httpURLConnection.setRequestProperty("Accept","*/*");
		httpURLConnection.setRequestMethod("GET");
		String connectTimeoutString = properties.getProperty("connectTimeout");
		int connectTimeout = Integer.parseInt(connectTimeoutString);			
		httpURLConnection.setConnectTimeout(connectTimeout);
		httpURLConnection.setReadTimeout(connectTimeout);
		httpURLConnection.connect();
		return httpURLConnection;
    }
    
    // Buffer read API response
    
    private String bufferedReader(HttpURLConnection httpURLConnection) throws IOException
    {
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(httpURLConnection.getInputStream()));
        StringBuffer stringBuffer = new StringBuffer();
	    String output = "";
	    while ((output = bufferedReader.readLine()) != null) {
            stringBuffer.append(output);
        }		    
	    
        bufferedReader.close();    
	    return stringBuffer.toString();		    	
    }
    
    // Set up List API URL that pulls reports for a reporting year.
    // 	Set up Detail API URL that pulls a report by Agency Facility Identifier.
	//    Certified Facility List for a Reporting Year
	//    Input
	//    1. Agency Id, implied from OAuth2 credentials (e.g., AZDEQ_PROD)
	//    2. Reporting Year (e.g., 2015)
    //
	//    Output
	//    List of facility reports. Each member of the list consists of elements:
	// 1. Report Id	
	// 2. Facility Site Identifier (e.g., 3532)
    // 3. Status
    // 4. Modified Date
	// 5. Certified Date Last Updated Date Time (e.g., 2021-07-27T10:00:56.9908326-07:00) or Version Number (e.g., 3)
    
    public String list() throws IOException, ParseException, JSONException
    {
    	// Format List URL template with Reporting Year and make list API call.
    	
    	String listAPIUrlFormat = properties.getProperty("listAPIUrlFormat");
	    String listAPIUrl = MessageFormat.format(listAPIUrlFormat, reportingYear);
		String listAPIJson = aPI(listAPIUrl);
	    return listAPIJson;
    }
    
	//    Facility Detail
	//    Input
	//    1.	Facility Site Identifier (e.g., 3532)
	//    2.	Reporting Year (e.g., 2015)
    //
	//    Output
	//    JSON formatted data for facility.    
    
    public String detail(String agencyFacilityIdentifier) throws IOException, ParseException, JSONException
    {
    	// Format Detail URL template with Reporting Year and Agency Facility Identifier and make detail API call.
    	
		String detailAPIUrlFormat = properties.getProperty("detailAPIUrlFormat");	
		String detailAPIUrl = MessageFormat.format(detailAPIUrlFormat, reportingYear, agencyFacilityIdentifier);
		String detailAPIJson = aPI(detailAPIUrl);		
	    return detailAPIJson;
    }
}
