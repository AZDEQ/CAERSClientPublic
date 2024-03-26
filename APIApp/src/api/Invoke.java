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
		this.reportingYear = properties.getProperty("reportingYear");
    }
    
    public String aPI(String aPIUrl) throws IOException, ParseException, JSONException
    {
    	HttpURLConnection httpURLConnection = null;
    	httpURLConnection = connect(aPIUrl);
		int responseCode = httpURLConnection.getResponseCode();
	    if (responseCode != 200) {
	    	if (responseCode == 401) {
	    		System.out.println("Bearer Token expired. Refreshing token and trying again...");
	    		api.BearerToken bearerTokenRefresh = new api.BearerToken();
	    		bearerTokenRefresh.setProperties(properties);
	    		this.bearerToken = bearerTokenRefresh.oAuth2();
	    		httpURLConnection = connect(aPIUrl);
	    		int responseCodeRefresh = httpURLConnection.getResponseCode();
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
    
    private HttpURLConnection connect(String aPIUrl) throws IOException
    {
		URL url = new URL(aPIUrl);
		HttpURLConnection httpURLConnection = (HttpURLConnection)url.openConnection();
		httpURLConnection.setRequestProperty("Authorization", "bearer " + bearerToken);
		httpURLConnection.setRequestProperty("Content-Type","application/json");
		httpURLConnection.setRequestProperty("Connection","keep-alive");
		httpURLConnection.setRequestProperty("Accept-Encoding","gzip, deflate, br");
		httpURLConnection.setRequestProperty("Accept","*/*");
		httpURLConnection.setRequestMethod("GET");
		httpURLConnection.connect();
		return httpURLConnection;
    }
    
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
    
    public String list() throws IOException, ParseException, JSONException
    {
	    String listAPIUrlFormat = properties.getProperty("listAPIUrlFormat");
	    String listAPIUrl = MessageFormat.format(listAPIUrlFormat, reportingYear);
		String listAPIJson = aPI(listAPIUrl);
	    return listAPIJson;
    }
    
    public String detail(String agencyFacilityIdentifier) throws IOException, ParseException, JSONException
    {
		String detailAPIUrlFormat = properties.getProperty("detailAPIUrlFormat");	
		String detailAPIUrl = MessageFormat.format(detailAPIUrlFormat, reportingYear, agencyFacilityIdentifier);
		String detailAPIJson = aPI(detailAPIUrl);		
	    return detailAPIJson;
    }
}
