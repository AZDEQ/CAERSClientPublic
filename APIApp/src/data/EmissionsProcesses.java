package data;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;

import org.json.JSONException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import parse.JSON;

public class EmissionsProcesses {
	public static void insert(utilities.PostgreSQL postgreSQL, Object emissionsProcessesObject, long facilitySiteId, long emissionsUnitId) throws IOException, ClassNotFoundException, SQLException, JSONException, ParseException
	{
		JSONArray emissionsProcessesArray = (JSONArray)emissionsProcessesObject;		
		for(Object o: emissionsProcessesArray) {
			if (o instanceof JSONObject) {
				JSONObject emissionsProcessDetailObject = (JSONObject)o;
				String emissionsProcessIdentifier = JSON.identification(emissionsProcessDetailObject, Field.identification);
				String statusCode = utilities.Format.getCodeFromBaseObject(emissionsProcessDetailObject, Field.statusCode);
				Number statusCodeYear = utilities.Format.getNumericFieldValueFromObject(emissionsProcessDetailObject, Field.statusCodeYear);
				String sourceClassificationCode = utilities.Format.getFieldValueFromObject(emissionsProcessDetailObject, Field.sourceClassificationCode);
				String sccShortName = utilities.Format.getFieldValueFromObject(emissionsProcessDetailObject, Field.sccShortName);
				String description = utilities.Format.getFieldValueFromObject(emissionsProcessDetailObject, Field.description);						
				String aircraftEngineTypeCode = utilities.Format.getFieldValueFromObject(emissionsProcessDetailObject, Field.aircraftEngineTypeCode);
				String comment = utilities.Format.getFieldValueFromObject(emissionsProcessDetailObject, Field.comment);
				String sccDescription = utilities.Format.getFieldValueFromObject(emissionsProcessDetailObject, Field.sccDescription);
				String isBillableString = utilities.Format.getFieldValueFromObject(emissionsProcessDetailObject, Field.isBillable);
				Boolean isBillable = true;
				if (isBillableString != null && isBillableString.equals("false"))
				{
					isBillable = false;
				}
				
				Connection connection = postgreSQL.getConnection();
	            PreparedStatement preparedStatement = connection.prepareStatement(SQL.INSERT_EMISSIONS_PROCESS.label, PreparedStatement.RETURN_GENERATED_KEYS);
                preparedStatement.setLong(1, emissionsUnitId);
                preparedStatement.setString(2, emissionsProcessIdentifier);
                preparedStatement.setString(3, statusCode);
                preparedStatement.setObject(4, statusCodeYear, java.sql.Types.NUMERIC);
                preparedStatement.setString(5, sourceClassificationCode);
                
                preparedStatement.setString(6, sccShortName);	                
                preparedStatement.setString(7, description);	  
                preparedStatement.setString(8, aircraftEngineTypeCode);
                preparedStatement.setString(9, comment);
                preparedStatement.setString(10, sccDescription);
                preparedStatement.setBoolean(11, isBillable);
                              
                long id = postgreSQL.insertPreparedStatement(preparedStatement);
					
				String reportingPeriods = utilities.Format.getFieldValueFromObject(emissionsProcessDetailObject, Field.reportingPeriods);
				Object reportingPeriodsObject = JSONValue.parse(reportingPeriods);
				ReportingPeriods.insert(postgreSQL, reportingPeriodsObject, id);
				
				String releasePointApportionment = utilities.Format.getFieldValueFromObject(emissionsProcessDetailObject, Field.releasePointApportionment);
				Object releasePointApportionmentObject = JSONValue.parse(releasePointApportionment);
				ReleasePointApportionment.insert(postgreSQL, releasePointApportionmentObject, facilitySiteId, id);					
			}
		}		
	}	
}