package data;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;

import org.json.JSONException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

//Insert values in the facility_naics_xref table such as facility_site_id, naics_code, naics_code_type
//after parsing the detail JSON.

public class FacilityNAICSXref {	
	public static void insert(utilities.PostgreSQL postgreSQL, Object facilityNAICSXrefObject, long facilitySiteId) throws IOException, ClassNotFoundException, SQLException, JSONException, ParseException
	{
		JSONArray facilityNAICSXrefArray = (JSONArray)facilityNAICSXrefObject;
		for(Object o: facilityNAICSXrefArray) {
			if (o instanceof JSONObject) {
				JSONObject facilityNAICSXrefDetailObject = (JSONObject)o;
				Number nAICSCode = utilities.Format.getNumericFieldValueFromObject(facilityNAICSXrefDetailObject, Field.code);
				String nAICSCodeType = utilities.Format.getFieldValueFromObject(facilityNAICSXrefDetailObject, Field.naicsCodeType);
				
				Connection connection = postgreSQL.getConnection();
	            PreparedStatement preparedStatement = connection.prepareStatement(SQL.INSERT_FACILITY_NAICS_XREF.label, PreparedStatement.RETURN_GENERATED_KEYS);

                preparedStatement.setLong(1, facilitySiteId);
                preparedStatement.setObject(2, nAICSCode, java.sql.Types.NUMERIC);                
                preparedStatement.setString(3, nAICSCodeType);	  
              
                postgreSQL.insertPreparedStatement(preparedStatement);				
			}
		}
	}	
}
