package data;

// CRUD Templates used for PostgreSQL

public enum SQL {
	DELETE_REPORT_TRACKER(
			"DELETE FROM report_tracker WHERE reporting_year = ? and agency_facility_identifier = ?"),	
	INSERT_CONTROL_ASSIGNMENT("INSERT INTO control_assignment ("
			+ "control_id, control_path_id, control_path_child_id, sequence_number, percent_apportionment)"
			+ " VALUES ("
			+ "?, ?, ?, ?, ?);"),
	INSERT_CONTROL_PATH_POLLUTANT("INSERT INTO control_path_pollutant ("
			+ "control_path_id, pollutant_code, percent_reduction)"
			+ " VALUES ("
			+ "?, ?, ?);"),		
	INSERT_CONTROL_PATH("INSERT INTO control_path ("
			+ "facility_site_id, description, path_id, percent_control)"
			+ " VALUES ("
			+ "?, ?, ?, ?);"),	
	INSERT_CONTROL_POLLUTANT("INSERT INTO control_pollutant ("
			+ "control_id, pollutant_code, percent_reduction)"
			+ " VALUES ("
			+ "?, ?, ?);"),
	INSERT_CONTROL("INSERT INTO control ("
			+ "facility_site_id, identifier, description, percent_control, status_code, "
			+ "comments, control_measure_code, number_operating_months, start_date, end_date, "
			+ "upgrade_date, upgrade_description, status_year)"
			+ " VALUES ("
			+ "?, ?, ?, ?, ?, "
			+ "?, ?, ?, ?, ?, "
			+ "?, ?, ?);"),
	INSERT_EMISSION(
			"INSERT INTO emission ("
			+ "reporting_period_id, pollutant_code, total_emissions, emissions_uom_code, emissions_factor, "
			+ "emissions_factor_text, emissions_calc_method_code, comments, emissions_numerator_uom, emissions_denominator_uom, "
			+ "calculated_emissions_tons, emissions_factor_formula, total_manual_entry, calculation_comment, overall_control_percent)"
			+ " VALUES ("
			+ "?, ?, ?, ?, ?, "
			+ "?, ?, ?, ?, ?, "
			+ "?, ?, ?, ?, ?);"),
	INSERT_EMISSIONS_PROCESS(
			"INSERT INTO emissions_process ("
			+ "emissions_unit_id, emissions_process_identifier, status_code, status_year, scc_code, "
			+ "scc_short_name, description, aircraft_engine_type_code, comments, scc_description, "
			+ "is_billable)"
			+ " VALUES ("
			+ "?, ?, ?, ?, ?, "
			+ "?, ?, ?, ?, ?, "
			+ "?);"),
	INSERT_EMISSIONS_UNIT(
			"INSERT INTO emissions_unit ("
			+ "facility_site_id, unit_identifier, description, type_code, status_code, "
			+ "status_year, unit_measure_cd, comments, design_capacity)"
			+ " VALUES ("
			+ "?, ?, ?, ?, ?, "
			+ "?, ?, ?, ?);"),	
	INSERT_FACILITY_CONTACTS("INSERT INTO facility_site_contact ("
			+ "facility_site_id, type, prefix, first_name, last_name, "
			+ "email, phone, phone_ext, street_address, city, "
			+ "state_code, country_code, postal_code, mailing_street_address, mailing_city, "
			+ " mailing_state_code, mailing_country_code, mailing_postal_code, county_code)"
			+ " VALUES ("
			+ "?, ?, ?, ?, ?, "
			+ "?, ?, ?, ?, ?, "
			+ "?, ?, ?, ?, ?, "
			+ "?, ?, ?, ?);"),		
	INSERT_FACILITY_NAICS_XREF("INSERT INTO facility_naics_xref ("
			+ "facility_site_id, naics_code, naics_code_type)"
			+ " VALUES (?, ?, ?);"),
	INSERT_FACILITY_SITE("INSERT INTO facility_site ("
			+ "report_id, agency_facility_identifier, category_code, source_type_code, name, "
			+ "description, status_code, status_year, program_system_code, street_address, "
			+ "city, state_code, county_code, country_code, postal_code, "
			+ "mailing_street_address, mailing_city, mailing_state_code, mailing_country_code, mailing_postal_code, "
			+ "latitude, longitude)"
			+ " VALUES ("
			+ "?, ?, ?, ?, ?, "
			+ "?, ?, ?, ?, ?, "
			+ "?, ?, ?, ?, ?, "
			+ "?, ?, ?, ?, ?, "
			+ "?, ?);"),
	INSERT_OPERATING_DETAIL(
			"INSERT INTO operating_detail ("
			+ "reporting_period_id, actual_hours_per_period, avg_hours_per_day, avg_days_per_week, avg_weeks_per_period, "
			+ "percent_winter, percent_spring, percent_summer, percent_fall)"
			+ " VALUES ("
			+ "?, ?, ?, ?, ?, "
			+ "?, ?, ?, ?);"),
	INSERT_RELEASE_POINT_APPT(
			"INSERT INTO release_point_appt ("
			+ "release_point_id, emissions_process_id, percent, control_path_id)"
			+ " VALUES ("
			+ "?, ?, ?, ?);"),	
	INSERT_RELEASE_POINT(
			"INSERT INTO release_point ("
			+ "facility_site_id, release_point_identifier, type_code, description, "
			+ "stack_height, stack_height_uom_code, stack_diameter, stack_diameter_uom_code, exit_gas_velocity, "
			+ "exit_gas_velocity_uom_code, exit_gas_temperature, exit_gas_flow_rate, exit_gas_flow_uom_code, status_code, "
			+ "status_year, latitude, longitude, fugitive_mid_pt2_latitude, fugitive_mid_pt2_longitude, "
			+ "fence_line_distance, fence_line_distance_uom_code, fugitive_height, fugitive_height_uom_code, stack_width, "
			+ "stack_length, stack_width_uom_code, stack_length_uom_code)"
			+ " VALUES ("
			+ "?, ?, ?, ?, ?, "
			+ "?, ?, ?, ?, ?, "
			+ "?, ?, ?, ?, ?, "
			+ "?, ?, ?, ?, ?, "
			+ "?, ?, ?, ?, ?, "
			+ "?, ?);"),
	INSERT_REPORTING_PERIOD(
			"INSERT INTO reporting_period ("
			+ "emissions_process_id, reporting_period_type_code, emissions_operating_type_code, calculation_parameter_type_code, calculation_parameter_value, "
			+ "calculation_parameter_uom, calculation_material_code, comments, fuel_use_value, fuel_use_uom, "
			+ "fuel_use_material_code, heat_content_value, heat_content_uom)"
			+ " VALUES ("
			+ "?, ?, ?, ?, ?, "
			+ "?, ?, ?, ?, ?, "
			+ "?, ?, ?);"),	
//	INSERT_REPORT_TRACKER("INSERT INTO report_tracker ("
//			+ "id, agency_facility_identifier, reporting_year, certified_date, created_date)"
//			+ " VALUES ("
//			+ "%s, '%s', %s, '%s', '%s');"),
	INSERT_REPORT_TRACKER("INSERT INTO report_tracker ("
			+ "id, agency_facility_identifier, reporting_year, certified_date, created_date)"
			+ " VALUES ("
			+ "?, ?, ?, ?, ?);"),	
	SELECT_CONTROL_IDENTIFICATION(
			"SELECT id FROM control WHERE facility_site_id = ? and identifier = ?"),		
	SELECT_CONTROL_PATH(
			"SELECT id FROM control_path WHERE facility_site_id = ? and path_id = ?"),
	SELECT_CONTROL_PATH_IDENTIFICATION(
			"SELECT id FROM control_path WHERE facility_site_id = ? and path_id = ?"),	
	SELECT_RELEASE_POINT(
			"SELECT id FROM release_point WHERE facility_site_id = ? and release_point_identifier = ?"),
	SELECT_REPORT_TRACKER(
			"SELECT certified_date, created_date FROM report_tracker WHERE reporting_year = ? and agency_facility_identifier = ?"),
	UPDATE_CONTROL_ASSIGNMENT("UPDATE control_assignment SET control_path_child_id = ? WHERE control_path_id = ?");	
    public final String label;

    private SQL(String label) {
        this.label = label;
    }
}
