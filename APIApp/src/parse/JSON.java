package parse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import org.json.JSONException;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import data.Field;
import data.SQL;

public class JSON {
    private Properties properties;
    public Properties getProperties() { return this.properties; }

    public JSON(Properties properties) throws ClassNotFoundException, SQLException, IOException
    {
    	this.properties = properties;
    }    
    
	public void list(api.Invoke invoke, utilities.PostgreSQL postgreSQL, String listAPIResponse, String reportingYear) throws IOException, ClassNotFoundException, SQLException, JSONException
	{
		Object listAPIJSONStringObject = JSONValue.parse(listAPIResponse);
		JSONArray listAPIJSONArray = (JSONArray)listAPIJSONStringObject;
		
		System.out.println("Total number of reports to process: " + listAPIJSONArray.size() + "; Reporting Year: " + reportingYear);
		
		for(Object o: listAPIJSONArray) {
			if (o instanceof JSONObject) {
				JSONObject reportTrackerObject = (JSONObject)o;
				String reportId = null;
				String agencyFacilityIdentifier = null;
				String status = null;
				LocalDateTime certifiedOrModifiedDateJSON = null;
				
				
				try {
					reportId = reportTrackerObject.get(Field.reportId.toString()).toString();
					agencyFacilityIdentifier = reportTrackerObject.get(Field.agencyFacilityIdentifier.toString()).toString();
					status = reportTrackerObject.get(Field.status.toString()).toString();
					
					Object certifiedDateObject = reportTrackerObject.get(Field.certifiedDate.toString());
										
					if (certifiedDateObject != null) {
						String certifiedDateString = reportTrackerObject.get(Field.certifiedDate.toString()).toString();
						certifiedDateString = certifiedDateString.substring(0, Math.min(certifiedDateString.length(), 19));
						certifiedOrModifiedDateJSON = LocalDateTime.parse(certifiedDateString);
					}
					else {
						String modifiedDateString = reportTrackerObject.get(Field.modifiedDate.toString()).toString();
						modifiedDateString = modifiedDateString.substring(0, Math.min(modifiedDateString.length(), 19));
						certifiedOrModifiedDateJSON = LocalDateTime.parse(modifiedDateString);							
					}

					processReportTracker(invoke, postgreSQL, reportingYear, reportId,
						certifiedOrModifiedDateJSON, agencyFacilityIdentifier, status, reportTrackerObject);						
				}
				catch (Exception e) {
					utilities.Log log = new utilities.Log(properties);
			    	log.write(e);
			    }
			}
		}
		
		System.out.println("End of processing");
	}

	private void processReportTracker(api.Invoke invoke, utilities.PostgreSQL postgreSQL, String reportingYear, String reportId,
			LocalDateTime certifiedOrModifiedDateJSON, String agencyFacilityIdentifier, String status, JSONObject reportTrackerObject) throws IOException, SQLException
	{
		String state = "SKIPPED";
		String reason = null;
		List<String> certifiedStatuses = new ArrayList<>();						
		certifiedStatuses.add("SUBMITTED");
		certifiedStatuses.add("APPROVED");
		certifiedStatuses.add("ADVANCED_QA");
		certifiedStatuses.add("RETURNED");

		postgreSQL.getConnection().setAutoCommit(false);
		
		try {	
			if (certifiedStatuses.contains(status)) {
				LocalDateTime certifiedOrModifiedDate = certifiedOrModifiedDate(postgreSQL, reportingYear, agencyFacilityIdentifier);
				LocalDateTime localDateTimeStart = LocalDateTime.now();				
				System.out.println(localDateTimeStart + " " + "PROCESSING" + ": Facility Id " + agencyFacilityIdentifier + "; Report Id " + reportId + ". Please wait...");
				if (certifiedOrModifiedDate == null) {
					insertReportTracker(postgreSQL, reportTrackerObject, reportingYear, invoke, agencyFacilityIdentifier, reportId);
					reason = "Not in DB";
					state = "INSERTED";
				}
				else
				{								
					if (certifiedOrModifiedDateJSON != null)							
					{
						if (certifiedOrModifiedDateJSON.isAfter(certifiedOrModifiedDate)) {
							deleteReportTracker(postgreSQL, reportingYear, agencyFacilityIdentifier);
							insertReportTracker(postgreSQL, reportTrackerObject, reportingYear, invoke, agencyFacilityIdentifier, reportId);
							reason = "Stale DB Date";
							state = "UPDATED";							
						}
						else {
							if (certifiedOrModifiedDateJSON.isEqual(certifiedOrModifiedDate)) {
								reason = "Date match";
							}
							else {
								reason = "JSON Date prior to DB date";
							}
						}

					}
					else {
						reason = "JSON Date NULL";
					}
				}
			}
			else {
				reason = "Not in status";
			}
		}
		catch (Exception e) {
			state = "FAILED";	
			postgreSQL.getConnection().rollback();
			utilities.Log log = new utilities.Log(properties);
	    	log.write(e);
	    }
		
		LocalDateTime localDateTimeState = LocalDateTime.now();
		System.out.println(localDateTimeState + " " + state + " (" + reason + "): Facility Id: " + agencyFacilityIdentifier + "; Report Id: " + reportId + "; Status: " + status + ".");		
	}

	private void insertReportTracker(utilities.PostgreSQL postgreSQL, JSONObject reportTrackerObject,
			String reportingYear, api.Invoke invoke, String agencyFacilityIdentifier, String reportId) throws ClassNotFoundException, IOException, SQLException, JSONException, ParseException, org.json.simple.parser.ParseException
	{
		data.ReportTracker.insert(postgreSQL, reportTrackerObject, reportingYear);	
		detail(invoke, postgreSQL, agencyFacilityIdentifier, reportId);			
		postgreSQL.getConnection().commit();		
	}

	private void deleteReportTracker(utilities.PostgreSQL postgreSQL, String reportingYear, String agencyFacilityIdentifier) throws SQLException
	{
		Connection connection = postgreSQL.getConnection();
		
		PreparedStatement preparedStatement = connection.prepareStatement(SQL.DELETE_REPORT_TRACKER.label);
        preparedStatement.setShort(1, Short.valueOf(reportingYear));
		preparedStatement.setString(2, agencyFacilityIdentifier);
        preparedStatement.executeUpdate();		
	}	
	
	private void detail(api.Invoke invoke, utilities.PostgreSQL postgreSQL, String agencyFacilityIdentifier, String reportId) throws IOException, ClassNotFoundException, SQLException, JSONException, ParseException, org.json.simple.parser.ParseException
	{
		String detailAPIResponse = invoke.detail(agencyFacilityIdentifier);
		Object detailAPIJSONStringObject = JSONValue.parse(detailAPIResponse);
		JSONArray detailAPIJSONArray = (JSONArray)detailAPIJSONStringObject;
		for(Object o: detailAPIJSONArray) {
			if (o instanceof JSONObject) {
				JSONObject facilityObject = (JSONObject)o;					
				String facilitySiteJSON = facilityObject.get(Field.facilitySite.toString()).toString();
				String programSystemCode = facilityObject.get(Field.programSystemCode.toString()).toString();
				facilitySite(facilitySiteJSON, postgreSQL, agencyFacilityIdentifier, reportId, programSystemCode);
			}
		}	
	}

	private LocalDateTime certifiedOrModifiedDate(utilities.PostgreSQL postgreSQL,String reportingYear, String agencyFacilityIdentifier) throws SQLException
	{
		LocalDateTime certifiedOrModifiedDate = null;
		
		Connection connection = postgreSQL.getConnection();
    	DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");		
		PreparedStatement preparedStatement = connection.prepareStatement(SQL.SELECT_REPORT_TRACKER.label);
        preparedStatement.setShort(1, Short.valueOf(reportingYear));
		preparedStatement.setString(2, agencyFacilityIdentifier);
        ResultSet resultSet = preparedStatement.executeQuery();

        while (resultSet.next()) {
        	String certifiedDateString = resultSet.getString("certified_date");
        	if (certifiedDateString != null) {
	        	certifiedDateString = certifiedDateString.substring(0, Math.min(certifiedDateString.length(), 19));
	        	certifiedOrModifiedDate = LocalDateTime.parse(certifiedDateString, dateTimeFormatter);
        	}
        	else {
            	String modifiedDateString = resultSet.getString("created_date");
            	modifiedDateString = modifiedDateString.substring(0, Math.min(modifiedDateString.length(), 19));
            	certifiedOrModifiedDate = LocalDateTime.parse(modifiedDateString, dateTimeFormatter);
        	}     		
        }		
		
        return certifiedOrModifiedDate;
	}
	
	private void facilitySite(String facilitySiteJSON, utilities.PostgreSQL postgreSQL, String agencyFacilityIdentifier, String reportId, String programSystemCode) throws IOException, ClassNotFoundException, SQLException, JSONException, ParseException
	{
		Object facilitySiteJSONStringObject = JSONValue.parse(facilitySiteJSON);
		JSONArray facilitySiteJSONArray = (JSONArray)facilitySiteJSONStringObject;
		for(Object o: facilitySiteJSONArray) {
			if (o instanceof JSONObject) {
				JSONObject facilitySiteObject = (JSONObject)o;					
				data.FacilitySite.insert(postgreSQL, facilitySiteObject, agencyFacilityIdentifier, reportId, programSystemCode);
			}
		}	
	}
	
	public static String identification(JSONObject jSONObject, Field field)
	{		
		String identification = utilities.Format.getFieldValueFromObject(jSONObject, field);	
		Object identificationObject = JSONValue.parse(identification);
		JSONArray identificationArray = (JSONArray)identificationObject;
		String identifier = null;
		for(Object ob: identificationArray) {
			if (ob instanceof JSONObject) {
				JSONObject identificationDetailObject = (JSONObject)ob;					
				identifier = utilities.Format.getFieldValueFromObject(identificationDetailObject, Field.identifier);
			}
		}
		
		return identifier;
	}	
}
