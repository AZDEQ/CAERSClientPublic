package data;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;

import org.json.JSONException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

// Insert values in the control_path_pollutant table such as control_path_id, pollutant_code, percent_reduction
// after parsing the detail JSON.

public class ControlPathPollutants {
	public static void insert(utilities.PostgreSQL postgreSQL, Object controlPathPollutantsObject, long controlPathId) throws IOException, ClassNotFoundException, SQLException, JSONException, ParseException
	{
		JSONArray controlPathPollutantsArray = (JSONArray)controlPathPollutantsObject;		
		for(Object o: controlPathPollutantsArray) {
			if (o instanceof JSONObject) {
				JSONObject controlPathPollutantDetailObject = (JSONObject)o;
									
				String pollutantCode = utilities.Format.getFieldValueFromBaseObject(controlPathPollutantDetailObject, Field.pollutantCode, Field.pollutantCode);
				Number percentControlMeasuresReductionEfficiency = utilities.Format.getNumericFieldValueFromObject(controlPathPollutantDetailObject, Field.percentControlMeasuresReductionEfficiency);

				Connection connection = postgreSQL.getConnection();
		        PreparedStatement preparedStatement = connection.prepareStatement(SQL.INSERT_CONTROL_PATH_POLLUTANT.label, PreparedStatement.RETURN_GENERATED_KEYS);
		        preparedStatement.setLong(1, controlPathId);
		        preparedStatement.setString(2, pollutantCode);
		        preparedStatement.setObject(3, percentControlMeasuresReductionEfficiency, java.sql.Types.NUMERIC);
		        
		        postgreSQL.insertPreparedStatement(preparedStatement);
			}
		}
	}
}
