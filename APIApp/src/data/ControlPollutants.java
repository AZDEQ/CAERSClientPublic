package data;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;

import org.json.JSONException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class ControlPollutants {
	public static void insert(utilities.PostgreSQL postgreSQL, Object controlPollutantsObject, long controlId) throws IOException, ClassNotFoundException, SQLException, JSONException, ParseException
	{
		JSONArray controlPollutantsArray = (JSONArray)controlPollutantsObject;		
		for(Object o: controlPollutantsArray) {
			if (o instanceof JSONObject) {
				JSONObject controlPollutantDetailObject = (JSONObject)o;
									
				String pollutantCode = utilities.Format.getFieldValueFromBaseObject(controlPollutantDetailObject, Field.pollutantCode, Field.pollutantCode);
				Number percentControlMeasuresReductionEfficiency = utilities.Format.getNumericFieldValueFromObject(controlPollutantDetailObject, Field.percentControlMeasuresReductionEfficiency);

				Connection connection = postgreSQL.getConnection();
		        PreparedStatement preparedStatement = connection.prepareStatement(SQL.INSERT_CONTROL_POLLUTANT.label, PreparedStatement.RETURN_GENERATED_KEYS);
		        preparedStatement.setLong(1, controlId);
		        preparedStatement.setString(2, pollutantCode);
		        preparedStatement.setObject(3, percentControlMeasuresReductionEfficiency, java.sql.Types.NUMERIC);
		        
		        postgreSQL.insertPreparedStatement(preparedStatement);
			}
		}
	}
}
