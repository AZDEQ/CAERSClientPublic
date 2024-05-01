package data;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Enumeration;
import java.util.Hashtable;

import org.json.JSONException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import parse.JSON;

//Insert values in the control_path table such as facility_site_id, description, path_id, percent_control
//after parsing the detail JSON.
// Insert ControlPathPollutants after inserting ControlPath

public class ControlPaths {
	public static void insert(utilities.PostgreSQL postgreSQL, Object controlPathsObject, long facilitySiteId) throws IOException, ClassNotFoundException, SQLException, JSONException, ParseException
	{
		Hashtable<Number, String> pathIdentificationIdentifiers = new Hashtable<Number, String>();  
		JSONArray controlsArray = (JSONArray)controlPathsObject;		
		for(Object o: controlsArray) {
			if (o instanceof JSONObject) {
				JSONObject controlPathDetailObject = (JSONObject)o;
				String identifier = JSON.identification(controlPathDetailObject, Field.identification);
				String description = utilities.Format.getFieldValueFromObject(controlPathDetailObject, Field.description);					
				Number percentPathEffectiveness = utilities.Format.getNumericFieldValueFromObject(controlPathDetailObject, Field.percentPathEffectiveness);

				Connection connection = postgreSQL.getConnection();
		        PreparedStatement preparedStatement = connection.prepareStatement(SQL.INSERT_CONTROL_PATH.label, PreparedStatement.RETURN_GENERATED_KEYS);
		        preparedStatement.setLong(1, facilitySiteId);
		        preparedStatement.setString(2, description);
		        preparedStatement.setString(3, identifier);
		        preparedStatement.setObject(4, percentPathEffectiveness, java.sql.Types.NUMERIC);
		        
		        long id = postgreSQL.insertPreparedStatement(preparedStatement);

				String controlPathDefinition = utilities.Format.getFieldValueFromObject(controlPathDetailObject, Field.controlPathDefinition);
				Object controlPathDefinitionObject = JSONValue.parse(controlPathDefinition);
				Hashtable<Number, String> pathIdentificationIdentifiersForControlAssignment = ControlAssignment.insert(postgreSQL, controlPathDefinitionObject, facilitySiteId, id);			        
				pathIdentificationIdentifiers.putAll(pathIdentificationIdentifiersForControlAssignment);
				String controlPathPollutants = utilities.Format.getFieldValueFromObject(controlPathDetailObject, Field.controlPathPollutants);
				Object controlPathPollutantsObject = JSONValue.parse(controlPathPollutants);
				ControlPathPollutants.insert(postgreSQL, controlPathPollutantsObject, id);			        
			}
		}
		
		// Retrieve Control Path Child Id using Path Identification Identifiers and update Control Assignment
		
		Enumeration<Number> controlPathIds = pathIdentificationIdentifiers.keys();
		while (controlPathIds.hasMoreElements()) {
			Number controlPathId = controlPathIds.nextElement();
			String pathIdentificationIdentifier = pathIdentificationIdentifiers.get(controlPathId);
			Number controlPathChildId = ControlAssignment.GetControlPathChildId(postgreSQL, facilitySiteId, pathIdentificationIdentifier);
			ControlAssignment.UpdateControlPathChildId(postgreSQL, controlPathId, controlPathChildId);			
		}
	}
}
