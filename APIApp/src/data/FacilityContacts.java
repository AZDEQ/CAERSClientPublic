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

public class FacilityContacts {
	public static void insert(utilities.PostgreSQL postgreSQL, Object facilityContactsObject, long facilitySiteId) throws IOException, ClassNotFoundException, SQLException, JSONException, ParseException
	{
		JSONArray facilityContactsArray = (JSONArray)facilityContactsObject;		
		for(Object o: facilityContactsArray) {
			if (o instanceof JSONObject) {
				JSONObject facilityContactDetailObject = (JSONObject)o;
				
				String type = utilities.Format.getCodeFromBaseObject(facilityContactDetailObject, Field.type);
				String prefix = utilities.Format.getFieldValueFromObject(facilityContactDetailObject, Field.prefix);
				String firstName = utilities.Format.getFieldValueFromObject(facilityContactDetailObject, Field.firstName);
				String lastName = utilities.Format.getFieldValueFromObject(facilityContactDetailObject, Field.lastName);
				String email = utilities.Format.getFieldValueFromObject(facilityContactDetailObject, Field.email);
				String phone = utilities.Format.getFieldValueFromObject(facilityContactDetailObject, Field.phone);
				String phoneExt = utilities.Format.getFieldValueFromObject(facilityContactDetailObject, Field.phoneExt);

				String streetAddress = utilities.Format.getFieldValueFromObject(facilityContactDetailObject, Field.streetAddress);	
				Object streetAddressObject = JSONValue.parse(streetAddress);
				JSONObject streetAddressJSONObject = (JSONObject)streetAddressObject;
				String addressText = utilities.Format.getFieldValueFromObject(streetAddressJSONObject, Field.addressText);
				String localityName = utilities.Format.getFieldValueFromObject(streetAddressJSONObject, Field.localityName);			
				String countyCode = utilities.Format.getCodeFromBaseObject(streetAddressJSONObject, Field.county);
				String fipsCode = utilities.Format.getFieldValueFromBaseObject(streetAddressJSONObject, Field.state, Field.fipsCode);
				String countryCode = utilities.Format.getCodeFromBaseObject(streetAddressJSONObject, Field.country);
				String postalCode = utilities.Format.getFieldValueFromObject(streetAddressJSONObject, Field.postalCode);			

				String mailingStreetAddress = utilities.Format.getFieldValueFromObject(facilityContactDetailObject, Field.mailingStreetAddress);	
				Object mailingStreetAddressObject = JSONValue.parse(mailingStreetAddress);
				JSONObject mailingStreetAddressJSONObject = (JSONObject)mailingStreetAddressObject;
				String mailingAddressText = utilities.Format.getFieldValueFromObject(mailingStreetAddressJSONObject, Field.addressText);
				String mailingLocalityName = utilities.Format.getFieldValueFromObject(mailingStreetAddressJSONObject, Field.localityName);			
				String mailingFipsCode = utilities.Format.getFieldValueFromBaseObject(mailingStreetAddressJSONObject, Field.state, Field.fipsCode);
				String mailingCountryCode = utilities.Format.getCodeFromBaseObject(mailingStreetAddressJSONObject, Field.country);
				String mailingPostalCode = utilities.Format.getFieldValueFromObject(mailingStreetAddressJSONObject, Field.postalCode);			
				
				Connection connection = postgreSQL.getConnection();
		        PreparedStatement preparedStatement = connection.prepareStatement(SQL.INSERT_FACILITY_CONTACTS.label, PreparedStatement.RETURN_GENERATED_KEYS);
		        preparedStatement.setLong(1, facilitySiteId);
		        preparedStatement.setString(2, type);                                            
		        preparedStatement.setString(3, prefix);                
		        preparedStatement.setString(4, firstName);
		        preparedStatement.setString(5, lastName);		        	                
		        preparedStatement.setString(6, email);  
		        preparedStatement.setString(7, phone);
		        preparedStatement.setString(8, phoneExt);
		        
		        preparedStatement.setString(9, addressText);
		        preparedStatement.setString(10, localityName); 
		        preparedStatement.setString(11, fipsCode);
		        preparedStatement.setString(12, countryCode);
		        preparedStatement.setString(13, postalCode);

		        preparedStatement.setString(14, mailingAddressText);
		        preparedStatement.setString(15, mailingLocalityName); 
		        preparedStatement.setString(16, mailingFipsCode);
		        preparedStatement.setString(17, mailingCountryCode);
		        preparedStatement.setString(18, mailingPostalCode);
		        
		        preparedStatement.setString(19, countyCode);	
		        
		        postgreSQL.insertPreparedStatement(preparedStatement);							
			}
		}		
	}	
}
