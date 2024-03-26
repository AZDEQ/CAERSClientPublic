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

import parse.JSON;

public class ReleasePoints {
	public static void insert(utilities.PostgreSQL postgreSQL, Object releasePointsObject, long facilitySiteId) throws IOException, ClassNotFoundException, SQLException, JSONException, ParseException
	{
		JSONArray releasePointsArray = (JSONArray)releasePointsObject;		
		for(Object o: releasePointsArray) {
			if (o instanceof JSONObject) {
				JSONObject releasePointDetailObject = (JSONObject)o;		
				String releasePointTypeCode = utilities.Format.getFieldValueFromBaseObject(releasePointDetailObject, Field.releasePointTypeCode, Field.code);
				String releasePointIdentifier = JSON.identification(releasePointDetailObject, Field.identification);
				String description = utilities.Format.getFieldValueFromObject(releasePointDetailObject, Field.description);

				String stackHeight = utilities.Format.getFieldValueFromObject(releasePointDetailObject, Field.stackHeight);	
				Object stackHeightObject = JSONValue.parse(stackHeight);
				JSONObject stackHeightJSONObject = (JSONObject)stackHeightObject;				
				
				Number stackHeightValue = utilities.Format.getNumericFieldValueFromObject(stackHeightJSONObject, Field.value);				
				String stackHeightUnitCode = utilities.Format.getFieldValueFromBaseObject(stackHeightJSONObject, Field.unit, Field.code);
								
				String stackDiameter = utilities.Format.getFieldValueFromObject(releasePointDetailObject, Field.stackDiameter);	
				Object stackDiameterObject = JSONValue.parse(stackDiameter);
				JSONObject stackDiameterJSONObject = (JSONObject)stackDiameterObject;				

				Number stackDiameterValue = utilities.Format.getNumericFieldValueFromObject(stackDiameterJSONObject, Field.value);
				String stackDiameterUnitCode = utilities.Format.getFieldValueFromBaseObject(stackDiameterJSONObject, Field.unit, Field.code);
					
				String exitGasFlowRate = utilities.Format.getFieldValueFromObject(releasePointDetailObject, Field.exitGasFlowRate);	
				Object exitGasFlowRateObject = JSONValue.parse(exitGasFlowRate);
				JSONObject exitGasFlowRateJSONObject = (JSONObject)exitGasFlowRateObject;				
								
				Number exitGasFlowRateValue = utilities.Format.getNumericFieldValueFromObject(exitGasFlowRateJSONObject, Field.value);
				String exitGasFlowRateUnitCode = utilities.Format.getFieldValueFromBaseObject(exitGasFlowRateJSONObject, Field.unit, Field.code);
		
				String exitGasVelocity = utilities.Format.getFieldValueFromObject(releasePointDetailObject, Field.exitGasVelocity);	
				Object exitGasVelocityObject = JSONValue.parse(exitGasVelocity);
				JSONObject exitGasVelocityJSONObject = (JSONObject)exitGasVelocityObject;				
				Number exitGasVelocityValue = utilities.Format.getNumericFieldValueFromObject(exitGasVelocityJSONObject, Field.value);				
				String exitGasVelocityUnitCode = utilities.Format.getFieldValueFromBaseObject(exitGasVelocityJSONObject, Field.unit, Field.code);
						
				Number exitGasTemperature = utilities.Format.getNumericFieldValueFromObject(releasePointDetailObject, Field.exitGasTemperature);
				
				String statusCode = utilities.Format.getCodeFromBaseObject(releasePointDetailObject, Field.statusCode);					
				Number statusCodeYear = utilities.Format.getNumericFieldValueFromObject(releasePointDetailObject, Field.statusCodeYear);
				
				Number latitudeMeasure = utilities.Format.getNumericFieldValueFromBaseObject(releasePointDetailObject, Field.releasePointGeographicCoordinates, Field.latitudeMeasure);
				Number longitudeMeasure = utilities.Format.getNumericFieldValueFromBaseObject(releasePointDetailObject, Field.releasePointGeographicCoordinates, Field.longitudeMeasure);
				
				Number midPoint2LatitudeMeasure = utilities.Format.getNumericFieldValueFromBaseObject(releasePointDetailObject, Field.releasePointGeographicCoordinates, Field.midPoint2LatitudeMeasure);
				Number midPoint2LongitudeMeasure = utilities.Format.getNumericFieldValueFromBaseObject(releasePointDetailObject, Field.releasePointGeographicCoordinates, Field.midPoint2LongitudeMeasure);

				String fenceLineDistance = utilities.Format.getFieldValueFromObject(releasePointDetailObject, Field.fenceLineDistance);	
				Object fenceLineDistanceObject = JSONValue.parse(fenceLineDistance);
				JSONObject fenceLineDistanceJSONObject = (JSONObject)fenceLineDistanceObject;				
				Number fenceLineDistanceValue = utilities.Format.getNumericFieldValueFromObject(fenceLineDistanceJSONObject, Field.value);				
				String fenceLineDistanceUnitCode = utilities.Format.getFieldValueFromBaseObject(fenceLineDistanceJSONObject, Field.unit, Field.code);		
				
				String fugitiveHeight = utilities.Format.getFieldValueFromObject(releasePointDetailObject, Field.fugitiveHeight);	
				Object fugitiveHeightObject = JSONValue.parse(fugitiveHeight);
				JSONObject fugitiveHeightJSONObject = (JSONObject)fugitiveHeightObject;				
				Number fugitiveHeightValue = utilities.Format.getNumericFieldValueFromObject(fugitiveHeightJSONObject, Field.value);				
				String fugitiveHeightUnitCode = utilities.Format.getFieldValueFromBaseObject(fugitiveHeightJSONObject, Field.unit, Field.code);
										
				String stackWidth = utilities.Format.getFieldValueFromObject(releasePointDetailObject, Field.stackWidth);	
				Object stackWidthObject = JSONValue.parse(stackWidth);
				JSONObject stackWidthJSONObject = (JSONObject)stackWidthObject;				
				Number stackWidthValue = utilities.Format.getNumericFieldValueFromObject(stackWidthJSONObject, Field.value);				
				String stackWidthUnitCode = utilities.Format.getFieldValueFromBaseObject(stackWidthJSONObject, Field.unit, Field.code);
						
				String stackLength = utilities.Format.getFieldValueFromObject(releasePointDetailObject, Field.stackLength);	
				Object stackLengthObject = JSONValue.parse(stackLength);
				JSONObject stackLengthJSONObject = (JSONObject)stackLengthObject;				
				Number stackLengthValue = utilities.Format.getNumericFieldValueFromObject(stackLengthJSONObject, Field.value);				
				String stackLengthUnitCode = utilities.Format.getFieldValueFromBaseObject(stackLengthJSONObject, Field.unit, Field.code);					
				
				Connection connection = postgreSQL.getConnection();
	            PreparedStatement preparedStatement = connection.prepareStatement(SQL.INSERT_RELEASE_POINT.label, PreparedStatement.RETURN_GENERATED_KEYS);
                preparedStatement.setLong(1, facilitySiteId);
                preparedStatement.setString(2, releasePointIdentifier);                                            
                preparedStatement.setString(3, releasePointTypeCode);                
                preparedStatement.setString(4, description);
                preparedStatement.setObject(5, stackHeightValue, java.sql.Types.NUMERIC);
                
                preparedStatement.setString(6, stackHeightUnitCode);	                
                preparedStatement.setObject(7, stackDiameterValue, java.sql.Types.NUMERIC);	  
                preparedStatement.setString(8, stackDiameterUnitCode);
                preparedStatement.setObject(9, exitGasVelocityValue, java.sql.Types.NUMERIC);
                preparedStatement.setString(10, exitGasVelocityUnitCode);
                
                preparedStatement.setObject(11, exitGasTemperature, java.sql.Types.NUMERIC);	                
                preparedStatement.setObject(12, exitGasFlowRateValue, java.sql.Types.NUMERIC);	  
                preparedStatement.setString(13, exitGasFlowRateUnitCode);
                preparedStatement.setString(14, statusCode);
                preparedStatement.setObject(15, statusCodeYear, java.sql.Types.NUMERIC);	                

                preparedStatement.setObject(16, latitudeMeasure, java.sql.Types.NUMERIC);
                preparedStatement.setObject(17, longitudeMeasure, java.sql.Types.NUMERIC);
                preparedStatement.setObject(18, midPoint2LatitudeMeasure, java.sql.Types.NUMERIC);
                preparedStatement.setObject(19, midPoint2LongitudeMeasure, java.sql.Types.NUMERIC);
                preparedStatement.setObject(20, fenceLineDistanceValue, java.sql.Types.NUMERIC);
                                
                preparedStatement.setString(21, fenceLineDistanceUnitCode);
                preparedStatement.setObject(22, fugitiveHeightValue, java.sql.Types.NUMERIC);                                            
                preparedStatement.setString(23, fugitiveHeightUnitCode);                
                preparedStatement.setObject(24, stackWidthValue, java.sql.Types.NUMERIC);
                preparedStatement.setObject(25, stackLengthValue, java.sql.Types.NUMERIC);
  
                preparedStatement.setString(26, stackWidthUnitCode);                
                preparedStatement.setString(27, stackLengthUnitCode);
                
                postgreSQL.insertPreparedStatement(preparedStatement);				
			}
		}		
	}	
}
