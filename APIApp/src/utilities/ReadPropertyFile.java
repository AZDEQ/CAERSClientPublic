package utilities;
import java.util.*;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

// Read config.properties and load Properties object

public class ReadPropertyFile {
	public Properties properties() throws IOException {
		File configFile = new File("config.properties");	 
		FileReader fileReader = new FileReader(configFile);	 
		Properties properties = new Properties();
		properties.load(fileReader);
		return properties;
	}
}
