package data;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;

import org.json.JSONException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

//Insert values in the facility_site_contact table such as
//release_point_id, emissions_process_id, percent, control_path_id
//after parsing the detail JSON.

public class ReleasePointApportionment {
	public static void insert(utilities.PostgreSQL postgreSQL, Object releasePointApportionmentObject, long facilitySiteId, long emissionsProcessId) throws IOException, ClassNotFoundException, SQLException, JSONException, ParseException
	{
		JSONArray releasePointApportionmentArray = (JSONArray)releasePointApportionmentObject;		
		for(Object o: releasePointApportionmentArray) {
			if (o instanceof JSONObject) {
				JSONObject releasePointApportionmentDetailObject = (JSONObject)o;
				String releasePointIdentification = utilities.Format.getFieldValueFromObject(releasePointApportionmentDetailObject, Field.releasePointIdentification);
				String releasePointIdentifier = utilities.Format.getFieldValueFromArray(releasePointIdentification, Field.identifier);
				Number averagePercentEmissions = utilities.Format.getNumericFieldValueFromObject(releasePointApportionmentDetailObject, Field.averagePercentEmissions);
				String pathIdentification = utilities.Format.getFieldValueFromObject(releasePointApportionmentDetailObject, Field.pathIdentification);
				String pathIdentifier = utilities.Format.getFieldValueFromArray(pathIdentification, Field.identifier);
				
				Connection connection = postgreSQL.getConnection();
		        
				PreparedStatement preparedStatementReleasePoint = connection.prepareStatement(SQL.SELECT_RELEASE_POINT.label);
				preparedStatementReleasePoint.setLong(1, facilitySiteId);
				preparedStatementReleasePoint.setString(2, releasePointIdentifier);
		        ResultSet resultSetReleasePoint = preparedStatementReleasePoint.executeQuery();
		        Number releasePointId = null;
		        while (resultSetReleasePoint.next()) {
		        	releasePointId = resultSetReleasePoint.getLong("id");
	            }

		        Number controlPathId = null;
		        PreparedStatement preparedStatementControlPath = connection.prepareStatement(SQL.SELECT_CONTROL_PATH.label);
				preparedStatementControlPath.setLong(1, facilitySiteId);
				preparedStatementControlPath.setString(2, pathIdentifier);
		        ResultSet resultSetControlPath = preparedStatementControlPath.executeQuery();
		        while (resultSetControlPath.next()) {
		        	controlPathId = resultSetControlPath.getLong("id");
	            }				
				
				PreparedStatement preparedStatement = connection.prepareStatement(SQL.INSERT_RELEASE_POINT_APPT.label, PreparedStatement.RETURN_GENERATED_KEYS);
		        preparedStatement.setObject(1, releasePointId, java.sql.Types.NUMERIC);
		        preparedStatement.setLong(2, emissionsProcessId);
		        preparedStatement.setObject(3, averagePercentEmissions, java.sql.Types.NUMERIC);
		        preparedStatement.setObject(4, controlPathId, java.sql.Types.NUMERIC);
		        
		        postgreSQL.insertPreparedStatement(preparedStatement);		        
			}
		}
	}
}
