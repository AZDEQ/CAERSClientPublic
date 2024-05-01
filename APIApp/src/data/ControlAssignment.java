package data;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Hashtable;

import org.json.JSONException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import parse.JSON;

// Insert values in the control_assignment table such as control_id, control_path_id,
// control_path_child_id, sequence_number and percent_apportionment after parsing the detail JSON.

public class ControlAssignment {
	public static Hashtable<Number, String> insert(utilities.PostgreSQL postgreSQL, Object controlPathDefinitionObject, long facilitySiteId, long controlPathId) throws IOException, ClassNotFoundException, SQLException, JSONException, ParseException
	{
		Hashtable<Number, String> pathIdentificationIdentifiers = new Hashtable<Number, String>();		
		JSONArray controlPathDefinitionArray = (JSONArray)controlPathDefinitionObject;		
		for(Object o: controlPathDefinitionArray) {
			if (o instanceof JSONObject) {
				JSONObject controlPathDefinitionDetailObject = (JSONObject)o;
				String controlIdentificationIdentifier = JSON.identification(controlPathDefinitionDetailObject, Field.controlIdentification);					
				String pathIdentificationIdentifier = JSON.identification(controlPathDefinitionDetailObject, Field.pathIdentification);
				Number sequenceNumber = utilities.Format.getNumericFieldValueFromObject(controlPathDefinitionDetailObject, Field.sequenceNumber);				
				Number averagePercentApportionment = utilities.Format.getNumericFieldValueFromObject(controlPathDefinitionDetailObject, Field.averagePercentApportionment);

				Connection connection = postgreSQL.getConnection();
				
				PreparedStatement preparedStatementControl = connection.prepareStatement(SQL.SELECT_CONTROL_IDENTIFICATION.label);
				preparedStatementControl.setLong(1, facilitySiteId);
				preparedStatementControl.setString(2, controlIdentificationIdentifier);
		        ResultSet resultSetControl = preparedStatementControl.executeQuery();
		        Number controlId = null;
		        while (resultSetControl.next()) {
		        	controlId = resultSetControl.getLong("id");
	            }				
	        		        
		        Number controlPathChildId = GetControlPathChildId(postgreSQL, facilitySiteId, pathIdentificationIdentifier); 

		        if (pathIdentificationIdentifier != null) {
		        	pathIdentificationIdentifiers.put(controlPathId, pathIdentificationIdentifier);
		        }
			
		        PreparedStatement preparedStatement = connection.prepareStatement(SQL.INSERT_CONTROL_ASSIGNMENT.label, PreparedStatement.RETURN_GENERATED_KEYS);
		        preparedStatement.setObject(1, controlId, java.sql.Types.NUMERIC);
		        preparedStatement.setLong(2, controlPathId);
		        preparedStatement.setObject(3, controlPathChildId, java.sql.Types.NUMERIC);
		        preparedStatement.setObject(4, sequenceNumber, java.sql.Types.NUMERIC);
		        preparedStatement.setObject(5, averagePercentApportionment, java.sql.Types.NUMERIC);
		        
		        postgreSQL.insertPreparedStatement(preparedStatement);		        
			}
		}
		
		return pathIdentificationIdentifiers;
	}
	
	// SELECT Get id from control path for a Facility Site and Path id to insert into Control Assignment

	public static Number GetControlPathChildId(utilities.PostgreSQL postgreSQL, long facilitySiteId, String pathIdentificationIdentifier) throws SQLException
	{
		Connection connection = postgreSQL.getConnection();
		PreparedStatement preparedStatementControlPath = connection.prepareStatement(SQL.SELECT_CONTROL_PATH_IDENTIFICATION.label);
		preparedStatementControlPath.setLong(1, facilitySiteId);
		preparedStatementControlPath.setString(2, pathIdentificationIdentifier);
        ResultSet resultSetControlPath = preparedStatementControlPath.executeQuery();
        Number controlPathChildId = null;
        while (resultSetControlPath.next()) {
        	controlPathChildId = resultSetControlPath.getLong("id");
        }
        
        return controlPathChildId;
	}	
		
	public static void UpdateControlPathChildId(utilities.PostgreSQL postgreSQL, Number controlId, Number controlPathChildId) throws SQLException, ClassNotFoundException, IOException
	{
		Connection connection = postgreSQL.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(SQL.UPDATE_CONTROL_ASSIGNMENT.label);
        preparedStatement.setObject(1, controlPathChildId, java.sql.Types.NUMERIC); 
        preparedStatement.setObject(2, controlId, java.sql.Types.NUMERIC);
        preparedStatement.executeUpdate();			
	}
}
