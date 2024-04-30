package utilities;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Properties;

public class Log {
    private Properties properties;
    public Properties getProperties() { return this.properties; }
    public void setProperties(Properties properties) { this.properties = properties; }

    public Log(Properties properties)
    {
    	this.properties = properties;
    }
    
	public void write(Exception e) throws IOException {
        StringWriter stringWriter = new StringWriter();
        PrintWriter printWriter = new PrintWriter(stringWriter);
        e.printStackTrace(printWriter);
        String stackTrace = stringWriter.toString();
        String currentDateTime = java.time.LocalDateTime.now().toString();       
        System.out.println("EXCEPTION: " + currentDateTime + ": " + stackTrace);
	}
	
	// Used for debugging only since application is containerized and cannot write to file.
	
	public void stringToFile(String stringToWrite, String fileNameProperty) throws IOException
	{
		String fileNameDetail = "C:\\APIOutput\\DetailAPIResponse.txt";
		BufferedWriter bufferedWriterDetail = new BufferedWriter(new FileWriter(fileNameDetail));
	    bufferedWriterDetail.write(stringToWrite);	    
	    bufferedWriterDetail.close();	
	}	
}
