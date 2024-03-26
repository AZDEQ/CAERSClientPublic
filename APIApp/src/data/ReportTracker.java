package data;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;


import org.json.JSONException;
import org.json.simple.JSONObject;

public class ReportTracker {	
	public static void insert(utilities.PostgreSQL postgreSQL, JSONObject agencyFacilityObject, String reportingYear) throws IOException, ClassNotFoundException, SQLException, JSONException, ParseException
	{
		long reportId = Long.parseLong(agencyFacilityObject.get(Field.reportId.toString()).toString());
		String agencyFacilityIdentifier = agencyFacilityObject.get(Field.agencyFacilityIdentifier.toString()).toString();
		short reportingYearShort = Short.parseShort(reportingYear); 
		java.sql.Timestamp certifiedDate = utilities.Format.getTimestampFieldValueFromObject(agencyFacilityObject, Field.certifiedDate);
		java.sql.Timestamp modifiedDate = utilities.Format.getTimestampFieldValueFromObject(agencyFacilityObject, Field.modifiedDate);

		Connection connection = postgreSQL.getConnection();		

		PreparedStatement preparedStatement = connection.prepareStatement(SQL.INSERT_REPORT_TRACKER.label, PreparedStatement.RETURN_GENERATED_KEYS);
		preparedStatement.setLong(1, reportId);
		preparedStatement.setString(2, agencyFacilityIdentifier);
		preparedStatement.setShort(3, reportingYearShort);
		preparedStatement.setObject(4, certifiedDate, java.sql.Types.TIMESTAMP);
		preparedStatement.setObject(5, modifiedDate, java.sql.Types.TIMESTAMP);
		
		postgreSQL.insertPreparedStatement(preparedStatement);
	}		
}
