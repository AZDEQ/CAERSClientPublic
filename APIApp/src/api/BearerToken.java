package api;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Base64;
import java.util.Properties;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.simple.parser.ParseException;

public class BearerToken {
    private Properties properties;
    public Properties getProperties() { return this.properties; }
    public void setProperties(Properties properties) { this.properties = properties; }
    
    public String oAuth2() throws IOException, ParseException, JSONException
    {
    	String clientId = properties.getProperty("clientId");
    	String clientSecret = properties.getProperty("clientSecret");
    	String tokenUrl = properties.getProperty("accessTokenURL");
    	String authentication = clientId + ":" + clientSecret;
    	String encodedAuthentication = Base64.getEncoder().encodeToString(authentication.getBytes());    	
 	    	
		HttpURLConnection connection = null;
		
		URL url = new URL(tokenUrl);
		connection = (HttpURLConnection) url.openConnection();
		connection.setRequestMethod("POST");
		connection.setDoOutput(true);
		connection.setRequestProperty("Authorization", "Basic " + encodedAuthentication);
		connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");    	        
		connection.setRequestProperty("Connection","keep-alive");
		connection.setRequestProperty("Accept-Encoding","gzip, deflate, br");
		connection.setRequestProperty("Accept","*/*");    	        
		
		OutputStream outputStream = connection.getOutputStream();
		PrintStream printStream = new PrintStream(outputStream);   	        
		String content = "grant_type=client_credentials&clientId=" + clientId + "&clientSecret=" + clientSecret;
		printStream.print(content);
		printStream.close();
		
		BufferedReader bufferedReader = null;    	        
		String returnValue = "";
		
	    try {
	        bufferedReader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
	        StringBuffer stringBuffer = new StringBuffer();
		    String output = "";
		    while ((output = bufferedReader.readLine()) != null) {
	            stringBuffer.append(output);
	        }		    
		    
	        bufferedReader.close(); 
	        returnValue = stringBuffer.toString();
	    }
	    catch (Exception e) {	    	
	    }
	    finally {
	        if (bufferedReader != null) {
	            try {
	            	bufferedReader.close();
	            }
	            catch (IOException e) {
	            }
	        }
	        
	        connection.disconnect();        	        
	    }
	  	
	    JSONObject jsonObjectAPIResponse = new JSONObject(returnValue);
	    Object accessToken = jsonObjectAPIResponse.get("access_token");
	    return accessToken.toString();
	}
}
