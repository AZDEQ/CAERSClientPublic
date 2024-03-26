--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7
-- Dumped by pg_dump version 14.1

-- Started on 2024-02-06 14:43:28

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
-- TOC entry 4499 (class 0 OID 16568)
-- Dependencies: 245
-- Data for Name: emissions_operating_type_code; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.emissions_operating_type_code VALUES ('R', 'Routine', 'The normal or typical emissions for a reporting period.');
INSERT INTO public.emissions_operating_type_code VALUES ('U', 'Upset', 'Emissions over and above the Routine emissions which occur as a result of unexpected occurrences.');
INSERT INTO public.emissions_operating_type_code VALUES ('SU', 'Startup', 'Emissions over and above the Routine emissions which occur as a result of planned Startup operations.');
INSERT INTO public.emissions_operating_type_code VALUES ('SD', 'Shutdown', 'Emissions over and above the Routine emissions which occur as a result of planned Shutdown operations.');


-- Completed on 2024-02-06 14:43:32

--
-- PostgreSQL database dump complete
--

