--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7
-- Dumped by pg_dump version 14.1

-- Started on 2024-02-06 14:40:07

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
-- TOC entry 4499 (class 0 OID 16563)
-- Dependencies: 242
-- Data for Name: emission_formula_variable_code; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.emission_formula_variable_code VALUES ('A', '% Ash', 'PERCENT');
INSERT INTO public.emission_formula_variable_code VALUES ('SU', '% Sulfur', 'PERCENT');
INSERT INTO public.emission_formula_variable_code VALUES ('CaSu', 'Calcium vs Sulfur Proportion', 'CASU');
INSERT INTO public.emission_formula_variable_code VALUES ('SG', 'SG in gr/100 ft3', 'REQUIRED');
INSERT INTO public.emission_formula_variable_code VALUES ('YI', 'Initial baker''s percent of yeast', 'PERCENT');
INSERT INTO public.emission_formula_variable_code VALUES ('TI', 'Total yeast action time in hours', 'REQUIRED');
INSERT INTO public.emission_formula_variable_code VALUES ('SPK', 'Final (spike) baker''s percent of yeast', 'REQUIRED');
INSERT INTO public.emission_formula_variable_code VALUES ('TS', 'Spiking time in hours (to the nearest tenth)', 'REQUIRED');
INSERT INTO public.emission_formula_variable_code VALUES ('S', 'Surface material silt content (%)', 'PERCENT');
INSERT INTO public.emission_formula_variable_code VALUES ('WMV', 'Mean vehicle weight (tons)', 'REQUIRED');
INSERT INTO public.emission_formula_variable_code VALUES ('P', 'Days of Precipitation in the year', 'DAY_PER_YEAR');
INSERT INTO public.emission_formula_variable_code VALUES ('SL', 'Road surface silt loading (grams per square meter) (g/m2 )', 'REQUIRED');
INSERT INTO public.emission_formula_variable_code VALUES ('M', 'Material moisture content (%)', 'PERCENT');
INSERT INTO public.emission_formula_variable_code VALUES ('U', 'Mean wind speed, meters per second (m/s) ', 'REQUIRED');
INSERT INTO public.emission_formula_variable_code VALUES ('SMV', 'Mean Vehicle Speed (mph)', 'REQUIRED');


-- Completed on 2024-02-06 14:40:12

--
-- PostgreSQL database dump complete
--

