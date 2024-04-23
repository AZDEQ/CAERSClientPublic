package data;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;

import org.json.JSONException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import parse.JSON;

//Insert values in the control table such as facility_site_id, identifier, description, percent_control, status_code,
//comments, control_measure_code, number_operating_months, start_date, end_date,
//upgrade_date, upgrade_description, status_year
//after parsing the detail JSON.
//ControlPollutants are inserted after inserting a control.

public class Controls {
	public static void insert(utilities.PostgreSQL postgreSQL, Object controlsObject, long facilitySiteId) throws IOException, ClassNotFoundException, SQLException, JSONException, ParseException
	{
		JSONArray controlsArray = (JSONArray)controlsObject;		
		for(Object o: controlsArray) {
			if (o instanceof JSONObject) {
				JSONObject controlDetailObject = (JSONObject)o;
				String identifier = JSON.identification(controlDetailObject, Field.identification);
				String description = utilities.Format.getFieldValueFromObject(controlDetailObject, Field.description);
				Number percentControlEffectiveness = utilities.Format.getNumericFieldValueFromObject(controlDetailObject, Field.percentControlEffectiveness);
				String statusCode = utilities.Format.getCodeFromBaseObject(controlDetailObject, Field.statusCode);		
				
				String comment = utilities.Format.getFieldValueFromObject(controlDetailObject, Field.comment);
				String controlMeasureCode = utilities.Format.getCodeFromBaseObject(controlDetailObject, Field.controlMeasureCode);
				Number numberOperatingMonths = utilities.Format.getNumericFieldValueFromObject(controlDetailObject, Field.numberOperatingMonths);
				Date startDate = utilities.Format.getDateFieldValueFromObject(controlDetailObject, Field.startDate);
				Date endDate = utilities.Format.getDateFieldValueFromObject(controlDetailObject, Field.endDate);
				
				Date upgradeDate = utilities.Format.getDateFieldValueFromObject(controlDetailObject, Field.upgradeDate);
				String upgradeDescription = utilities.Format.getFieldValueFromObject(controlDetailObject, Field.upgradeDescription);
				Number statusCodeYear = utilities.Format.getNumericFieldValueFromObject(controlDetailObject, Field.statusCodeYear);
				
				Connection connection = postgreSQL.getConnection();
		        PreparedStatement preparedStatement = connection.prepareStatement(SQL.INSERT_CONTROL.label, PreparedStatement.RETURN_GENERATED_KEYS);
		        preparedStatement.setLong(1, facilitySiteId);
		        preparedStatement.setString(2, identifier);                                            
		        preparedStatement.setString(3, description);                
		        preparedStatement.setObject(4, percentControlEffectiveness, java.sql.Types.NUMERIC);
		        preparedStatement.setString(5, statusCode);
		        	                
		        preparedStatement.setString(6, comment);  
		        preparedStatement.setString(7, controlMeasureCode);
		        preparedStatement.setObject(8, numberOperatingMonths, java.sql.Types.NUMERIC);		        
		        preparedStatement.setObject(9, startDate, java.sql.Types.DATE);
		        preparedStatement.setObject(10, endDate, java.sql.Types.DATE);
		        
		        preparedStatement.setObject(11, upgradeDate, java.sql.Types.DATE);
		        preparedStatement.setString(12, upgradeDescription);
		        preparedStatement.setObject(13, statusCodeYear, java.sql.Types.NUMERIC);
		        
		        long id = postgreSQL.insertPreparedStatement(preparedStatement);				
				
				String controlPollutants = utilities.Format.getFieldValueFromObject(controlDetailObject, Field.controlPollutants);
				Object controlPollutantsObject = JSONValue.parse(controlPollutants);
				ControlPollutants.insert(postgreSQL, controlPollutantsObject, id);				
			}
		}		
	}	
}
