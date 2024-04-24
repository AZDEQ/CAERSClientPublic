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

//Insert values in the emissions_unit table such as facility_site_id, unit_identifier, description, type_code, status_code,
//status_year, unit_measure_cd, comments, design_capacity
//after parsing the detail JSON.
//EmissionsProcesses are inserted after inserting a emissions_process.

public class EmissionsUnits {	
	public static void insert(utilities.PostgreSQL postgreSQL, Object emissionsUnitsObject, long facilitySiteId) throws IOException, ClassNotFoundException, SQLException, JSONException, ParseException
	{
		JSONArray emissionsUnitsArray = (JSONArray)emissionsUnitsObject;		
		for(Object o: emissionsUnitsArray) {
			if (o instanceof JSONObject) {
				JSONObject emissionsUnitDetailObject = (JSONObject)o;
				String unitIdentifier = JSON.identification(emissionsUnitDetailObject, Field.identification);
				String description = utilities.Format.getFieldValueFromObject(emissionsUnitDetailObject, Field.description);
				String unitTypeCode = utilities.Format.getCodeFromBaseObject(emissionsUnitDetailObject, Field.unitTypeCode);
				String statusCode = utilities.Format.getCodeFromBaseObject(emissionsUnitDetailObject, Field.statusCode);		
				Number statusCodeYear = utilities.Format.getNumericFieldValueFromObject(emissionsUnitDetailObject, Field.statusCodeYear);
				String comment = utilities.Format.getFieldValueFromObject(emissionsUnitDetailObject, Field.comment);
				
				String designCapacity = utilities.Format.getFieldValueFromObject(emissionsUnitDetailObject, Field.designCapacity);	
				Object designCapacityObject = JSONValue.parse(designCapacity);
				JSONObject designCapacityJSONObject = (JSONObject)designCapacityObject;				
				Number designCapacityValue = utilities.Format.getNumericFieldValueFromObject(designCapacityJSONObject, Field.value);	
				String designCapacityUnitCode = utilities.Format.getFieldValueFromBaseObject(designCapacityJSONObject, Field.unit, Field.code);
				
				Connection connection = postgreSQL.getConnection();
		        PreparedStatement preparedStatement = connection.prepareStatement(SQL.INSERT_EMISSIONS_UNIT.label, PreparedStatement.RETURN_GENERATED_KEYS);
		        preparedStatement.setLong(1, facilitySiteId);
		        preparedStatement.setString(2, unitIdentifier);                                            
		        preparedStatement.setString(3, description);                
		        preparedStatement.setString(4, unitTypeCode);
		        preparedStatement.setString(5, statusCode);
		        	                
		        preparedStatement.setObject(6, statusCodeYear, java.sql.Types.NUMERIC);  
		        preparedStatement.setString(7, designCapacityUnitCode);
		        preparedStatement.setString(8, comment);		        
		        preparedStatement.setObject(9, designCapacityValue, java.sql.Types.NUMERIC);
		        
		        long id = postgreSQL.insertPreparedStatement(preparedStatement);				
				
				String emissionsProcesses = utilities.Format.getFieldValueFromObject(emissionsUnitDetailObject, Field.emissionsProcesses);
				Object emissionsProcessesObject = JSONValue.parse(emissionsProcesses);
				EmissionsProcesses.insert(postgreSQL, emissionsProcessesObject, facilitySiteId, id);				
			}
		}		
	}	
}
