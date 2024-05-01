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

//Insert values in the facility_site_contact table such as
//emissions_process_id, reporting_period_type_code, emissions_operating_type_code, calculation_parameter_type_code, calculation_parameter_value,
//calculation_parameter_uom, calculation_material_code, comments, fuel_use_value, fuel_use_uom,
//fuel_use_material_code, heat_content_value, heat_content_uom
//after parsing the detail JSON.
//Insert Emissions and OperatingDetails after inserting facility_site_contact

public class ReportingPeriods {
	public static void insert(utilities.PostgreSQL postgreSQL, Object reportingPeriodsObject, long emissionsProcessId) throws IOException, ClassNotFoundException, SQLException, JSONException, ParseException
	{
		JSONArray reportingPeriodsArray = (JSONArray)reportingPeriodsObject;		
		for(Object o: reportingPeriodsArray) {
			if (o instanceof JSONObject) {
				JSONObject reportingPeriodDetailObject = (JSONObject)o;				
				String reportingPeriodTypeCode = utilities.Format.getCodeFromBaseObject(reportingPeriodDetailObject, Field.reportingPeriodTypeCode);
				String emissionsOperatingTypeCode = utilities.Format.getCodeFromBaseObject(reportingPeriodDetailObject, Field.emissionsOperatingTypeCode);
				String calculationParameterTypeCode = utilities.Format.getCodeFromBaseObject(reportingPeriodDetailObject, Field.calculationParameterTypeCode);

				String calculationParameter = utilities.Format.getFieldValueFromObject(reportingPeriodDetailObject, Field.calculationParameter);	
				Object calculationParameterObject = JSONValue.parse(calculationParameter);
				JSONObject calculationParameterJSONObject = (JSONObject)calculationParameterObject;				
				Number calculationParameterValue = utilities.Format.getNumericFieldValueFromObject(calculationParameterJSONObject, Field.value);				
				String calculationParameterUnitCode = utilities.Format.getFieldValueFromBaseObject(calculationParameterJSONObject, Field.unit, Field.code);
				
				String calculationMaterialCode = utilities.Format.getCodeFromBaseObject(reportingPeriodDetailObject, Field.calculationMaterialCode);
				String comment = utilities.Format.getFieldValueFromObject(reportingPeriodDetailObject, Field.comment);	

				String fuelUse = utilities.Format.getFieldValueFromObject(reportingPeriodDetailObject, Field.fuelUse);	
				Object fuelUseObject = JSONValue.parse(fuelUse);
				JSONObject fuelUseJSONObject = (JSONObject)fuelUseObject;				
				Number fuelUseValue = utilities.Format.getNumericFieldValueFromObject(fuelUseJSONObject, Field.value);				
				String fuelUseUnitCode = utilities.Format.getFieldValueFromBaseObject(fuelUseJSONObject, Field.unit, Field.code);
				
				String fuelUseMaterialCode = utilities.Format.getCodeFromBaseObject(reportingPeriodDetailObject, Field.fuelUseMaterialCode);

				String heatContent = utilities.Format.getFieldValueFromObject(reportingPeriodDetailObject, Field.heatContent);	
				Object heatContentObject = JSONValue.parse(heatContent);
				JSONObject heatContentJSONObject = (JSONObject)heatContentObject;				
				Number heatContentValue = utilities.Format.getNumericFieldValueFromObject(heatContentJSONObject, Field.value);				
				String heatContentUnitCode = utilities.Format.getFieldValueFromBaseObject(heatContentJSONObject, Field.unit, Field.code);	

				Connection connection = postgreSQL.getConnection();
	            PreparedStatement preparedStatement = connection.prepareStatement(SQL.INSERT_REPORTING_PERIOD.label, PreparedStatement.RETURN_GENERATED_KEYS);
                preparedStatement.setLong(1, emissionsProcessId);
                preparedStatement.setString(2, reportingPeriodTypeCode);                                            
                preparedStatement.setString(3, emissionsOperatingTypeCode);                
                preparedStatement.setString(4, calculationParameterTypeCode);
                preparedStatement.setObject(5, calculationParameterValue, java.sql.Types.NUMERIC);
                
                preparedStatement.setString(6, calculationParameterUnitCode);	                
                preparedStatement.setString(7, calculationMaterialCode);	  
                preparedStatement.setString(8, comment);
                preparedStatement.setObject(9, fuelUseValue, java.sql.Types.NUMERIC);
                preparedStatement.setString(10, fuelUseUnitCode);
                
                preparedStatement.setString(11, fuelUseMaterialCode);	                
                preparedStatement.setObject(12, heatContentValue, java.sql.Types.NUMERIC);	  
                preparedStatement.setString(13, heatContentUnitCode);
                             
                long id = postgreSQL.insertPreparedStatement(preparedStatement);
	            					
				String emissions = utilities.Format.getFieldValueFromObject(reportingPeriodDetailObject, Field.emissions);
				Object emissionsObject = JSONValue.parse(emissions);
				Emissions.insert(postgreSQL, emissionsObject, id);
				
				String operatingDetails = utilities.Format.getFieldValueFromObject(reportingPeriodDetailObject, Field.operatingDetails);
				Object operatingDetailsObject = JSONValue.parse(operatingDetails);
				OperatingDetails.insert(postgreSQL, operatingDetailsObject, id);				
			}
		}		
	}	
}
