--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7
-- Dumped by pg_dump version 14.1

-- Started on 2024-01-29 13:54:14

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 209 (class 1259 OID 16429)
-- Name: Age; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Age" (
    "Code" integer,
    "Age" integer
);


ALTER TABLE public."Age" OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16432)
-- Name: admin_properties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_properties (
    name character varying(64) NOT NULL,
    value character varying(2000),
    label character varying(64) NOT NULL,
    description character varying(255) NOT NULL,
    datatype character varying(20) NOT NULL,
    required boolean DEFAULT true NOT NULL
);


ALTER TABLE public.admin_properties OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16438)
-- Name: agency; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.agency (
    id integer NOT NULL,
    type_code character varying(20),
    description character varying(200)
);


ALTER TABLE public.agency OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16441)
-- Name: aircraft_engine_type_code; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aircraft_engine_type_code (
    code character varying(10) NOT NULL,
    faa_aircraft_type character varying(50),
    edms_accode character varying(15),
    engine_manufacturer character varying(255),
    engine character varying(70),
    edms_uid character varying(10),
    scc character varying(10),
    last_inventory_year integer
);


ALTER TABLE public.aircraft_engine_type_code OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16444)
-- Name: attachment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.attachment (
    id bigint NOT NULL,
    report_id bigint,
    file_name character varying(255) NOT NULL,
    attachment oid NOT NULL,
    file_type character varying(1000) NOT NULL,
    comments character varying(2000),
    created_by character varying(255) NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    last_modified_by character varying(255) NOT NULL,
    last_modified_date timestamp without time zone DEFAULT now() NOT NULL,
    communication_id bigint
);


ALTER TABLE public.attachment OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16451)
-- Name: calculation_material_code; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.calculation_material_code (
    code character varying(20) NOT NULL,
    description character varying(200) NOT NULL,
    fuel_use_material boolean DEFAULT false NOT NULL,
    default_heat_content_ratio numeric(12,5),
    heat_content_ratio_numerator character varying(20),
    heat_content_ratio_denominator character varying(20)
);


ALTER TABLE public.calculation_material_code OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16455)
-- Name: calculation_method_code; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.calculation_method_code (
    code character varying(20) NOT NULL,
    description character varying(200) NOT NULL,
    total_direct_entry boolean NOT NULL,
    epa_emission_factor boolean NOT NULL,
    control_indicator boolean NOT NULL
);


ALTER TABLE public.calculation_method_code OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16458)
-- Name: calculation_parameter_type_code; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.calculation_parameter_type_code (
    code character varying(20) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.calculation_parameter_type_code OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16461)
-- Name: communication; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.communication (
    id bigint NOT NULL,
    sender_name character varying(255) NOT NULL,
    subject character varying(255),
    recipient_email character varying,
    content character varying,
    program_system_code character varying(20),
    created_by character varying(255) NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    last_modified_by character varying(255) NOT NULL,
    last_modified_date timestamp without time zone DEFAULT now() NOT NULL,
    email_status character varying(255)
);


ALTER TABLE public.communication OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16468)
-- Name: communication_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.communication_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.communication_id_seq OWNER TO postgres;

--
-- TOC entry 4872 (class 0 OID 0)
-- Dependencies: 218
-- Name: communication_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.communication_id_seq OWNED BY public.communication.id;


--
-- TOC entry 219 (class 1259 OID 16469)
-- Name: contact_type_code; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contact_type_code (
    code character varying(20) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.contact_type_code OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16472)
-- Name: control; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.control (
    id bigint NOT NULL,
    facility_site_id bigint NOT NULL,
    identifier character varying(20) NOT NULL,
    description character varying(200),
    percent_capture numeric(4,1),
    percent_control numeric(6,3),
    status_code character varying(20),
    comments character varying(400),
    control_measure_code character varying(20) NOT NULL,
    number_operating_months numeric(2,0),
    start_date date,
    end_date date,
    upgrade_date date,
    upgrade_description character varying(200),
    status_year smallint,
    previous_year_status_code character varying(20)
);


ALTER TABLE public.control OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16479)
-- Name: control_assignment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.control_assignment (
    id bigint NOT NULL,
    control_id bigint,
    control_path_id bigint NOT NULL,
    control_path_child_id bigint,
    sequence_number integer NOT NULL,
    percent_apportionment numeric(5,2) NOT NULL
);


ALTER TABLE public.control_assignment OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16486)
-- Name: control_assignment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.control_assignment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.control_assignment_id_seq OWNER TO postgres;

--
-- TOC entry 4873 (class 0 OID 0)
-- Dependencies: 222
-- Name: control_assignment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.control_assignment_id_seq OWNED BY public.control_assignment.id;


--
-- TOC entry 315 (class 1259 OID 98352)
-- Name: control_assignment_id_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.control_assignment ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.control_assignment_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 223 (class 1259 OID 16487)
-- Name: control_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.control_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.control_id_seq OWNER TO postgres;

--
-- TOC entry 4874 (class 0 OID 0)
-- Dependencies: 223
-- Name: control_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.control_id_seq OWNED BY public.control.id;


--
-- TOC entry 312 (class 1259 OID 98320)
-- Name: control_id_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.control ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.control_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 224 (class 1259 OID 16488)
-- Name: control_measure_code; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.control_measure_code (
    code character varying(20) NOT NULL,
    description character varying(200),
    last_inventory_year integer,
    map_to character varying(200)
);


ALTER TABLE public.control_measure_code OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16491)
-- Name: control_path; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.control_path (
    id bigint NOT NULL,
    description character varying(200),
    facility_site_id bigint NOT NULL,
    path_id character varying(20) NOT NULL,
    percent_control numeric(6,3)
);


ALTER TABLE public.control_path OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16498)
-- Name: control_path_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.control_path_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.control_path_id_seq OWNER TO postgres;

--
-- TOC entry 4875 (class 0 OID 0)
-- Dependencies: 226
-- Name: control_path_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.control_path_id_seq OWNED BY public.control_path.id;


--
-- TOC entry 227 (class 1259 OID 16499)
-- Name: control_path_pollutant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.control_path_pollutant (
    id bigint NOT NULL,
    control_path_id bigint NOT NULL,
    pollutant_code character varying(12) NOT NULL,
    percent_reduction numeric(6,3)
);


ALTER TABLE public.control_path_pollutant OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16506)
-- Name: control_path_pollutant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.control_path_pollutant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.control_path_pollutant_id_seq OWNER TO postgres;

--
-- TOC entry 4876 (class 0 OID 0)
-- Dependencies: 228
-- Name: control_path_pollutant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.control_path_pollutant_id_seq OWNED BY public.control_path_pollutant.id;


--
-- TOC entry 314 (class 1259 OID 98344)
-- Name: control_path_pollutant_id_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.control_path_pollutant ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.control_path_pollutant_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 229 (class 1259 OID 16507)
-- Name: control_pollutant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.control_pollutant (
    id bigint NOT NULL,
    control_id bigint NOT NULL,
    pollutant_code character varying(12) NOT NULL,
    percent_reduction numeric(6,3) NOT NULL
);


ALTER TABLE public.control_pollutant OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16514)
-- Name: control_pollutant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.control_pollutant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.control_pollutant_id_seq OWNER TO postgres;

--
-- TOC entry 4877 (class 0 OID 0)
-- Dependencies: 230
-- Name: control_pollutant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.control_pollutant_id_seq OWNED BY public.control_pollutant.id;


--
-- TOC entry 313 (class 1259 OID 98328)
-- Name: control_pollutant_id_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.control_pollutant ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.control_pollutant_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 231 (class 1259 OID 16515)
-- Name: eis_latlong_tolerance_lookup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.eis_latlong_tolerance_lookup (
    eis_program_id character varying(22) NOT NULL,
    coordinate_tolerance numeric
);


ALTER TABLE public.eis_latlong_tolerance_lookup OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16520)
-- Name: eis_transaction_attachment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.eis_transaction_attachment (
    id bigint NOT NULL,
    eis_transaction_history_id bigint NOT NULL,
    file_name character varying(255) NOT NULL,
    attachment oid NOT NULL,
    file_type character varying(1000) NOT NULL,
    created_by character varying(255) NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    last_modified_by character varying(255) NOT NULL,
    last_modified_date timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.eis_transaction_attachment OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16527)
-- Name: eis_transaction_attachment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.eis_transaction_attachment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.eis_transaction_attachment_id_seq OWNER TO postgres;

--
-- TOC entry 4878 (class 0 OID 0)
-- Dependencies: 233
-- Name: eis_transaction_attachment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.eis_transaction_attachment_id_seq OWNED BY public.eis_transaction_attachment.id;


--
-- TOC entry 234 (class 1259 OID 16528)
-- Name: eis_transaction_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.eis_transaction_history (
    id bigint NOT NULL,
    eis_sub_status character varying(32) NOT NULL,
    transaction_id character varying(80) NOT NULL,
    submitter_name character varying(255) NOT NULL,
    created_by character varying(255) NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    last_modified_by character varying(255) NOT NULL,
    last_modified_date timestamp without time zone DEFAULT now() NOT NULL,
    program_system_code character varying(20)
);


ALTER TABLE public.eis_transaction_history OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16535)
-- Name: eis_transaction_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.eis_transaction_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.eis_transaction_history_id_seq OWNER TO postgres;

--
-- TOC entry 4879 (class 0 OID 0)
-- Dependencies: 235
-- Name: eis_transaction_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.eis_transaction_history_id_seq OWNED BY public.eis_transaction_history.id;


--
-- TOC entry 236 (class 1259 OID 16536)
-- Name: eis_tri_xref; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.eis_tri_xref (
    id bigint NOT NULL,
    eis_id character varying(22) NOT NULL,
    trifid character varying(15) NOT NULL
);


ALTER TABLE public.eis_tri_xref OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16539)
-- Name: eis_tri_xref_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.eis_tri_xref_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.eis_tri_xref_id_seq OWNER TO postgres;

--
-- TOC entry 4880 (class 0 OID 0)
-- Dependencies: 237
-- Name: eis_tri_xref_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.eis_tri_xref_id_seq OWNED BY public.eis_tri_xref.id;


--
-- TOC entry 238 (class 1259 OID 16540)
-- Name: emission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.emission (
    id bigint NOT NULL,
    reporting_period_id bigint NOT NULL,
    pollutant_code character varying(12) NOT NULL,
    total_emissions numeric NOT NULL,
    emissions_uom_code character varying(20) NOT NULL,
    emissions_factor numeric,
    emissions_factor_text character varying(100),
    emissions_calc_method_code character varying(20) NOT NULL,
    comments character varying(400),
    emissions_numerator_uom character varying(20),
    emissions_denominator_uom character varying(20),
    calculated_emissions_tons numeric,
    formula_indicator boolean DEFAULT false,
    emissions_factor_formula character varying(100),
    total_manual_entry boolean DEFAULT false NOT NULL,
    calculation_comment character varying(4000),
    overall_control_percent numeric(8,6),
    energy_conversion_factor_id bigint
);


ALTER TABLE public.emission OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16549)
-- Name: emission_factor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.emission_factor (
    id bigint NOT NULL,
    scc_code character varying(20) NOT NULL,
    pollutant_code character varying(12) NOT NULL,
    numerator_uom_code character varying(20) NOT NULL,
    denominator_uom_code character varying(20) NOT NULL,
    calculation_material_code character varying(20) NOT NULL,
    calculation_parameter_type_code character varying(20) NOT NULL,
    formula_indicator boolean NOT NULL,
    emission_factor numeric(30,20),
    emission_factor_formula character varying(200),
    control_indicator boolean NOT NULL,
    description character varying(2000),
    note character varying(2000),
    source character varying(100),
    last_update_date date NOT NULL,
    control_measure_code character varying(20) NOT NULL,
    revoked boolean DEFAULT false NOT NULL
);


ALTER TABLE public.emission_factor OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 16555)
-- Name: emission_factor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.emission_factor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.emission_factor_id_seq OWNER TO postgres;

--
-- TOC entry 4881 (class 0 OID 0)
-- Dependencies: 240
-- Name: emission_factor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.emission_factor_id_seq OWNED BY public.emission_factor.id;


--
-- TOC entry 241 (class 1259 OID 16556)
-- Name: emission_formula_variable; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.emission_formula_variable (
    id bigint NOT NULL,
    emission_id bigint NOT NULL,
    emission_formula_variable_code character varying(20) NOT NULL,
    value numeric
);


ALTER TABLE public.emission_formula_variable OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 16563)
-- Name: emission_formula_variable_code; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.emission_formula_variable_code (
    code character varying(20) NOT NULL,
    description character varying(200),
    validation_type character varying(20)
);


ALTER TABLE public.emission_formula_variable_code OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 16566)
-- Name: emission_formula_variable_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.emission_formula_variable_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.emission_formula_variable_id_seq OWNER TO postgres;

--
-- TOC entry 4882 (class 0 OID 0)
-- Dependencies: 243
-- Name: emission_formula_variable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.emission_formula_variable_id_seq OWNED BY public.emission_formula_variable.id;


--
-- TOC entry 310 (class 1259 OID 81931)
-- Name: emission_formula_variable_id_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.emission_formula_variable ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.emission_formula_variable_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 244 (class 1259 OID 16567)
-- Name: emission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.emission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.emission_id_seq OWNER TO postgres;

--
-- TOC entry 4883 (class 0 OID 0)
-- Dependencies: 244
-- Name: emission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.emission_id_seq OWNED BY public.emission.id;


--
-- TOC entry 245 (class 1259 OID 16568)
-- Name: emissions_operating_type_code; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.emissions_operating_type_code (
    code character varying(20) NOT NULL,
    short_name character varying(50),
    description character varying(200)
);


ALTER TABLE public.emissions_operating_type_code OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 16571)
-- Name: emissions_process; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.emissions_process (
    id bigint NOT NULL,
    emissions_unit_id bigint NOT NULL,
    emissions_process_identifier character varying(20) NOT NULL,
    status_code character varying(20) NOT NULL,
    status_year smallint,
    scc_code character varying(20) NOT NULL,
    scc_short_name character varying(100),
    description character varying(200),
    aircraft_engine_type_code character varying(10),
    comments character varying(400),
    scc_description character varying(500),
    previous_year_status_code character varying(20),
    is_billable boolean DEFAULT true
);


ALTER TABLE public.emissions_process OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 16578)
-- Name: emissions_process_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.emissions_process_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.emissions_process_id_seq OWNER TO postgres;

--
-- TOC entry 4884 (class 0 OID 0)
-- Dependencies: 247
-- Name: emissions_process_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.emissions_process_id_seq OWNED BY public.emissions_process.id;


--
-- TOC entry 305 (class 1259 OID 65560)
-- Name: emissions_process_id_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.emissions_process ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.emissions_process_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 248 (class 1259 OID 16579)
-- Name: emissions_report; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.emissions_report (
    id bigint NOT NULL,
    eis_program_id character varying(22),
    year smallint NOT NULL,
    status character varying(255),
    validation_status character varying(255),
    created_by character varying(255) NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    last_modified_by character varying(255) NOT NULL,
    last_modified_date timestamp without time zone DEFAULT now() NOT NULL,
    cromerr_activity_id character varying(255),
    cromerr_document_id character varying(255),
    has_submitted boolean,
    eis_last_trans_id character varying(80),
    eis_last_sub_status character varying(32),
    eis_is_passed boolean DEFAULT false,
    eis_comments character varying(2000),
    program_system_code character varying(20),
    master_facility_id bigint NOT NULL,
    returned_report boolean DEFAULT false,
    threshold_status character varying(255),
    mid_year_sub_status character varying(255)
);


ALTER TABLE public.emissions_report OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 16588)
-- Name: emissions_report_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.emissions_report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.emissions_report_id_seq OWNER TO postgres;

--
-- TOC entry 4885 (class 0 OID 0)
-- Dependencies: 249
-- Name: emissions_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.emissions_report_id_seq OWNED BY public.emissions_report.id;


--
-- TOC entry 250 (class 1259 OID 16589)
-- Name: emissions_unit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.emissions_unit (
    id bigint NOT NULL,
    facility_site_id bigint NOT NULL,
    unit_identifier character varying(20) NOT NULL,
    description character varying(100),
    type_code character varying(20) NOT NULL,
    status_code character varying(20) NOT NULL,
    status_year smallint,
    unit_measure_cd character varying(20),
    comments character varying(400),
    design_capacity numeric,
    previous_year_status_code character varying(20)
);


ALTER TABLE public.emissions_unit OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 16596)
-- Name: emissions_unit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.emissions_unit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.emissions_unit_id_seq OWNER TO postgres;

--
-- TOC entry 4886 (class 0 OID 0)
-- Dependencies: 251
-- Name: emissions_unit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.emissions_unit_id_seq OWNED BY public.emissions_unit.id;


--
-- TOC entry 304 (class 1259 OID 65554)
-- Name: emissions_unit_id_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.emissions_unit ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.emissions_unit_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 252 (class 1259 OID 16597)
-- Name: energy_conversion_factor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.energy_conversion_factor (
    id bigint NOT NULL,
    calculation_material_code character varying(20) NOT NULL,
    denominator_uom_code character varying(20) NOT NULL,
    numerator_uom_code character varying(20) NOT NULL,
    conversion_factor numeric(14,4) NOT NULL,
    source character varying(100),
    note character varying(2000)
);


ALTER TABLE public.energy_conversion_factor OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 16602)
-- Name: energy_conversion_factor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.energy_conversion_factor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.energy_conversion_factor_id_seq OWNER TO postgres;

--
-- TOC entry 4887 (class 0 OID 0)
-- Dependencies: 253
-- Name: energy_conversion_factor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.energy_conversion_factor_id_seq OWNED BY public.energy_conversion_factor.id;


--
-- TOC entry 254 (class 1259 OID 16603)
-- Name: facility_category_code; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.facility_category_code (
    code character varying(20) NOT NULL,
    name character varying(20),
    description character varying(200)
);


ALTER TABLE public.facility_category_code OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 16606)
-- Name: facility_site; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.facility_site (
    id bigint NOT NULL,
    report_id bigint NOT NULL,
    agency_facility_identifier character varying(30) NOT NULL,
    category_code character varying(20),
    source_type_code character varying(20),
    name character varying(80) NOT NULL,
    description character varying(100),
    status_code character varying(20) NOT NULL,
    status_year smallint,
    program_system_code character varying(20),
    street_address character varying(100),
    city character varying(60),
    state_code character varying(5),
    country_code character varying(10),
    postal_code character varying(10),
    latitude numeric(10,6),
    longitude numeric(10,6),
    mailing_street_address character varying(100),
    mailing_city character varying(60),
    mailing_state_code character varying(5),
    mailing_postal_code character varying(10),
    mailing_country_code character varying(10),
    tribal_code character varying(20),
    comments character varying(400),
    county_code character varying(5)
);


ALTER TABLE public.facility_site OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 16613)
-- Name: facility_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.facility_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.facility_id_seq OWNER TO postgres;

--
-- TOC entry 4888 (class 0 OID 0)
-- Dependencies: 256
-- Name: facility_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.facility_id_seq OWNED BY public.facility_site.id;


--
-- TOC entry 257 (class 1259 OID 16614)
-- Name: facility_naics_xref; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.facility_naics_xref (
    id bigint NOT NULL,
    naics_code numeric(6,0) NOT NULL,
    naics_code_type character varying(10) NOT NULL,
    facility_site_id bigint NOT NULL
);


ALTER TABLE public.facility_naics_xref OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 16621)
-- Name: facility_naics_xref_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.facility_naics_xref_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.facility_naics_xref_id_seq OWNER TO postgres;

--
-- TOC entry 4889 (class 0 OID 0)
-- Dependencies: 258
-- Name: facility_naics_xref_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.facility_naics_xref_id_seq OWNED BY public.facility_naics_xref.id;


--
-- TOC entry 308 (class 1259 OID 73796)
-- Name: facility_naics_xref_id_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.facility_naics_xref ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.facility_naics_xref_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 259 (class 1259 OID 16622)
-- Name: facility_site_contact; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.facility_site_contact (
    id bigint NOT NULL,
    facility_site_id bigint NOT NULL,
    type character varying(150) NOT NULL,
    prefix character varying(15),
    first_name character varying(20),
    last_name character varying(20),
    email character varying(255) NOT NULL,
    phone character varying(15),
    phone_ext character varying(5),
    street_address character varying(100) NOT NULL,
    city character varying(60) NOT NULL,
    state_code character varying(5) NOT NULL,
    country_code character varying(10),
    postal_code character varying(10),
    mailing_street_address character varying(100),
    mailing_city character varying(60),
    mailing_state_code character varying(5),
    mailing_country_code character varying(10),
    mailing_postal_code character varying(10),
    county_code character varying(5)
);


ALTER TABLE public.facility_site_contact OWNER TO postgres;

--
-- TOC entry 260 (class 1259 OID 16629)
-- Name: facility_site_contact_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.facility_site_contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.facility_site_contact_id_seq OWNER TO postgres;

--
-- TOC entry 4890 (class 0 OID 0)
-- Dependencies: 260
-- Name: facility_site_contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.facility_site_contact_id_seq OWNED BY public.facility_site_contact.id;


--
-- TOC entry 317 (class 1259 OID 180235)
-- Name: facility_site_contact_id_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.facility_site_contact ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.facility_site_contact_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 306 (class 1259 OID 73739)
-- Name: facility_site_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.facility_site ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.facility_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 261 (class 1259 OID 16630)
-- Name: facility_source_type_code; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.facility_source_type_code (
    code character varying(20) NOT NULL,
    description character varying(200),
    last_inventory_year integer
);


ALTER TABLE public.facility_source_type_code OWNER TO postgres;

--
-- TOC entry 262 (class 1259 OID 16633)
-- Name: fips_country_code; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fips_country_code (
    code character varying(20) NOT NULL,
    description character varying(200)
);


ALTER TABLE public.fips_country_code OWNER TO postgres;

--
-- TOC entry 263 (class 1259 OID 16636)
-- Name: fips_county; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fips_county (
    county_code character varying(3) NOT NULL,
    state_code character varying(2) NOT NULL,
    name character varying(43),
    code character varying(5) NOT NULL,
    last_inventory_year integer
);


ALTER TABLE public.fips_county OWNER TO postgres;

--
-- TOC entry 264 (class 1259 OID 16639)
-- Name: fips_state_code; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fips_state_code (
    code character varying(2) NOT NULL,
    usps_code character varying(2),
    name character varying(200)
);


ALTER TABLE public.fips_state_code OWNER TO postgres;

--
-- TOC entry 265 (class 1259 OID 16642)
-- Name: hap_facility_category_code; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hap_facility_category_code (
    code character varying(20) NOT NULL,
    description character varying(200)
);


ALTER TABLE public.hap_facility_category_code OWNER TO postgres;

--
-- TOC entry 266 (class 1259 OID 16645)
-- Name: master_facility_naics_xref; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.master_facility_naics_xref (
    id bigint NOT NULL,
    master_facility_id bigint NOT NULL,
    naics_code numeric(6,0) NOT NULL,
    naics_code_type character varying(10) NOT NULL,
    created_by character varying(255) NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    last_modified_by character varying(255) NOT NULL,
    last_modified_date timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.master_facility_naics_xref OWNER TO postgres;

--
-- TOC entry 267 (class 1259 OID 16652)
-- Name: master_facility_naics_xref_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.master_facility_naics_xref_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.master_facility_naics_xref_id_seq OWNER TO postgres;

--
-- TOC entry 4891 (class 0 OID 0)
-- Dependencies: 267
-- Name: master_facility_naics_xref_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.master_facility_naics_xref_id_seq OWNED BY public.master_facility_naics_xref.id;


--
-- TOC entry 268 (class 1259 OID 16653)
-- Name: master_facility_record; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.master_facility_record (
    id bigint NOT NULL,
    eis_program_id character varying(22),
    program_system_code character varying(20) NOT NULL,
    name character varying(80) NOT NULL,
    category_code character varying(20),
    source_type_code character varying(20),
    status_code character varying(20) NOT NULL,
    agency_facility_id character varying(30) NOT NULL,
    description character varying(100),
    status_year smallint,
    street_address character varying(100) NOT NULL,
    city character varying(60) NOT NULL,
    state_code character varying(5) NOT NULL,
    county_code character varying(5),
    postal_code character varying(10),
    country_code character varying(10),
    mailing_street_address character varying(100),
    mailing_city character varying(60),
    mailing_state_code character varying(5),
    mailing_postal_code character varying(10),
    mailing_country_code character varying(10),
    latitude numeric(10,6),
    longitude numeric(10,6),
    tribal_code character varying(20),
    created_by character varying(255) NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    last_modified_by character varying(255) NOT NULL,
    last_modified_date timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.master_facility_record OWNER TO postgres;

--
-- TOC entry 269 (class 1259 OID 16660)
-- Name: master_facility_record_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.master_facility_record_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.master_facility_record_id_seq OWNER TO postgres;

--
-- TOC entry 4892 (class 0 OID 0)
-- Dependencies: 269
-- Name: master_facility_record_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.master_facility_record_id_seq OWNED BY public.master_facility_record.id;


--
-- TOC entry 270 (class 1259 OID 16661)
-- Name: monthly_fuel_reporting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.monthly_fuel_reporting (
    id bigint NOT NULL,
    reporting_period_id bigint NOT NULL,
    created_by character varying(255) NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    last_modified_by character varying(255) NOT NULL,
    last_modified_date timestamp without time zone DEFAULT now() NOT NULL,
    jan_fuel_use_value numeric,
    feb_fuel_use_value numeric,
    march_fuel_use_value numeric,
    april_fuel_use_value numeric,
    may_fuel_use_value numeric,
    june_fuel_use_value numeric,
    july_fuel_use_value numeric,
    aug_fuel_use_value numeric,
    sept_fuel_use_value numeric,
    oct_fuel_use_value numeric,
    nov_fuel_use_value numeric,
    dec_fuel_use_value numeric,
    semiannual_fuel_use_value numeric,
    annual_fuel_use_value numeric,
    jan_total_op_days numeric(3,1),
    feb_total_op_days numeric(3,1),
    march_total_op_days numeric(3,1),
    april_total_op_days numeric(3,1),
    may_total_op_days numeric(3,1),
    june_total_op_days numeric(3,1),
    july_total_op_days numeric(3,1),
    aug_total_op_days numeric(3,1),
    sept_total_op_days numeric(3,1),
    oct_total_op_days numeric(3,1),
    nov_total_op_days numeric(3,1),
    dec_total_op_days numeric(3,1),
    semi_annual_total_op_days numeric(4,1),
    annual_total_op_days numeric(4,1),
    mid_year_submitted boolean DEFAULT false
);


ALTER TABLE public.monthly_fuel_reporting OWNER TO postgres;

--
-- TOC entry 271 (class 1259 OID 16669)
-- Name: monthly_fuel_reporting_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.monthly_fuel_reporting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.monthly_fuel_reporting_id_seq OWNER TO postgres;

--
-- TOC entry 4893 (class 0 OID 0)
-- Dependencies: 271
-- Name: monthly_fuel_reporting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.monthly_fuel_reporting_id_seq OWNED BY public.monthly_fuel_reporting.id;


--
-- TOC entry 272 (class 1259 OID 16671)
-- Name: naics_code; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.naics_code (
    code numeric(6,0) NOT NULL,
    description character varying(200),
    last_inventory_year integer,
    map_to character varying(200)
);


ALTER TABLE public.naics_code OWNER TO postgres;

--
-- TOC entry 273 (class 1259 OID 16674)
-- Name: naics_code_industry; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.naics_code_industry (
    code_prefix numeric(4,0) NOT NULL,
    industry character varying(200)
);


ALTER TABLE public.naics_code_industry OWNER TO postgres;

--
-- TOC entry 274 (class 1259 OID 16677)
-- Name: operating_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.operating_detail (
    id bigint NOT NULL,
    reporting_period_id bigint NOT NULL,
    actual_hours_per_period numeric(4,0),
    avg_hours_per_day numeric(3,1),
    avg_days_per_week numeric(2,1),
    avg_weeks_per_period numeric(2,0),
    percent_winter numeric(4,1),
    percent_spring numeric(4,1),
    percent_summer numeric(4,1),
    percent_fall numeric(4,1)
);


ALTER TABLE public.operating_detail OWNER TO postgres;

--
-- TOC entry 275 (class 1259 OID 16684)
-- Name: operating_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.operating_detail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.operating_detail_id_seq OWNER TO postgres;

--
-- TOC entry 4894 (class 0 OID 0)
-- Dependencies: 275
-- Name: operating_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.operating_detail_id_seq OWNED BY public.operating_detail.id;


--
-- TOC entry 311 (class 1259 OID 81932)
-- Name: operating_detail_id_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.operating_detail ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.operating_detail_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 276 (class 1259 OID 16685)
-- Name: operating_status_code; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.operating_status_code (
    code character varying(20) NOT NULL,
    description character varying(200),
    sub_facility_status boolean NOT NULL,
    facility_status boolean NOT NULL
);


ALTER TABLE public.operating_status_code OWNER TO postgres;

--
-- TOC entry 277 (class 1259 OID 16688)
-- Name: point_source_scc_code; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.point_source_scc_code (
    code character varying(10) NOT NULL,
    last_inventory_year smallint,
    fuel_use_required boolean DEFAULT false NOT NULL,
    calculation_material_code character varying(20),
    fuel_use_types character varying(20),
    short_name character varying(255),
    scc_level_one character varying(255),
    scc_level_two character varying(255),
    scc_level_three character varying(255),
    scc_level_four character varying(255),
    sector character varying(255),
    monthly_reporting boolean DEFAULT false NOT NULL
);


ALTER TABLE public.point_source_scc_code OWNER TO postgres;

--
-- TOC entry 278 (class 1259 OID 16695)
-- Name: pollutant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pollutant (
    pollutant_code character varying(12) NOT NULL,
    pollutant_name character varying(200) NOT NULL,
    pollutant_cas_id character varying(100),
    pollutant_srs_id character varying(40) NOT NULL,
    pollutant_type character varying(12) NOT NULL,
    pollutant_standard_uom_code character varying(20),
    last_inventory_year integer
);


ALTER TABLE public.pollutant OWNER TO postgres;

--
-- TOC entry 279 (class 1259 OID 16698)
-- Name: program_system_code; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.program_system_code (
    code character varying(20) NOT NULL,
    description character varying(200)
);


ALTER TABLE public.program_system_code OWNER TO postgres;

--
-- TOC entry 280 (class 1259 OID 16701)
-- Name: regulatory_code; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.regulatory_code (
    code character varying(20) NOT NULL,
    code_type character varying(12),
    description character varying(200),
    subpart_description character varying(10),
    part_description character varying(2)
);


ALTER TABLE public.regulatory_code OWNER TO postgres;

--
-- TOC entry 281 (class 1259 OID 16704)
-- Name: release_point; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.release_point (
    id bigint NOT NULL,
    facility_site_id bigint NOT NULL,
    release_point_identifier character varying(20) NOT NULL,
    type_code character varying(20),
    description character varying(200),
    stack_height numeric(8,3),
    stack_height_uom_code character varying(20),
    stack_diameter numeric(6,3),
    stack_diameter_uom_code character varying(20),
    exit_gas_velocity numeric(8,3),
    exit_gas_velocity_uom_code character varying(20),
    exit_gas_temperature numeric(4,0),
    exit_gas_flow_rate numeric(16,8),
    exit_gas_flow_uom_code character varying(20),
    status_code character varying(20) NOT NULL,
    status_year smallint,
    latitude numeric(10,6),
    longitude numeric(10,6),
    fugitive_mid_pt2_latitude numeric(10,6),
    fugitive_mid_pt2_longitude numeric(10,6),
    comments character varying(400),
    fence_line_distance numeric(6,0),
    fence_line_distance_uom_code character varying(20),
    fugitive_height numeric(3,0),
    fugitive_height_uom_code character varying(20),
    fugitive_width numeric(8,3),
    fugitive_width_uom_code character varying(20),
    fugitive_length numeric(8,3),
    fugitive_length_uom_code character varying(20),
    fugitive_angle numeric(3,0),
    stack_width numeric(6,3),
    stack_length numeric(6,3),
    stack_width_uom_code character varying(20),
    stack_length_uom_code character varying(20),
    previous_year_status_code character varying(20)
);


ALTER TABLE public.release_point OWNER TO postgres;

--
-- TOC entry 282 (class 1259 OID 16711)
-- Name: release_point_appt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.release_point_appt (
    id bigint NOT NULL,
    release_point_id bigint NOT NULL,
    emissions_process_id bigint NOT NULL,
    percent numeric(5,2) NOT NULL,
    control_path_id bigint
);


ALTER TABLE public.release_point_appt OWNER TO postgres;

--
-- TOC entry 283 (class 1259 OID 16718)
-- Name: release_point_appt_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.release_point_appt_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.release_point_appt_id_seq OWNER TO postgres;

--
-- TOC entry 4895 (class 0 OID 0)
-- Dependencies: 283
-- Name: release_point_appt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.release_point_appt_id_seq OWNED BY public.release_point_appt.id;


--
-- TOC entry 316 (class 1259 OID 106507)
-- Name: release_point_appt_id_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.release_point_appt ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.release_point_appt_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 284 (class 1259 OID 16719)
-- Name: release_point_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.release_point_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.release_point_id_seq OWNER TO postgres;

--
-- TOC entry 4896 (class 0 OID 0)
-- Dependencies: 284
-- Name: release_point_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.release_point_id_seq OWNED BY public.release_point.id;


--
-- TOC entry 307 (class 1259 OID 73740)
-- Name: release_point_id_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.release_point ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.release_point_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 285 (class 1259 OID 16720)
-- Name: release_point_type_code; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.release_point_type_code (
    code character varying(20) NOT NULL,
    description character varying(200) NOT NULL,
    last_inventory_year integer,
    category character varying(20)
);


ALTER TABLE public.release_point_type_code OWNER TO postgres;

--
-- TOC entry 286 (class 1259 OID 16723)
-- Name: report_attachment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.report_attachment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.report_attachment_id_seq OWNER TO postgres;

--
-- TOC entry 4897 (class 0 OID 0)
-- Dependencies: 286
-- Name: report_attachment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.report_attachment_id_seq OWNED BY public.attachment.id;


--
-- TOC entry 287 (class 1259 OID 16724)
-- Name: report_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.report_history (
    id bigint NOT NULL,
    report_id bigint NOT NULL,
    action_date timestamp without time zone NOT NULL,
    action character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    user_full_name character varying(255) NOT NULL,
    comments character varying(2000),
    created_by character varying(255) NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    last_modified_by character varying(255) NOT NULL,
    last_modified_date timestamp without time zone DEFAULT now() NOT NULL,
    attachment_id bigint,
    user_role character varying(255),
    file_name character varying(255),
    file_deleted boolean DEFAULT false,
    cromerr_activity_id character varying(255),
    cromerr_document_id character varying(255)
);


ALTER TABLE public.report_history OWNER TO postgres;

--
-- TOC entry 288 (class 1259 OID 16732)
-- Name: report_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.report_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.report_history_id_seq OWNER TO postgres;

--
-- TOC entry 4898 (class 0 OID 0)
-- Dependencies: 288
-- Name: report_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.report_history_id_seq OWNED BY public.report_history.id;


--
-- TOC entry 303 (class 1259 OID 24591)
-- Name: report_tracker; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.report_tracker (
    id bigint NOT NULL,
    agency_facility_identifier character varying(30) NOT NULL,
    reporting_year smallint NOT NULL,
    certified_date timestamp without time zone,
    created_date timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.report_tracker OWNER TO postgres;

--
-- TOC entry 289 (class 1259 OID 16733)
-- Name: reporting_period; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reporting_period (
    id bigint NOT NULL,
    emissions_process_id bigint NOT NULL,
    reporting_period_type_code character varying(20) NOT NULL,
    emissions_operating_type_code character varying(20),
    calculation_parameter_type_code character varying(20),
    calculation_parameter_value numeric,
    calculation_parameter_uom character varying(20),
    calculation_material_code character varying(20),
    comments character varying(400),
    fuel_use_value numeric,
    fuel_use_uom character varying(20),
    fuel_use_material_code character varying(20),
    heat_content_value numeric,
    heat_content_uom character varying(20)
);


ALTER TABLE public.reporting_period OWNER TO postgres;

--
-- TOC entry 290 (class 1259 OID 16740)
-- Name: reporting_period_code; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reporting_period_code (
    code character varying(20) NOT NULL,
    short_name character varying(50) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.reporting_period_code OWNER TO postgres;

--
-- TOC entry 291 (class 1259 OID 16743)
-- Name: reporting_period_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reporting_period_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reporting_period_id_seq OWNER TO postgres;

--
-- TOC entry 4899 (class 0 OID 0)
-- Dependencies: 291
-- Name: reporting_period_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reporting_period_id_seq OWNED BY public.reporting_period.id;


--
-- TOC entry 309 (class 1259 OID 73811)
-- Name: reporting_period_id_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.reporting_period ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.reporting_period_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 292 (class 1259 OID 16744)
-- Name: schema_version_cef; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_version_cef (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


ALTER TABLE public.schema_version_cef OWNER TO postgres;

--
-- TOC entry 293 (class 1259 OID 16750)
-- Name: slt_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.slt_config (
    id integer NOT NULL,
    name character varying(64),
    value character varying(2000),
    program_system_code character varying(20)
);


ALTER TABLE public.slt_config OWNER TO postgres;

--
-- TOC entry 294 (class 1259 OID 16755)
-- Name: slt_config_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.slt_config_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.slt_config_id_seq OWNER TO postgres;

--
-- TOC entry 4900 (class 0 OID 0)
-- Dependencies: 294
-- Name: slt_config_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.slt_config_id_seq OWNED BY public.slt_config.id;


--
-- TOC entry 295 (class 1259 OID 16756)
-- Name: slt_properties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.slt_properties (
    name character varying(64) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(255) NOT NULL,
    datatype character varying(20) NOT NULL,
    required boolean DEFAULT true NOT NULL
);


ALTER TABLE public.slt_properties OWNER TO postgres;

--
-- TOC entry 296 (class 1259 OID 16760)
-- Name: tribal_code; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tribal_code (
    code character varying(20) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.tribal_code OWNER TO postgres;

--
-- TOC entry 297 (class 1259 OID 16763)
-- Name: unit_measure_code; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.unit_measure_code (
    code character varying(20) NOT NULL,
    description character varying(100),
    ef_numerator boolean NOT NULL,
    ef_denominator boolean NOT NULL,
    unit_type character varying(20) DEFAULT 'UNSUPPORTED'::character varying NOT NULL,
    calculation_variable character varying(100),
    legacy boolean DEFAULT false NOT NULL,
    unit_design_capacity boolean NOT NULL,
    fuel_use_uom boolean DEFAULT false NOT NULL,
    heat_content_uom boolean DEFAULT false NOT NULL,
    fuel_use_type character varying(6)
);


ALTER TABLE public.unit_measure_code OWNER TO postgres;

--
-- TOC entry 298 (class 1259 OID 16770)
-- Name: unit_type_code; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.unit_type_code (
    code character varying(20) NOT NULL,
    description character varying(200)
);


ALTER TABLE public.unit_type_code OWNER TO postgres;

--
-- TOC entry 299 (class 1259 OID 16773)
-- Name: user_facility_association; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_facility_association (
    id bigint NOT NULL,
    master_facility_id bigint NOT NULL,
    user_role_id bigint NOT NULL,
    approved boolean DEFAULT false NOT NULL,
    created_by character varying(255) NOT NULL,
    created_date timestamp without time zone DEFAULT now() NOT NULL,
    last_modified_by character varying(255) NOT NULL,
    last_modified_date timestamp without time zone DEFAULT now() NOT NULL,
    cdx_user_id character varying(255) NOT NULL
);


ALTER TABLE public.user_facility_association OWNER TO postgres;

--
-- TOC entry 300 (class 1259 OID 16781)
-- Name: user_facility_association_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_facility_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_facility_association_id_seq OWNER TO postgres;

--
-- TOC entry 4901 (class 0 OID 0)
-- Dependencies: 300
-- Name: user_facility_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_facility_association_id_seq OWNED BY public.user_facility_association.id;


--
-- TOC entry 301 (class 1259 OID 16782)
-- Name: user_feedback; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_feedback (
    id integer NOT NULL,
    report_id bigint,
    easy_and_intuitive smallint,
    data_entry_via_screens smallint,
    data_entry_via_bulk_upload smallint,
    calculation_screens smallint,
    controls_and_control_paths smallint,
    quality_assurance_checks smallint,
    overall_reporting_time smallint,
    beneficial_functionality_description character varying(2000),
    difficult_application_functionality_description character varying(2000),
    additional_features_or_enhancements_description character varying(2000),
    created_by character varying(255),
    created_date timestamp without time zone NOT NULL,
    last_modified_by character varying(255),
    last_modified_date timestamp without time zone NOT NULL,
    facility_name character varying(80),
    year smallint,
    user_name character varying(255),
    program_system_code character varying(20)
);


ALTER TABLE public.user_feedback OWNER TO postgres;

--
-- TOC entry 302 (class 1259 OID 16787)
-- Name: user_feedback_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_feedback_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_feedback_id_seq OWNER TO postgres;

--
-- TOC entry 4902 (class 0 OID 0)
-- Dependencies: 302
-- Name: user_feedback_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_feedback_id_seq OWNED BY public.user_feedback.id;


--
-- TOC entry 4426 (class 2604 OID 16817)
-- Name: attachment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachment ALTER COLUMN id SET DEFAULT nextval('public.report_attachment_id_seq'::regclass);


--
-- TOC entry 4430 (class 2604 OID 16818)
-- Name: communication id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.communication ALTER COLUMN id SET DEFAULT nextval('public.communication_id_seq'::regclass);


--
-- TOC entry 4431 (class 2604 OID 16821)
-- Name: control_path id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.control_path ALTER COLUMN id SET DEFAULT nextval('public.control_path_id_seq'::regclass);


--
-- TOC entry 4434 (class 2604 OID 16824)
-- Name: eis_transaction_attachment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eis_transaction_attachment ALTER COLUMN id SET DEFAULT nextval('public.eis_transaction_attachment_id_seq'::regclass);


--
-- TOC entry 4437 (class 2604 OID 16825)
-- Name: eis_transaction_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eis_transaction_history ALTER COLUMN id SET DEFAULT nextval('public.eis_transaction_history_id_seq'::regclass);


--
-- TOC entry 4438 (class 2604 OID 16826)
-- Name: eis_tri_xref id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eis_tri_xref ALTER COLUMN id SET DEFAULT nextval('public.eis_tri_xref_id_seq'::regclass);


--
-- TOC entry 4441 (class 2604 OID 16827)
-- Name: emission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emission ALTER COLUMN id SET DEFAULT nextval('public.emission_id_seq'::regclass);


--
-- TOC entry 4443 (class 2604 OID 16828)
-- Name: emission_factor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emission_factor ALTER COLUMN id SET DEFAULT nextval('public.emission_factor_id_seq'::regclass);


--
-- TOC entry 4449 (class 2604 OID 16831)
-- Name: emissions_report id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emissions_report ALTER COLUMN id SET DEFAULT nextval('public.emissions_report_id_seq'::regclass);


--
-- TOC entry 4450 (class 2604 OID 16833)
-- Name: energy_conversion_factor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.energy_conversion_factor ALTER COLUMN id SET DEFAULT nextval('public.energy_conversion_factor_id_seq'::regclass);


--
-- TOC entry 4453 (class 2604 OID 16837)
-- Name: master_facility_naics_xref id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.master_facility_naics_xref ALTER COLUMN id SET DEFAULT nextval('public.master_facility_naics_xref_id_seq'::regclass);


--
-- TOC entry 4456 (class 2604 OID 16838)
-- Name: master_facility_record id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.master_facility_record ALTER COLUMN id SET DEFAULT nextval('public.master_facility_record_id_seq'::regclass);


--
-- TOC entry 4460 (class 2604 OID 16839)
-- Name: monthly_fuel_reporting id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monthly_fuel_reporting ALTER COLUMN id SET DEFAULT nextval('public.monthly_fuel_reporting_id_seq'::regclass);


--
-- TOC entry 4466 (class 2604 OID 16843)
-- Name: report_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_history ALTER COLUMN id SET DEFAULT nextval('public.report_history_id_seq'::regclass);


--
-- TOC entry 4468 (class 2604 OID 16845)
-- Name: slt_config id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slt_config ALTER COLUMN id SET DEFAULT nextval('public.slt_config_id_seq'::regclass);


--
-- TOC entry 4477 (class 2604 OID 16846)
-- Name: user_facility_association id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_facility_association ALTER COLUMN id SET DEFAULT nextval('public.user_facility_association_id_seq'::regclass);


--
-- TOC entry 4478 (class 2604 OID 16847)
-- Name: user_feedback id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_feedback ALTER COLUMN id SET DEFAULT nextval('public.user_feedback_id_seq'::regclass);


--
-- TOC entry 4481 (class 2606 OID 16879)
-- Name: admin_properties admin_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_properties
    ADD CONSTRAINT admin_properties_pkey PRIMARY KEY (name);


--
-- TOC entry 4483 (class 2606 OID 16881)
-- Name: agency agency_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agency
    ADD CONSTRAINT agency_pkey PRIMARY KEY (id);


--
-- TOC entry 4485 (class 2606 OID 16883)
-- Name: aircraft_engine_type_code aircraft_engine_type_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aircraft_engine_type_code
    ADD CONSTRAINT aircraft_engine_type_code_pkey PRIMARY KEY (code);


--
-- TOC entry 4489 (class 2606 OID 16885)
-- Name: calculation_material_code calculation_material_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calculation_material_code
    ADD CONSTRAINT calculation_material_code_pkey PRIMARY KEY (code);


--
-- TOC entry 4491 (class 2606 OID 16887)
-- Name: calculation_method_code calculation_method_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calculation_method_code
    ADD CONSTRAINT calculation_method_code_pkey PRIMARY KEY (code);


--
-- TOC entry 4493 (class 2606 OID 16889)
-- Name: calculation_parameter_type_code calculation_parameter_type_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calculation_parameter_type_code
    ADD CONSTRAINT calculation_parameter_type_code_pkey PRIMARY KEY (code);


--
-- TOC entry 4495 (class 2606 OID 16891)
-- Name: communication communication_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.communication
    ADD CONSTRAINT communication_pkey PRIMARY KEY (id);


--
-- TOC entry 4497 (class 2606 OID 16893)
-- Name: contact_type_code contact_type_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_type_code
    ADD CONSTRAINT contact_type_code_pkey PRIMARY KEY (code);


--
-- TOC entry 4501 (class 2606 OID 16895)
-- Name: control_assignment control_assignment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.control_assignment
    ADD CONSTRAINT control_assignment_pkey PRIMARY KEY (id);


--
-- TOC entry 4503 (class 2606 OID 16897)
-- Name: control_measure_code control_measure_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.control_measure_code
    ADD CONSTRAINT control_measure_code_pkey PRIMARY KEY (code);


--
-- TOC entry 4505 (class 2606 OID 16899)
-- Name: control_path control_path_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.control_path
    ADD CONSTRAINT control_path_pkey PRIMARY KEY (id);


--
-- TOC entry 4507 (class 2606 OID 16901)
-- Name: control_path_pollutant control_path_pollutant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.control_path_pollutant
    ADD CONSTRAINT control_path_pollutant_pkey PRIMARY KEY (id);


--
-- TOC entry 4499 (class 2606 OID 16903)
-- Name: control control_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.control
    ADD CONSTRAINT control_pkey PRIMARY KEY (id);


--
-- TOC entry 4510 (class 2606 OID 16905)
-- Name: control_pollutant control_pollutant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.control_pollutant
    ADD CONSTRAINT control_pollutant_pkey PRIMARY KEY (id);


--
-- TOC entry 4513 (class 2606 OID 16907)
-- Name: eis_latlong_tolerance_lookup eis_latlong_tolerance_lookup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eis_latlong_tolerance_lookup
    ADD CONSTRAINT eis_latlong_tolerance_lookup_pkey PRIMARY KEY (eis_program_id);


--
-- TOC entry 4515 (class 2606 OID 16909)
-- Name: eis_transaction_attachment eis_transaction_attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eis_transaction_attachment
    ADD CONSTRAINT eis_transaction_attachment_pkey PRIMARY KEY (id);


--
-- TOC entry 4517 (class 2606 OID 16911)
-- Name: eis_transaction_history eis_transaction_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eis_transaction_history
    ADD CONSTRAINT eis_transaction_history_pkey PRIMARY KEY (id);


--
-- TOC entry 4519 (class 2606 OID 16913)
-- Name: eis_tri_xref eis_tri_xref_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eis_tri_xref
    ADD CONSTRAINT eis_tri_xref_pkey PRIMARY KEY (id);


--
-- TOC entry 4526 (class 2606 OID 16915)
-- Name: emission_factor emission_factor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emission_factor
    ADD CONSTRAINT emission_factor_pkey PRIMARY KEY (id);


--
-- TOC entry 4530 (class 2606 OID 16917)
-- Name: emission_formula_variable_code emission_formula_variable_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emission_formula_variable_code
    ADD CONSTRAINT emission_formula_variable_code_pkey PRIMARY KEY (code);


--
-- TOC entry 4528 (class 2606 OID 16919)
-- Name: emission_formula_variable emission_formula_variable_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emission_formula_variable
    ADD CONSTRAINT emission_formula_variable_pkey PRIMARY KEY (id);


--
-- TOC entry 4522 (class 2606 OID 16921)
-- Name: emission emission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emission
    ADD CONSTRAINT emission_pkey PRIMARY KEY (id);


--
-- TOC entry 4532 (class 2606 OID 16923)
-- Name: emissions_operating_type_code emissions_operating_type_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emissions_operating_type_code
    ADD CONSTRAINT emissions_operating_type_code_pkey PRIMARY KEY (code);


--
-- TOC entry 4534 (class 2606 OID 16925)
-- Name: emissions_process emissions_process_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emissions_process
    ADD CONSTRAINT emissions_process_pkey PRIMARY KEY (id);


--
-- TOC entry 4537 (class 2606 OID 16927)
-- Name: emissions_report emissions_report_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emissions_report
    ADD CONSTRAINT emissions_report_pkey PRIMARY KEY (id);


--
-- TOC entry 4541 (class 2606 OID 16929)
-- Name: emissions_unit emissions_unit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emissions_unit
    ADD CONSTRAINT emissions_unit_pkey PRIMARY KEY (id);


--
-- TOC entry 4543 (class 2606 OID 16931)
-- Name: energy_conversion_factor energy_conversion_factor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.energy_conversion_factor
    ADD CONSTRAINT energy_conversion_factor_pkey PRIMARY KEY (id);


--
-- TOC entry 4545 (class 2606 OID 16933)
-- Name: facility_category_code facility_category_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facility_category_code
    ADD CONSTRAINT facility_category_code_pkey PRIMARY KEY (code);


--
-- TOC entry 4550 (class 2606 OID 73810)
-- Name: facility_naics_xref facility_naics_xref_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facility_naics_xref
    ADD CONSTRAINT facility_naics_xref_pkey PRIMARY KEY (id);


--
-- TOC entry 4554 (class 2606 OID 16937)
-- Name: facility_site_contact facility_site_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facility_site_contact
    ADD CONSTRAINT facility_site_contact_pkey PRIMARY KEY (id);


--
-- TOC entry 4547 (class 2606 OID 16939)
-- Name: facility_site facility_site_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facility_site
    ADD CONSTRAINT facility_site_pkey PRIMARY KEY (id);


--
-- TOC entry 4556 (class 2606 OID 16941)
-- Name: facility_source_type_code facility_source_type_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facility_source_type_code
    ADD CONSTRAINT facility_source_type_code_pkey PRIMARY KEY (code);


--
-- TOC entry 4558 (class 2606 OID 16943)
-- Name: fips_country_code fips_country_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fips_country_code
    ADD CONSTRAINT fips_country_code_pkey PRIMARY KEY (code);


--
-- TOC entry 4560 (class 2606 OID 16945)
-- Name: fips_county fips_county_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fips_county
    ADD CONSTRAINT fips_county_pkey PRIMARY KEY (code);


--
-- TOC entry 4562 (class 2606 OID 16947)
-- Name: fips_state_code fips_state_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fips_state_code
    ADD CONSTRAINT fips_state_code_pkey PRIMARY KEY (code);


--
-- TOC entry 4564 (class 2606 OID 16949)
-- Name: hap_facility_category_code hap_facility_category_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hap_facility_category_code
    ADD CONSTRAINT hap_facility_category_code_pkey PRIMARY KEY (code);


--
-- TOC entry 4568 (class 2606 OID 16951)
-- Name: master_facility_record master_facility_record_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.master_facility_record
    ADD CONSTRAINT master_facility_record_pkey PRIMARY KEY (id);


--
-- TOC entry 4566 (class 2606 OID 16953)
-- Name: master_facility_naics_xref mfr_naics_xref_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.master_facility_naics_xref
    ADD CONSTRAINT mfr_naics_xref_pkey PRIMARY KEY (id);


--
-- TOC entry 4570 (class 2606 OID 16955)
-- Name: monthly_fuel_reporting monthly_fuel_reporting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monthly_fuel_reporting
    ADD CONSTRAINT monthly_fuel_reporting_pkey PRIMARY KEY (id);


--
-- TOC entry 4574 (class 2606 OID 16957)
-- Name: naics_code_industry naics_code_industry_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.naics_code_industry
    ADD CONSTRAINT naics_code_industry_pkey PRIMARY KEY (code_prefix);


--
-- TOC entry 4572 (class 2606 OID 16959)
-- Name: naics_code naics_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.naics_code
    ADD CONSTRAINT naics_code_pkey PRIMARY KEY (code);


--
-- TOC entry 4577 (class 2606 OID 16961)
-- Name: operating_detail operating_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operating_detail
    ADD CONSTRAINT operating_detail_pkey PRIMARY KEY (id);


--
-- TOC entry 4579 (class 2606 OID 16963)
-- Name: operating_status_code operating_status_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operating_status_code
    ADD CONSTRAINT operating_status_code_pkey PRIMARY KEY (code);


--
-- TOC entry 4581 (class 2606 OID 16965)
-- Name: point_source_scc_code point_source_scc_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.point_source_scc_code
    ADD CONSTRAINT point_source_scc_code_pkey PRIMARY KEY (code);


--
-- TOC entry 4583 (class 2606 OID 16967)
-- Name: pollutant pollutant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pollutant
    ADD CONSTRAINT pollutant_pkey PRIMARY KEY (pollutant_code);


--
-- TOC entry 4585 (class 2606 OID 16969)
-- Name: program_system_code program_system_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.program_system_code
    ADD CONSTRAINT program_system_code_pkey PRIMARY KEY (code);


--
-- TOC entry 4587 (class 2606 OID 16971)
-- Name: regulatory_code regulatory_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regulatory_code
    ADD CONSTRAINT regulatory_code_pkey PRIMARY KEY (code);


--
-- TOC entry 4591 (class 2606 OID 16973)
-- Name: release_point_appt release_point_appt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.release_point_appt
    ADD CONSTRAINT release_point_appt_pkey PRIMARY KEY (id);


--
-- TOC entry 4593 (class 2606 OID 16977)
-- Name: release_point_type_code release_point_type_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.release_point_type_code
    ADD CONSTRAINT release_point_type_code_pkey PRIMARY KEY (code);


--
-- TOC entry 4487 (class 2606 OID 16979)
-- Name: attachment report_attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachment
    ADD CONSTRAINT report_attachment_pkey PRIMARY KEY (id);


--
-- TOC entry 4597 (class 2606 OID 16981)
-- Name: report_history report_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_history
    ADD CONSTRAINT report_history_pkey PRIMARY KEY (id);


--
-- TOC entry 4624 (class 2606 OID 49170)
-- Name: report_tracker report_tracker_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_tracker
    ADD CONSTRAINT report_tracker_pkey PRIMARY KEY (id);


--
-- TOC entry 4600 (class 2606 OID 16983)
-- Name: reporting_period reporting_period_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reporting_period
    ADD CONSTRAINT reporting_period_pkey PRIMARY KEY (id);


--
-- TOC entry 4602 (class 2606 OID 16985)
-- Name: reporting_period_code reporting_period_type_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reporting_period_code
    ADD CONSTRAINT reporting_period_type_code_pkey PRIMARY KEY (code);


--
-- TOC entry 4604 (class 2606 OID 16987)
-- Name: schema_version_cef schema_version_cef_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_version_cef
    ADD CONSTRAINT schema_version_cef_pk PRIMARY KEY (installed_rank);


--
-- TOC entry 4607 (class 2606 OID 16989)
-- Name: slt_config slt_config_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slt_config
    ADD CONSTRAINT slt_config_pkey PRIMARY KEY (id);


--
-- TOC entry 4609 (class 2606 OID 16991)
-- Name: slt_properties slt_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slt_properties
    ADD CONSTRAINT slt_properties_pkey PRIMARY KEY (name);


--
-- TOC entry 4611 (class 2606 OID 16993)
-- Name: tribal_code tribal_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tribal_code
    ADD CONSTRAINT tribal_code_pkey PRIMARY KEY (code);


--
-- TOC entry 4613 (class 2606 OID 16995)
-- Name: unit_measure_code unit_measure_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unit_measure_code
    ADD CONSTRAINT unit_measure_code_pkey PRIMARY KEY (code);


--
-- TOC entry 4615 (class 2606 OID 16997)
-- Name: unit_type_code unit_type_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unit_type_code
    ADD CONSTRAINT unit_type_code_pkey PRIMARY KEY (code);


--
-- TOC entry 4617 (class 2606 OID 16999)
-- Name: user_facility_association user_facility_association_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_facility_association
    ADD CONSTRAINT user_facility_association_pkey PRIMARY KEY (id);


--
-- TOC entry 4619 (class 2606 OID 17001)
-- Name: user_facility_association user_facility_association_user_role_id_master_facility_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_facility_association
    ADD CONSTRAINT user_facility_association_user_role_id_master_facility_id_key UNIQUE (user_role_id, master_facility_id);


--
-- TOC entry 4622 (class 2606 OID 17003)
-- Name: user_feedback user_feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_feedback
    ADD CONSTRAINT user_feedback_pkey PRIMARY KEY (id);


--
-- TOC entry 4511 (class 1259 OID 98334)
-- Name: fki_control_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_control_fkey ON public.control_pollutant USING btree (control_id);


--
-- TOC entry 4508 (class 1259 OID 98350)
-- Name: fki_control_path_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_control_path_fkey ON public.control_path_pollutant USING btree (control_path_id);


--
-- TOC entry 4598 (class 1259 OID 65572)
-- Name: fki_emissions_process_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_emissions_process_fkey ON public.reporting_period USING btree (emissions_process_id);


--
-- TOC entry 4535 (class 1259 OID 65566)
-- Name: fki_emissions_unit_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_emissions_unit_fkey ON public.emissions_process USING btree (emissions_unit_id);


--
-- TOC entry 4551 (class 1259 OID 73774)
-- Name: fki_facility_naics_code_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_facility_naics_code_fkey ON public.facility_naics_xref USING btree (naics_code);


--
-- TOC entry 4588 (class 1259 OID 73795)
-- Name: fki_facility_site_cascade_delete_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_facility_site_cascade_delete_fkey ON public.release_point USING btree (facility_site_id);


--
-- TOC entry 4552 (class 1259 OID 57365)
-- Name: fki_facility_site_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_facility_site_fkey ON public.facility_naics_xref USING btree (id);


--
-- TOC entry 4548 (class 1259 OID 57371)
-- Name: fki_mailing_state_code_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_mailing_state_code_fkey ON public.facility_site USING btree (mailing_state_code);


--
-- TOC entry 4589 (class 1259 OID 65552)
-- Name: fki_report_tracker_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_report_tracker_fkey ON public.release_point USING btree (id);


--
-- TOC entry 4575 (class 1259 OID 81943)
-- Name: fki_reporting_period_cascade_delete_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_reporting_period_cascade_delete_fkey ON public.operating_detail USING btree (reporting_period_id);


--
-- TOC entry 4523 (class 1259 OID 65583)
-- Name: fki_reporting_period_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_reporting_period_fkey ON public.emission USING btree (reporting_period_id);


--
-- TOC entry 4520 (class 1259 OID 17004)
-- Name: i_eis_tri_xref_trifid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_eis_tri_xref_trifid ON public.eis_tri_xref USING btree (trifid);


--
-- TOC entry 4524 (class 1259 OID 17005)
-- Name: i_emissions_pollutantCode; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "i_emissions_pollutantCode" ON public.emission USING btree (pollutant_code);


--
-- TOC entry 4538 (class 1259 OID 17006)
-- Name: i_emissions_report_eisProgramId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "i_emissions_report_eisProgramId" ON public.emissions_report USING btree (eis_program_id);


--
-- TOC entry 4539 (class 1259 OID 17007)
-- Name: i_emissions_report_year; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_emissions_report_year ON public.emissions_report USING btree (year);


--
-- TOC entry 4620 (class 1259 OID 17008)
-- Name: i_user_feedback_year; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_user_feedback_year ON public.user_feedback USING btree (year);


--
-- TOC entry 4594 (class 1259 OID 17009)
-- Name: idx_report_history_reportid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_report_history_reportid ON public.report_history USING btree (report_id);


--
-- TOC entry 4595 (class 1259 OID 17010)
-- Name: idx_report_history_reportid_action; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_report_history_reportid_action ON public.report_history USING btree (report_id, action);


--
-- TOC entry 4605 (class 1259 OID 17011)
-- Name: schema_version_cef_s_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX schema_version_cef_s_idx ON public.schema_version_cef USING btree (success);


--
-- TOC entry 4713 (class 2606 OID 17013)
-- Name: reporting_period calc_param_uom_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reporting_period
    ADD CONSTRAINT calc_param_uom_fkey FOREIGN KEY (calculation_parameter_uom) REFERENCES public.unit_measure_code(code);


--
-- TOC entry 4714 (class 2606 OID 17018)
-- Name: reporting_period calculation_material_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reporting_period
    ADD CONSTRAINT calculation_material_code_fkey FOREIGN KEY (calculation_material_code) REFERENCES public.calculation_material_code(code);


--
-- TOC entry 4695 (class 2606 OID 17023)
-- Name: point_source_scc_code calculation_material_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.point_source_scc_code
    ADD CONSTRAINT calculation_material_code_fkey FOREIGN KEY (calculation_material_code) REFERENCES public.calculation_material_code(code);


--
-- TOC entry 4715 (class 2606 OID 17028)
-- Name: reporting_period calculation_parameter_type_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reporting_period
    ADD CONSTRAINT calculation_parameter_type_code_fkey FOREIGN KEY (calculation_parameter_type_code) REFERENCES public.calculation_parameter_type_code(code);


--
-- TOC entry 4666 (class 2606 OID 17033)
-- Name: facility_site category_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facility_site
    ADD CONSTRAINT category_code_fkey FOREIGN KEY (category_code) REFERENCES public.facility_category_code(code);


--
-- TOC entry 4685 (class 2606 OID 17038)
-- Name: master_facility_record category_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.master_facility_record
    ADD CONSTRAINT category_code_fkey FOREIGN KEY (category_code) REFERENCES public.facility_category_code(code);


--
-- TOC entry 4663 (class 2606 OID 17043)
-- Name: energy_conversion_factor cf_denominator_uom_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.energy_conversion_factor
    ADD CONSTRAINT cf_denominator_uom_fkey FOREIGN KEY (denominator_uom_code) REFERENCES public.unit_measure_code(code);


--
-- TOC entry 4664 (class 2606 OID 17048)
-- Name: energy_conversion_factor cf_numerator_uom_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.energy_conversion_factor
    ADD CONSTRAINT cf_numerator_uom_fkey FOREIGN KEY (numerator_uom_code) REFERENCES public.unit_measure_code(code);


--
-- TOC entry 4625 (class 2606 OID 17053)
-- Name: attachment communication_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachment
    ADD CONSTRAINT communication_fkey FOREIGN KEY (communication_id) REFERENCES public.communication(id);


--
-- TOC entry 4636 (class 2606 OID 98329)
-- Name: control_pollutant control_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.control_pollutant
    ADD CONSTRAINT control_fkey FOREIGN KEY (control_id) REFERENCES public.control(id) ON DELETE CASCADE;


--
-- TOC entry 4627 (class 2606 OID 17078)
-- Name: control control_measure_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.control
    ADD CONSTRAINT control_measure_code_fkey FOREIGN KEY (control_measure_code) REFERENCES public.control_measure_code(code);


--
-- TOC entry 4634 (class 2606 OID 98345)
-- Name: control_path_pollutant control_path_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.control_path_pollutant
    ADD CONSTRAINT control_path_fkey FOREIGN KEY (control_path_id) REFERENCES public.control_path(id) ON DELETE CASCADE;


--
-- TOC entry 4631 (class 2606 OID 106522)
-- Name: control_assignment control_path_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.control_assignment
    ADD CONSTRAINT control_path_fkey FOREIGN KEY (control_path_id) REFERENCES public.control_path(id) ON DELETE CASCADE;


--
-- TOC entry 4633 (class 2606 OID 17088)
-- Name: control_path_pollutant control_path_pollutant_pollutant_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.control_path_pollutant
    ADD CONSTRAINT control_path_pollutant_pollutant_fkey FOREIGN KEY (pollutant_code) REFERENCES public.pollutant(pollutant_code);


--
-- TOC entry 4635 (class 2606 OID 17093)
-- Name: control_pollutant control_pollutant_pollutant_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.control_pollutant
    ADD CONSTRAINT control_pollutant_pollutant_fkey FOREIGN KEY (pollutant_code) REFERENCES public.pollutant(pollutant_code);


--
-- TOC entry 4628 (class 2606 OID 17098)
-- Name: control control_previous_year_status_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.control
    ADD CONSTRAINT control_previous_year_status_code_fkey FOREIGN KEY (previous_year_status_code) REFERENCES public.operating_status_code(code);


--
-- TOC entry 4629 (class 2606 OID 17103)
-- Name: control control_status_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.control
    ADD CONSTRAINT control_status_code_fkey FOREIGN KEY (status_code) REFERENCES public.operating_status_code(code);


--
-- TOC entry 4667 (class 2606 OID 17108)
-- Name: facility_site county_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facility_site
    ADD CONSTRAINT county_code_fkey FOREIGN KEY (county_code) REFERENCES public.fips_county(code);


--
-- TOC entry 4677 (class 2606 OID 17113)
-- Name: facility_site_contact county_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facility_site_contact
    ADD CONSTRAINT county_code_fkey FOREIGN KEY (county_code) REFERENCES public.fips_county(code);


--
-- TOC entry 4686 (class 2606 OID 17118)
-- Name: master_facility_record county_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.master_facility_record
    ADD CONSTRAINT county_code_fkey FOREIGN KEY (county_code) REFERENCES public.fips_county(code);


--
-- TOC entry 4646 (class 2606 OID 17123)
-- Name: emission_factor ef_calc_material_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emission_factor
    ADD CONSTRAINT ef_calc_material_fkey FOREIGN KEY (calculation_material_code) REFERENCES public.calculation_material_code(code);


--
-- TOC entry 4665 (class 2606 OID 17128)
-- Name: energy_conversion_factor ef_calc_material_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.energy_conversion_factor
    ADD CONSTRAINT ef_calc_material_fkey FOREIGN KEY (calculation_material_code) REFERENCES public.calculation_material_code(code);


--
-- TOC entry 4647 (class 2606 OID 17133)
-- Name: emission_factor ef_calc_parameter_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emission_factor
    ADD CONSTRAINT ef_calc_parameter_fkey FOREIGN KEY (calculation_parameter_type_code) REFERENCES public.calculation_parameter_type_code(code);


--
-- TOC entry 4648 (class 2606 OID 17138)
-- Name: emission_factor ef_control_measure_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emission_factor
    ADD CONSTRAINT ef_control_measure_fkey FOREIGN KEY (control_measure_code) REFERENCES public.control_measure_code(code);


--
-- TOC entry 4649 (class 2606 OID 17143)
-- Name: emission_factor ef_denominator_uom_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emission_factor
    ADD CONSTRAINT ef_denominator_uom_fkey FOREIGN KEY (denominator_uom_code) REFERENCES public.unit_measure_code(code);


--
-- TOC entry 4650 (class 2606 OID 17148)
-- Name: emission_factor ef_numerator_uom_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emission_factor
    ADD CONSTRAINT ef_numerator_uom_fkey FOREIGN KEY (numerator_uom_code) REFERENCES public.unit_measure_code(code);


--
-- TOC entry 4637 (class 2606 OID 17153)
-- Name: eis_transaction_attachment eis_transaction_history_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eis_transaction_attachment
    ADD CONSTRAINT eis_transaction_history_fkey FOREIGN KEY (eis_transaction_history_id) REFERENCES public.eis_transaction_history(id);


--
-- TOC entry 4639 (class 2606 OID 17158)
-- Name: emission emission_denominator_uom_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emission
    ADD CONSTRAINT emission_denominator_uom_fkey FOREIGN KEY (emissions_denominator_uom) REFERENCES public.unit_measure_code(code);


--
-- TOC entry 4651 (class 2606 OID 17163)
-- Name: emission_formula_variable emission_formula_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emission_formula_variable
    ADD CONSTRAINT emission_formula_code_fkey FOREIGN KEY (emission_formula_variable_code) REFERENCES public.emission_formula_variable_code(code);


--
-- TOC entry 4640 (class 2606 OID 17168)
-- Name: emission emission_numerator_uom_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emission
    ADD CONSTRAINT emission_numerator_uom_fkey FOREIGN KEY (emissions_numerator_uom) REFERENCES public.unit_measure_code(code);


--
-- TOC entry 4641 (class 2606 OID 17178)
-- Name: emission emission_uom_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emission
    ADD CONSTRAINT emission_uom_fkey FOREIGN KEY (emissions_uom_code) REFERENCES public.unit_measure_code(code);


--
-- TOC entry 4642 (class 2606 OID 17183)
-- Name: emission emissions_calc_method_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emission
    ADD CONSTRAINT emissions_calc_method_code_fkey FOREIGN KEY (emissions_calc_method_code) REFERENCES public.calculation_method_code(code);


--
-- TOC entry 4643 (class 2606 OID 17188)
-- Name: emission emissions_pollutant_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emission
    ADD CONSTRAINT emissions_pollutant_fkey FOREIGN KEY (pollutant_code) REFERENCES public.pollutant(pollutant_code);


--
-- TOC entry 4721 (class 2606 OID 90131)
-- Name: reporting_period emissions_process_cascade_delete_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reporting_period
    ADD CONSTRAINT emissions_process_cascade_delete_fkey FOREIGN KEY (emissions_process_id) REFERENCES public.emissions_process(id) ON DELETE CASCADE;


--
-- TOC entry 4711 (class 2606 OID 65573)
-- Name: release_point_appt emissions_process_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.release_point_appt
    ADD CONSTRAINT emissions_process_fkey FOREIGN KEY (emissions_process_id) REFERENCES public.emissions_process(id) ON DELETE CASCADE;


--
-- TOC entry 4652 (class 2606 OID 17198)
-- Name: emissions_process emissions_process_previous_year_status_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emissions_process
    ADD CONSTRAINT emissions_process_previous_year_status_code_fkey FOREIGN KEY (previous_year_status_code) REFERENCES public.operating_status_code(code);


--
-- TOC entry 4653 (class 2606 OID 17203)
-- Name: emissions_process emissions_process_status_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emissions_process
    ADD CONSTRAINT emissions_process_status_fkey FOREIGN KEY (status_code) REFERENCES public.operating_status_code(code);


--
-- TOC entry 4712 (class 2606 OID 17213)
-- Name: report_history emissions_report_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_history
    ADD CONSTRAINT emissions_report_fkey FOREIGN KEY (report_id) REFERENCES public.emissions_report(id);


--
-- TOC entry 4626 (class 2606 OID 17218)
-- Name: attachment emissions_report_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachment
    ADD CONSTRAINT emissions_report_fkey FOREIGN KEY (report_id) REFERENCES public.emissions_report(id) ON DELETE CASCADE;


--
-- TOC entry 4655 (class 2606 OID 65561)
-- Name: emissions_process emissions_unit_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emissions_process
    ADD CONSTRAINT emissions_unit_fkey FOREIGN KEY (emissions_unit_id) REFERENCES public.emissions_unit(id) ON DELETE CASCADE;


--
-- TOC entry 4658 (class 2606 OID 17223)
-- Name: emissions_unit emissions_unit_previous_year_status_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emissions_unit
    ADD CONSTRAINT emissions_unit_previous_year_status_code_fkey FOREIGN KEY (previous_year_status_code) REFERENCES public.operating_status_code(code);


--
-- TOC entry 4644 (class 2606 OID 17228)
-- Name: emission energy_conversion_factor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emission
    ADD CONSTRAINT energy_conversion_factor_fkey FOREIGN KEY (energy_conversion_factor_id) REFERENCES public.energy_conversion_factor(id);


--
-- TOC entry 4696 (class 2606 OID 17233)
-- Name: release_point exit_gas_flow_uom_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.release_point
    ADD CONSTRAINT exit_gas_flow_uom_fkey FOREIGN KEY (exit_gas_flow_uom_code) REFERENCES public.unit_measure_code(code);


--
-- TOC entry 4697 (class 2606 OID 17238)
-- Name: release_point exit_gas_velocity_uom_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.release_point
    ADD CONSTRAINT exit_gas_velocity_uom_fkey FOREIGN KEY (exit_gas_velocity_uom_code) REFERENCES public.unit_measure_code(code);


--
-- TOC entry 4675 (class 2606 OID 73769)
-- Name: facility_naics_xref facility_naics_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facility_naics_xref
    ADD CONSTRAINT facility_naics_code_fkey FOREIGN KEY (naics_code) REFERENCES public.naics_code(code);


--
-- TOC entry 4710 (class 2606 OID 73790)
-- Name: release_point facility_site_cascade_delete_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.release_point
    ADD CONSTRAINT facility_site_cascade_delete_fkey FOREIGN KEY (facility_site_id) REFERENCES public.facility_site(id) ON DELETE CASCADE;


--
-- TOC entry 4676 (class 2606 OID 73804)
-- Name: facility_naics_xref facility_site_cascade_delete_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facility_naics_xref
    ADD CONSTRAINT facility_site_cascade_delete_fkey FOREIGN KEY (facility_site_id) REFERENCES public.facility_site(id) ON DELETE CASCADE;


--
-- TOC entry 4678 (class 2606 OID 17253)
-- Name: facility_site_contact facility_site_contact_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facility_site_contact
    ADD CONSTRAINT facility_site_contact_fkey FOREIGN KEY (type) REFERENCES public.contact_type_code(code);


--
-- TOC entry 4662 (class 2606 OID 65555)
-- Name: emissions_unit facility_site_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emissions_unit
    ADD CONSTRAINT facility_site_fkey FOREIGN KEY (facility_site_id) REFERENCES public.facility_site(id) ON DELETE CASCADE;


--
-- TOC entry 4709 (class 2606 OID 73785)
-- Name: release_point facility_site_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.release_point
    ADD CONSTRAINT facility_site_fkey FOREIGN KEY (facility_site_id) REFERENCES public.facility_site(id) ON DELETE CASCADE;


--
-- TOC entry 4630 (class 2606 OID 98321)
-- Name: control facility_site_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.control
    ADD CONSTRAINT facility_site_fkey FOREIGN KEY (facility_site_id) REFERENCES public.facility_site(id) ON DELETE CASCADE;


--
-- TOC entry 4632 (class 2606 OID 98337)
-- Name: control_path facility_site_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.control_path
    ADD CONSTRAINT facility_site_fkey FOREIGN KEY (facility_site_id) REFERENCES public.facility_site(id) ON DELETE CASCADE;


--
-- TOC entry 4681 (class 2606 OID 180236)
-- Name: facility_site_contact facility_site_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facility_site_contact
    ADD CONSTRAINT facility_site_fkey FOREIGN KEY (facility_site_id) REFERENCES public.facility_site(id) ON DELETE CASCADE;


--
-- TOC entry 4698 (class 2606 OID 17263)
-- Name: release_point fence_line_distance_uom_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.release_point
    ADD CONSTRAINT fence_line_distance_uom_fkey FOREIGN KEY (fence_line_distance_uom_code) REFERENCES public.unit_measure_code(code);


--
-- TOC entry 4682 (class 2606 OID 17268)
-- Name: fips_county fips_county_state_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fips_county
    ADD CONSTRAINT fips_county_state_code_fkey FOREIGN KEY (state_code) REFERENCES public.fips_state_code(code);


--
-- TOC entry 4716 (class 2606 OID 17273)
-- Name: reporting_period fuel_use_material_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reporting_period
    ADD CONSTRAINT fuel_use_material_code_fkey FOREIGN KEY (fuel_use_material_code) REFERENCES public.calculation_material_code(code);


--
-- TOC entry 4717 (class 2606 OID 17278)
-- Name: reporting_period fuel_use_uom_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reporting_period
    ADD CONSTRAINT fuel_use_uom_fkey FOREIGN KEY (fuel_use_uom) REFERENCES public.unit_measure_code(code);


--
-- TOC entry 4699 (class 2606 OID 17283)
-- Name: release_point fugitive_height_uom_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.release_point
    ADD CONSTRAINT fugitive_height_uom_fkey FOREIGN KEY (fugitive_height_uom_code) REFERENCES public.unit_measure_code(code);


--
-- TOC entry 4700 (class 2606 OID 17288)
-- Name: release_point fugitive_length_uom_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.release_point
    ADD CONSTRAINT fugitive_length_uom_fkey FOREIGN KEY (fugitive_length_uom_code) REFERENCES public.unit_measure_code(code);


--
-- TOC entry 4701 (class 2606 OID 17293)
-- Name: release_point fugitive_width_uom_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.release_point
    ADD CONSTRAINT fugitive_width_uom_fkey FOREIGN KEY (fugitive_width_uom_code) REFERENCES public.unit_measure_code(code);


--
-- TOC entry 4718 (class 2606 OID 17298)
-- Name: reporting_period heat_content_uom_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reporting_period
    ADD CONSTRAINT heat_content_uom_fkey FOREIGN KEY (heat_content_uom) REFERENCES public.unit_measure_code(code);


--
-- TOC entry 4679 (class 2606 OID 17303)
-- Name: facility_site_contact mailing_state_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facility_site_contact
    ADD CONSTRAINT mailing_state_code_fkey FOREIGN KEY (mailing_state_code) REFERENCES public.fips_state_code(code);


--
-- TOC entry 4687 (class 2606 OID 17313)
-- Name: master_facility_record mailing_state_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.master_facility_record
    ADD CONSTRAINT mailing_state_code_fkey FOREIGN KEY (mailing_state_code) REFERENCES public.fips_state_code(code);


--
-- TOC entry 4672 (class 2606 OID 57366)
-- Name: facility_site mailing_state_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facility_site
    ADD CONSTRAINT mailing_state_code_fkey FOREIGN KEY (mailing_state_code) REFERENCES public.fips_state_code(code);


--
-- TOC entry 4724 (class 2606 OID 17318)
-- Name: user_facility_association master_facility_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_facility_association
    ADD CONSTRAINT master_facility_id_fkey FOREIGN KEY (master_facility_id) REFERENCES public.master_facility_record(id);


--
-- TOC entry 4656 (class 2606 OID 17323)
-- Name: emissions_report master_facility_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emissions_report
    ADD CONSTRAINT master_facility_id_fkey FOREIGN KEY (master_facility_id) REFERENCES public.master_facility_record(id);


--
-- TOC entry 4683 (class 2606 OID 17328)
-- Name: master_facility_naics_xref mfr_naics_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.master_facility_naics_xref
    ADD CONSTRAINT mfr_naics_code_fkey FOREIGN KEY (naics_code) REFERENCES public.naics_code(code);


--
-- TOC entry 4684 (class 2606 OID 17333)
-- Name: master_facility_naics_xref mfr_naics_mfr_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.master_facility_naics_xref
    ADD CONSTRAINT mfr_naics_mfr_fkey FOREIGN KEY (master_facility_id) REFERENCES public.master_facility_record(id);


--
-- TOC entry 4722 (class 2606 OID 17338)
-- Name: slt_config name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slt_config
    ADD CONSTRAINT name_fkey FOREIGN KEY (name) REFERENCES public.slt_properties(name);


--
-- TOC entry 4654 (class 2606 OID 17358)
-- Name: emissions_process process_aircraft_engine_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emissions_process
    ADD CONSTRAINT process_aircraft_engine_fkey FOREIGN KEY (aircraft_engine_type_code) REFERENCES public.aircraft_engine_type_code(code);


--
-- TOC entry 4668 (class 2606 OID 17363)
-- Name: facility_site program_system_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facility_site
    ADD CONSTRAINT program_system_code_fkey FOREIGN KEY (program_system_code) REFERENCES public.program_system_code(code);


--
-- TOC entry 4657 (class 2606 OID 17368)
-- Name: emissions_report program_system_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emissions_report
    ADD CONSTRAINT program_system_code_fkey FOREIGN KEY (program_system_code) REFERENCES public.program_system_code(code);


--
-- TOC entry 4723 (class 2606 OID 17373)
-- Name: slt_config program_system_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slt_config
    ADD CONSTRAINT program_system_code_fkey FOREIGN KEY (program_system_code) REFERENCES public.program_system_code(code);


--
-- TOC entry 4638 (class 2606 OID 17378)
-- Name: eis_transaction_history program_system_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eis_transaction_history
    ADD CONSTRAINT program_system_code_fkey FOREIGN KEY (program_system_code) REFERENCES public.program_system_code(code);


--
-- TOC entry 4725 (class 2606 OID 17383)
-- Name: user_feedback program_system_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_feedback
    ADD CONSTRAINT program_system_code_fkey FOREIGN KEY (program_system_code) REFERENCES public.program_system_code(code);


--
-- TOC entry 4688 (class 2606 OID 17388)
-- Name: master_facility_record program_system_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.master_facility_record
    ADD CONSTRAINT program_system_code_fkey FOREIGN KEY (program_system_code) REFERENCES public.program_system_code(code);


--
-- TOC entry 4702 (class 2606 OID 17403)
-- Name: release_point release_point_previous_year_status_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.release_point
    ADD CONSTRAINT release_point_previous_year_status_code_fkey FOREIGN KEY (previous_year_status_code) REFERENCES public.operating_status_code(code);


--
-- TOC entry 4703 (class 2606 OID 17408)
-- Name: release_point release_point_type_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.release_point
    ADD CONSTRAINT release_point_type_code_fkey FOREIGN KEY (type_code) REFERENCES public.release_point_type_code(code);


--
-- TOC entry 4673 (class 2606 OID 73780)
-- Name: facility_site report_tracker_cascade_delete_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facility_site
    ADD CONSTRAINT report_tracker_cascade_delete_fkey FOREIGN KEY (report_id) REFERENCES public.report_tracker(id) ON DELETE CASCADE;


--
-- TOC entry 4674 (class 2606 OID 73775)
-- Name: facility_site report_tracker_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facility_site
    ADD CONSTRAINT report_tracker_fkey FOREIGN KEY (report_id) REFERENCES public.report_tracker(id) ON DELETE CASCADE;


--
-- TOC entry 4719 (class 2606 OID 17428)
-- Name: reporting_period reporting_period_emissions_operating_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reporting_period
    ADD CONSTRAINT reporting_period_emissions_operating_fkey FOREIGN KEY (emissions_operating_type_code) REFERENCES public.emissions_operating_type_code(code);


--
-- TOC entry 4645 (class 2606 OID 65578)
-- Name: emission reporting_period_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emission
    ADD CONSTRAINT reporting_period_fkey FOREIGN KEY (reporting_period_id) REFERENCES public.reporting_period(id) ON DELETE CASCADE;


--
-- TOC entry 4694 (class 2606 OID 81933)
-- Name: operating_detail reporting_period_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.operating_detail
    ADD CONSTRAINT reporting_period_fkey FOREIGN KEY (reporting_period_id) REFERENCES public.reporting_period(id) ON DELETE CASCADE;


--
-- TOC entry 4693 (class 2606 OID 17433)
-- Name: monthly_fuel_reporting reporting_period_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monthly_fuel_reporting
    ADD CONSTRAINT reporting_period_id FOREIGN KEY (reporting_period_id) REFERENCES public.reporting_period(id);


--
-- TOC entry 4720 (class 2606 OID 17438)
-- Name: reporting_period reporting_period_type_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reporting_period
    ADD CONSTRAINT reporting_period_type_code_fkey FOREIGN KEY (reporting_period_type_code) REFERENCES public.reporting_period_code(code);


--
-- TOC entry 4704 (class 2606 OID 17443)
-- Name: release_point rp_operating_status_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.release_point
    ADD CONSTRAINT rp_operating_status_fkey FOREIGN KEY (status_code) REFERENCES public.operating_status_code(code);


--
-- TOC entry 4669 (class 2606 OID 17448)
-- Name: facility_site source_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facility_site
    ADD CONSTRAINT source_code_fkey FOREIGN KEY (source_type_code) REFERENCES public.facility_source_type_code(code);


--
-- TOC entry 4689 (class 2606 OID 17453)
-- Name: master_facility_record source_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.master_facility_record
    ADD CONSTRAINT source_code_fkey FOREIGN KEY (source_type_code) REFERENCES public.facility_source_type_code(code);


--
-- TOC entry 4705 (class 2606 OID 17458)
-- Name: release_point stack_diameter_uom_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.release_point
    ADD CONSTRAINT stack_diameter_uom_fkey FOREIGN KEY (stack_diameter_uom_code) REFERENCES public.unit_measure_code(code);


--
-- TOC entry 4706 (class 2606 OID 17463)
-- Name: release_point stack_height_uom_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.release_point
    ADD CONSTRAINT stack_height_uom_fkey FOREIGN KEY (stack_height_uom_code) REFERENCES public.unit_measure_code(code);


--
-- TOC entry 4707 (class 2606 OID 17468)
-- Name: release_point stack_length_uom_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.release_point
    ADD CONSTRAINT stack_length_uom_fkey FOREIGN KEY (stack_length_uom_code) REFERENCES public.unit_measure_code(code);


--
-- TOC entry 4708 (class 2606 OID 17473)
-- Name: release_point stack_width_uom_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.release_point
    ADD CONSTRAINT stack_width_uom_fkey FOREIGN KEY (stack_width_uom_code) REFERENCES public.unit_measure_code(code);


--
-- TOC entry 4680 (class 2606 OID 17478)
-- Name: facility_site_contact state_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facility_site_contact
    ADD CONSTRAINT state_code_fkey FOREIGN KEY (state_code) REFERENCES public.fips_state_code(code);


--
-- TOC entry 4690 (class 2606 OID 17488)
-- Name: master_facility_record state_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.master_facility_record
    ADD CONSTRAINT state_code_fkey FOREIGN KEY (state_code) REFERENCES public.fips_state_code(code);


--
-- TOC entry 4670 (class 2606 OID 17493)
-- Name: facility_site status_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facility_site
    ADD CONSTRAINT status_code_fkey FOREIGN KEY (status_code) REFERENCES public.operating_status_code(code);


--
-- TOC entry 4691 (class 2606 OID 17498)
-- Name: master_facility_record status_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.master_facility_record
    ADD CONSTRAINT status_code_fkey FOREIGN KEY (status_code) REFERENCES public.operating_status_code(code);


--
-- TOC entry 4671 (class 2606 OID 17503)
-- Name: facility_site tribal_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facility_site
    ADD CONSTRAINT tribal_code_fkey FOREIGN KEY (tribal_code) REFERENCES public.tribal_code(code);


--
-- TOC entry 4692 (class 2606 OID 17508)
-- Name: master_facility_record tribal_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.master_facility_record
    ADD CONSTRAINT tribal_code_fkey FOREIGN KEY (tribal_code) REFERENCES public.tribal_code(code);


--
-- TOC entry 4659 (class 2606 OID 17518)
-- Name: emissions_unit unit_measure_cd_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emissions_unit
    ADD CONSTRAINT unit_measure_cd_fkey FOREIGN KEY (unit_measure_cd) REFERENCES public.unit_measure_code(code);


--
-- TOC entry 4660 (class 2606 OID 17523)
-- Name: emissions_unit unit_status_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emissions_unit
    ADD CONSTRAINT unit_status_code_fkey FOREIGN KEY (status_code) REFERENCES public.operating_status_code(code);


--
-- TOC entry 4661 (class 2606 OID 17528)
-- Name: emissions_unit unit_type_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emissions_unit
    ADD CONSTRAINT unit_type_code_fkey FOREIGN KEY (type_code) REFERENCES public.unit_type_code(code);


--
-- TOC entry 4726 (class 2606 OID 17533)
-- Name: user_feedback user_feedback_report_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_feedback
    ADD CONSTRAINT user_feedback_report_id_fkey FOREIGN KEY (report_id) REFERENCES public.emissions_report(id);


--
-- TOC entry 4871 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM rdsadmin;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2024-01-29 13:54:44

--
-- PostgreSQL database dump complete

-- Create user CAERS_READONLY with password caersread
CREATE USER CAERS_READONLY WITH PASSWORD 'caersread';
-- Grant CONNECT privilege to allow CAERS_READONLY to connect to the database (replace aws_db_test)
GRANT CONNECT ON DATABASE "CAERSLocal" TO CAERS_READONLY;
-- Grant USAGE privilege on the schema (replace test_schema)
-- USAGE needs to be assigned on schema otherwise CAERS_READONLY will not be able to see the tables within.
GRANT USAGE ON SCHEMA public TO CAERS_READONLY;
-- Grant SELECT on all of the tables within the schema (replace test_schema)
GRANT SELECT ON ALL TABLES IN SCHEMA public TO CAERS_READONLY;
--
