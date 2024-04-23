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

//Insert values in the emission table such as reporting_period_id, pollutant_code, total_emissions, emissions_uom_code, emissions_factor,
//emissions_factor_text, emissions_calc_method_code, comments, emissions_numerator_uom, emissions_denominator_uom,
//calculated_emissions_tons, emissions_factor_formula, total_manual_entry, calculation_comment, overall_control_percent
//after parsing the detail JSON.

public class Emissions {
	public static void insert(utilities.PostgreSQL postgreSQL, Object emissionsObject, long reportingPeriodId) throws IOException, ClassNotFoundException, SQLException, JSONException, ParseException
	{
		JSONArray emissionsArray = (JSONArray)emissionsObject;		
		for(Object o: emissionsArray) {
			if (o instanceof JSONObject) {
				JSONObject emissionDetailJSONObject = (JSONObject)o;	
				
				String pollutantCode = utilities.Format.getFieldValueFromBaseObject(emissionDetailJSONObject, Field.pollutantCode, Field.pollutantCode);
				
				String totalEmissions = utilities.Format.getFieldValueFromObject(emissionDetailJSONObject, Field.totalEmissions);	
				Object totalEmissionsObject = JSONValue.parse(totalEmissions);
				JSONObject totalEmissionsJSONObject = (JSONObject)totalEmissionsObject;				
				Number totalEmissionsValue = utilities.Format.getNumericFieldValueFromObject(totalEmissionsJSONObject, Field.value);				
				
				String totalEmissionsUnitCode = utilities.Format.getFieldValueFromBaseObject(totalEmissionsJSONObject, Field.unit, Field.code);
				
				Number emissionFactor = utilities.Format.getNumericFieldValueFromObject(emissionDetailJSONObject, Field.emissionFactor);//				Number emissionFactorNumber = NumberFormat.getInstance().parse(emissionFactor);
				
				String emissionFactorText = utilities.Format.getFieldValueFromObject(emissionDetailJSONObject, Field.emissionFactorText);								
				String emissionCalculationMethodCode = utilities.Format.getCodeFromBaseObject(emissionDetailJSONObject, Field.emissionCalculationMethodCode);
				String comment = utilities.Format.getFieldValueFromObject(emissionDetailJSONObject, Field.comment);
				
				String emissionFactorNumeratorUnitofMeasureCode = utilities.Format.getCodeFromBaseObject(emissionDetailJSONObject, Field.emissionFactorNumeratorUnitofMeasureCode);
				String emissionFactorDenominatorUnitofMeasureCode = utilities.Format.getCodeFromBaseObject(emissionDetailJSONObject, Field.emissionFactorDenominatorUnitofMeasureCode);
				
				Number calculatedEmissionsTons = utilities.Format.getNumericFieldValueFromObject(emissionDetailJSONObject, Field.calculatedEmissionsTons);			
				
				String emissionFactorFormula = utilities.Format.getFieldValueFromObject(emissionDetailJSONObject, Field.emissionFactorFormula);
				String totalManualEntryString = utilities.Format.getFieldValueFromObject(emissionDetailJSONObject, Field.totalManualEntry);
				Boolean totalManualEntry = totalManualEntryString.equals("'true'");
				String calculationComment = utilities.Format.getFieldValueFromObject(emissionDetailJSONObject, Field.calculationComment);
				Number overallControlPercent = utilities.Format.getNumericFieldValueFromObject(emissionDetailJSONObject, Field.overallControlPercent);				
				
				Connection connection = postgreSQL.getConnection();
	            PreparedStatement preparedStatement = connection.prepareStatement(SQL.INSERT_EMISSION.label, PreparedStatement.RETURN_GENERATED_KEYS);
                preparedStatement.setLong(1, reportingPeriodId);
                preparedStatement.setString(2, pollutantCode);                                            
                preparedStatement.setObject(3, totalEmissionsValue, java.sql.Types.NUMERIC);                
                preparedStatement.setString(4, totalEmissionsUnitCode);
                preparedStatement.setObject(5, emissionFactor, java.sql.Types.NUMERIC);
                
                preparedStatement.setString(6, emissionFactorText);	                
                preparedStatement.setString(7, emissionCalculationMethodCode);	  
                preparedStatement.setString(8, comment);
                preparedStatement.setString(9, emissionFactorNumeratorUnitofMeasureCode);
                preparedStatement.setString(10, emissionFactorDenominatorUnitofMeasureCode);
                
                preparedStatement.setObject(11, calculatedEmissionsTons, java.sql.Types.NUMERIC);	                
                preparedStatement.setString(12, emissionFactorFormula);	  
                preparedStatement.setBoolean(13, totalManualEntry);
                preparedStatement.setString(14, calculationComment);
                preparedStatement.setObject(15, overallControlPercent, java.sql.Types.NUMERIC);	                
                
                postgreSQL.insertPreparedStatement(preparedStatement);			
			}		
		}	
	}
}