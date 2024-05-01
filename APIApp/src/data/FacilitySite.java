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

//Insert values in the facility_site table such as report_id, agency_facility_identifier,
// category_code, source_type_code, name,
// description, status_code, status_year, program_system_code, street_address,
// city, state_code, county_code, country_code, postal_code,
// mailing_street_address, mailing_city, mailing_state_code, mailing_country_code, mailing_postal_code,
// latitude, longitude
//after parsing the detail JSON.
// Insert into child tables FacilityNAICSXref, ReleasePoints, Controls, ControlPaths, EmissionsUnits and 
// FacilityContacts utilizing the generated Facility Site Id.

public class FacilitySite {	
	public static void insert(utilities.PostgreSQL postgreSQL, JSONObject facilitySiteObject, String agencyFacilityIdentifier, String reportId, String programSystemCode) throws IOException, ClassNotFoundException, SQLException, JSONException, ParseException
	{
		long reportIdLong = Long.parseLong(reportId);  
		
		String facilityCategoryCode = utilities.Format.getFieldValueFromObject(facilitySiteObject, Field.facilityCategoryCode);
		String facilitySourceTypeCode = utilities.Format.getCodeFromBaseObject(facilitySiteObject, Field.facilitySourceTypeCode);
		
		String name = utilities.Format.getFieldValueFromObject(facilitySiteObject, Field.name);
		
		String description = utilities.Format.getFieldValueFromObject(facilitySiteObject, Field.description);		
		String statusCode = utilities.Format.getCodeFromBaseObject(facilitySiteObject, Field.statusCode);		
		
		Number statusCodeYear = utilities.Format.getNumericFieldValueFromObject(facilitySiteObject, Field.statusCodeYear);
		
		String facilitySiteAddress = utilities.Format.getFieldValueFromObject(facilitySiteObject, Field.facilitySiteAddress);	
		Object facilitySiteAddressObject = JSONValue.parse(facilitySiteAddress);
		JSONArray facilitySiteAddressArray = (JSONArray)facilitySiteAddressObject;
		String addressText = null;
		String localityName = null;
		String fipsCode = null;
		String countyCode = null;
		String countryCode = null;
		String postalCode = null;
		for(Object o: facilitySiteAddressArray) {
			if (o instanceof JSONObject) {
				JSONObject addressObject = (JSONObject)o;
				addressText = utilities.Format.getFieldValueFromObject(addressObject, Field.addressText);
				localityName = utilities.Format.getFieldValueFromObject(addressObject, Field.localityName);			
				fipsCode = utilities.Format.getFieldValueFromBaseObject(addressObject, Field.state, Field.fipsCode);
				countyCode = utilities.Format.getCodeFromBaseObject(addressObject, Field.county);
				countryCode = utilities.Format.getCodeFromBaseObject(addressObject, Field.country);
				postalCode = utilities.Format.getFieldValueFromObject(addressObject, Field.postalCode);
			}
		}
	
		String mailingAddress = utilities.Format.getFieldValueFromObject(facilitySiteObject, Field.mailingAddress);	
		Object mailingAddressObject = JSONValue.parse(mailingAddress);
		JSONObject addressObject = (JSONObject)mailingAddressObject;
		String addressTextMailing = utilities.Format.getFieldValueFromObject(addressObject, Field.addressText);
		String localityNameMailing = utilities.Format.getFieldValueFromObject(addressObject, Field.localityName);
		String fipsCodeMailing = utilities.Format.getFieldValueFromBaseObject(addressObject, Field.state, Field.fipsCode);
		String countryCodeMailing = utilities.Format.getCodeFromBaseObject(addressObject, Field.country);
		String postalCodeMailing = utilities.Format.getFieldValueFromObject(addressObject, Field.postalCode);
		
		String facilitySiteGeographicCoordinates = utilities.Format.getFieldValueFromObject(facilitySiteObject, Field.facilitySiteGeographicCoordinates);	
		Object facilitySiteGeographicCoordinatesObject = JSONValue.parse(facilitySiteGeographicCoordinates);
		JSONObject coordinatesObject = (JSONObject)facilitySiteGeographicCoordinatesObject;
		
		Number latitudeMeasure = utilities.Format.getNumericFieldValueFromObject(coordinatesObject, Field.latitudeMeasure);				
		Number longitudeMeasure = utilities.Format.getNumericFieldValueFromObject(coordinatesObject, Field.longitudeMeasure);
						
		Connection connection = postgreSQL.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(SQL.INSERT_FACILITY_SITE.label, PreparedStatement.RETURN_GENERATED_KEYS);
        preparedStatement.setLong(1, reportIdLong);
        preparedStatement.setString(2, agencyFacilityIdentifier);                                            
        preparedStatement.setString(3, facilityCategoryCode);                
        preparedStatement.setString(4, facilitySourceTypeCode);
        preparedStatement.setString(5, name);
        
        preparedStatement.setString(6, description);	                
        preparedStatement.setString(7, statusCode);	  
        preparedStatement.setObject(8, statusCodeYear, java.sql.Types.NUMERIC);
        preparedStatement.setString(9, programSystemCode);
        preparedStatement.setString(10, addressText);
        
        preparedStatement.setString(11, localityName);	                
        preparedStatement.setString(12, fipsCode);	  
        preparedStatement.setString(13, countyCode);
        preparedStatement.setString(14, countryCode);
        preparedStatement.setObject(15, postalCode);
        
        preparedStatement.setString(16, addressTextMailing);
        preparedStatement.setString(17, localityNameMailing);
        preparedStatement.setString(18, fipsCodeMailing);
        preparedStatement.setString(19, countryCodeMailing);
        preparedStatement.setString(20, postalCodeMailing);
        
        preparedStatement.setObject(21, latitudeMeasure, java.sql.Types.NUMERIC);
        preparedStatement.setObject(22, longitudeMeasure, java.sql.Types.NUMERIC);
        
        long id = postgreSQL.insertPreparedStatement(preparedStatement);		
				
		String facilityNAICSXref = utilities.Format.getFieldValueFromObject(facilitySiteObject, Field.facilityNAICS);	
		Object facilityNAICSXrefObject = JSONValue.parse(facilityNAICSXref);
		FacilityNAICSXref.insert(postgreSQL, facilityNAICSXrefObject, id);		
		
		String releasePoints = utilities.Format.getFieldValueFromObject(facilitySiteObject, Field.releasePoints);
		Object releasePointsObject = JSONValue.parse(releasePoints);
		ReleasePoints.insert(postgreSQL, releasePointsObject, id);
		
		String controls = utilities.Format.getFieldValueFromObject(facilitySiteObject, Field.controls);
		Object controlsObject = JSONValue.parse(controls);
		Controls.insert(postgreSQL, controlsObject, id);
		
		String controlPaths = utilities.Format.getFieldValueFromObject(facilitySiteObject, Field.controlPaths);
		Object controlPathsObject = JSONValue.parse(controlPaths);
		ControlPaths.insert(postgreSQL, controlPathsObject, id);		
		
		String emissionsUnits = utilities.Format.getFieldValueFromObject(facilitySiteObject, Field.emissionsUnits);
		Object emissionsUnitsObject = JSONValue.parse(emissionsUnits);
		EmissionsUnits.insert(postgreSQL, emissionsUnitsObject, id);

		String facilityContacts = utilities.Format.getFieldValueFromObject(facilitySiteObject, Field.facilityContacts);
		Object facilityContactsObject = JSONValue.parse(facilityContacts);
		FacilityContacts.insert(postgreSQL, facilityContactsObject, id);
	}		
}
