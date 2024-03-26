package utilities;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.NumberFormat;
import java.text.ParseException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import data.Field;

public class Format {
	public static String getFieldValueFromObject(JSONObject baseObject, Field field)
	{
		String fieldValue = null;
		if (baseObject != null)
		{
			Object baseObjectFieldObject = baseObject.get(field.toString());
			if (baseObjectFieldObject != null) {
					fieldValue = baseObjectFieldObject.toString();
			}
		}
		
		return fieldValue;
	}		
	
	public static String getFieldValueFromBaseObject(JSONObject baseObject, Field field, Field childField)
	{
		String code = null;
		if (baseObject != null)
		{
			Object baseObjectFieldObject = ((JSONObject)baseObject).get(field.toString());
			if (baseObjectFieldObject != null)
			{
				String fieldJSON = baseObjectFieldObject.toString();
				Object fieldObject = JSONValue.parse(fieldJSON);
				if (fieldObject != null) {
					Object fieldCodeObject = ((JSONObject)fieldObject).get(childField.toString());
					code = (fieldCodeObject != null) ? fieldCodeObject.toString().toString() : null;
				}
			}
		}
		  
		return code;
	}

	public static Number getNumericFieldValueFromBaseObject(JSONObject baseObject, Field field, Field childField) throws ParseException
	{
		Number fieldValueNumber = null;
		if (baseObject != null)
		{
			Object baseObjectFieldObject = ((JSONObject)baseObject).get(field.toString());
			if (baseObjectFieldObject != null)
			{
				String fieldJSON = baseObjectFieldObject.toString();
				Object fieldObject = JSONValue.parse(fieldJSON);
				if (fieldObject != null) {
					Object fieldCodeObject = ((JSONObject)fieldObject).get(childField.toString());
					String code = (fieldCodeObject != null) ? fieldCodeObject.toString().toString() : null;
					if (code != null)
					{
						fieldValueNumber = NumberFormat.getInstance().parse(code);
					}
				}
			}
		}
		  
		return fieldValueNumber;
	}	

	public static String getFieldValueFromArray(String baseString, Field field) throws ParseException
	{
		Object baseObject = JSONValue.parse(baseString);
		JSONArray baseObjectArray = (JSONArray)baseObject;	
		String fieldValue = null;
		for(Object o: baseObjectArray) {
			if (o instanceof JSONObject) {	
				JSONObject detailObject = (JSONObject)o;
				fieldValue = utilities.Format.getFieldValueFromObject(detailObject, field);
			}
		}
		
		return fieldValue;
	}	
	
	public static String getCodeFromBaseObject(JSONObject baseObject, Field field)
	{
		String code = getFieldValueFromBaseObject(baseObject, field, Field.code);
		return code;
	}
	
	public static Number getNumericFieldValueFromObject(JSONObject baseObject, Field field) throws ParseException
	{
		Number fieldValueNumber = null;
		if (baseObject != null)
		{
			Object baseObjectFieldObject = baseObject.get(field.toString());
			if (baseObjectFieldObject != null) {
					String fieldValue = baseObjectFieldObject.toString();
					fieldValueNumber = NumberFormat.getInstance().parse(fieldValue);
			}
		}
		
		return fieldValueNumber;
	}

	public static Date getDateFieldValueFromObject(JSONObject baseObject, Field field) throws ParseException
	{
		Date fieldValueDate = null;
		if (baseObject != null)
		{
			Object baseObjectFieldObject = baseObject.get(field.toString());
			if (baseObjectFieldObject != null) {
					String fieldValue = baseObjectFieldObject.toString();
					fieldValueDate = Date.valueOf(fieldValue);
			}
		}
		
		return fieldValueDate;
	}
	
	public static Date getDateFieldValueFromObject1(JSONObject baseObject, Field field) throws ParseException
	{
		Date fieldValueDate = null;
		if (baseObject != null)
		{
			Object baseObjectFieldObject = baseObject.get(field.toString());
			if (baseObjectFieldObject != null) {
					String fieldValue = baseObjectFieldObject.toString();
					fieldValue = fieldValue.substring(0, Math.min(fieldValue.length(), 19));
					fieldValue = fieldValue.replace('T', ' ');
					DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
					LocalDateTime fieldValueLocalDateTime = LocalDateTime.parse(fieldValue, dateTimeFormatter);
					fieldValueDate = java.sql.Date.valueOf(fieldValueLocalDateTime.toLocalDate());
			}
		}
		
		return fieldValueDate;
	}
	
	public static java.sql.Timestamp getTimestampFieldValueFromObject(JSONObject baseObject, Field field) throws ParseException
	{
		java.sql.Timestamp fieldValueTimestamp = null;
		if (baseObject != null)
		{
			Object baseObjectFieldObject = baseObject.get(field.toString());
			if (baseObjectFieldObject != null) {
					String fieldValue = baseObjectFieldObject.toString();
					fieldValue = fieldValue.substring(0, Math.min(fieldValue.length(), 19));
					fieldValue = fieldValue.replace('T', ' ');
					fieldValueTimestamp = Timestamp.valueOf(fieldValue);
			}
		}
		
		return fieldValueTimestamp;
	}	
}
