package data;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;

import org.json.JSONException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class OperatingDetails {
	public static void insert(utilities.PostgreSQL postgreSQL, Object operatingDetailsObject, long reportingPeriodId) throws IOException, ClassNotFoundException, SQLException, JSONException, ParseException
	{
		JSONArray operatingDetailsArray = (JSONArray)operatingDetailsObject;		
		for(Object o: operatingDetailsArray) {
			if (o instanceof JSONObject) {
				JSONObject operatingDetailDetailObject = (JSONObject)o;	
								
				Number actualHoursPerPeriod = utilities.Format.getNumericFieldValueFromObject(operatingDetailDetailObject, Field.actualHoursPerPeriod);
				Number averageHoursPerDay = utilities.Format.getNumericFieldValueFromObject(operatingDetailDetailObject, Field.averageHoursPerDay);
				Number averageDaysPerWeek = utilities.Format.getNumericFieldValueFromObject(operatingDetailDetailObject, Field.averageDaysPerWeek);
				Number averageWeeksPerPeriod = utilities.Format.getNumericFieldValueFromObject(operatingDetailDetailObject, Field.averageWeeksPerPeriod);
				Number percentWinterActivity = utilities.Format.getNumericFieldValueFromObject(operatingDetailDetailObject, Field.percentWinterActivity);
				Number percentSpringActivity = utilities.Format.getNumericFieldValueFromObject(operatingDetailDetailObject, Field.percentSpringActivity);
				Number percentSummerActivity = utilities.Format.getNumericFieldValueFromObject(operatingDetailDetailObject, Field.percentSummerActivity);
				Number percentFallActivity = utilities.Format.getNumericFieldValueFromObject(operatingDetailDetailObject, Field.percentFallActivity);
					
				Connection connection = postgreSQL.getConnection();
	            PreparedStatement preparedStatement = connection.prepareStatement(SQL.INSERT_OPERATING_DETAIL.label, PreparedStatement.RETURN_GENERATED_KEYS);

                preparedStatement.setLong(1, reportingPeriodId);
                preparedStatement.setObject(2, actualHoursPerPeriod, java.sql.Types.NUMERIC);                
                preparedStatement.setObject(3, averageHoursPerDay, java.sql.Types.NUMERIC);	  
                preparedStatement.setObject(4, averageDaysPerWeek, java.sql.Types.NUMERIC);
                preparedStatement.setObject(5, averageWeeksPerPeriod, java.sql.Types.NUMERIC);	 
                
                preparedStatement.setObject(6, percentWinterActivity, java.sql.Types.NUMERIC);	  
                preparedStatement.setObject(7, percentSpringActivity, java.sql.Types.NUMERIC);
                preparedStatement.setObject(8, percentSummerActivity, java.sql.Types.NUMERIC);
                preparedStatement.setObject(9, percentFallActivity, java.sql.Types.NUMERIC);
              
                postgreSQL.insertPreparedStatement(preparedStatement);					
			}
		}		
	}	
}
