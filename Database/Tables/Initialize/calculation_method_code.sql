--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7
-- Dumped by pg_dump version 14.1

-- Started on 2024-02-13 13:19:18

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

--
-- TOC entry 4499 (class 0 OID 16455)
-- Dependencies: 215
-- Data for Name: calculation_method_code; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.calculation_method_code VALUES ('10', 'Site-Specific Emission Factor (no Control Efficiency used)', false, false, false);
INSERT INTO public.calculation_method_code VALUES ('11', 'Vendor Emission Factor (no Control Efficiency used)', false, false, false);
INSERT INTO public.calculation_method_code VALUES ('12', 'Trade Group Emission Factor (no Control Efficiency used)', false, false, false);
INSERT INTO public.calculation_method_code VALUES ('13', 'Other Emission Factor (no Control Efficiency used)', false, false, false);
INSERT INTO public.calculation_method_code VALUES ('9', 'S/L/T Emission Factor (no Control Efficiency used)', false, false, false);
INSERT INTO public.calculation_method_code VALUES ('40', 'Emission Factor based on Regional Testing Program', false, false, false);
INSERT INTO public.calculation_method_code VALUES ('41', 'Emission Factor based on data available peer reviewed literature', false, false, false);
INSERT INTO public.calculation_method_code VALUES ('42', 'Emission Factor based on Fire Emission Production Simulator (FEPS)', false, false, false);
INSERT INTO public.calculation_method_code VALUES ('1', 'Continuous Emission Monitoring System', true, false, false);
INSERT INTO public.calculation_method_code VALUES ('2', 'Engineering Judgment', true, false, false);
INSERT INTO public.calculation_method_code VALUES ('3', 'Material Balance', true, false, false);
INSERT INTO public.calculation_method_code VALUES ('5', 'USEPA Speciation Profile', true, false, false);
INSERT INTO public.calculation_method_code VALUES ('6', 'S/L/T Speciation Profile', true, false, false);
INSERT INTO public.calculation_method_code VALUES ('7', 'Manufacturer Specification', true, false, false);
INSERT INTO public.calculation_method_code VALUES ('8', 'USEPA Emission Factor (no Control Efficiency used)', false, true, false);
INSERT INTO public.calculation_method_code VALUES ('4', 'Stack Test (no Control Efficiency used)', true, false, false);
INSERT INTO public.calculation_method_code VALUES ('29', 'S/L/T Emission Factor (pre-control) plus Control Efficiency', false, false, true);
INSERT INTO public.calculation_method_code VALUES ('30', 'Site-Specific Emission Factor (pre-control) plus Control Efficiency', false, false, true);
INSERT INTO public.calculation_method_code VALUES ('31', 'Vendor Emission Factor (pre-control) plus Control Efficiency', false, false, true);
INSERT INTO public.calculation_method_code VALUES ('32', 'Trade Group Emission Factor (pre-control) plus Control Efficiency', false, false, true);
INSERT INTO public.calculation_method_code VALUES ('33', 'Other Emission Factor (pre-control) plus Control Efficiency', false, false, true);
INSERT INTO public.calculation_method_code VALUES ('28', 'USEPA Emission Factor (pre-control) plus Control Efficiency', false, true, true);
INSERT INTO public.calculation_method_code VALUES ('24', 'Stack Test (pre-control) plus Control Efficiency', true, false, true);


-- Completed on 2024-02-13 13:19:22

--
-- PostgreSQL database dump complete
--

