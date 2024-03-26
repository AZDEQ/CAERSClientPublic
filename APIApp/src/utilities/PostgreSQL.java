package utilities;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class PostgreSQL {
    private Properties properties;
    public Properties getProperties() { return this.properties; }
    public void setProperties(Properties properties) { this.properties = properties; }
    private Connection connection;
    public Connection getConnection() { return this.connection; }
	
    public PostgreSQL(Properties properties) throws ClassNotFoundException, SQLException, IOException
    {
    	this.properties = properties;
    	connect();
    }
    
	public Connection connect() throws SQLException, ClassNotFoundException, IOException
	{	      	
		try {
		    Class.forName("org.postgresql.Driver");
		}
		catch (ClassNotFoundException e) {
		    throw new RuntimeException("Cannot find the driver in the classpath for org.postgresql.Driver!", e);
		}
		
		String url = properties.getProperty("urlRDS");
		String password = properties.getProperty("password");
		String user = properties.getProperty("user");
		try {	
			connection = DriverManager.getConnection(url, user, password);
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		return connection;
	}

	public long insertPreparedStatement(String statement) throws SQLException, ClassNotFoundException, IOException
	{
		long key = -1;
		PreparedStatement preparedStatement = connection.prepareStatement(statement, PreparedStatement.RETURN_GENERATED_KEYS);
		preparedStatement.executeUpdate();        
        ResultSet resultSet = preparedStatement.getGeneratedKeys();
        resultSet.next();
        key = resultSet.getLong(1);
        return key;		
	}
	
	public long insertPreparedStatement(PreparedStatement preparedStatement) throws SQLException, ClassNotFoundException, IOException
	{
		long key = -1;
		preparedStatement.executeUpdate();        
        ResultSet resultSet = preparedStatement.getGeneratedKeys();
        resultSet.next();
        key = resultSet.getLong(1);
        return key;		
	}	
}