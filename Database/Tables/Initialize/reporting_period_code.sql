--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7
-- Dumped by pg_dump version 14.1

-- Started on 2024-02-12 15:00:22

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
-- TOC entry 4499 (class 0 OID 16740)
-- Dependencies: 290
-- Data for Name: reporting_period_code; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.reporting_period_code VALUES ('5MN', '5 Month Ozone Season', 'The total emissions for the May 1 thru Sept 30 period ozone season specified for reporting by the NOx SIP Call and the CAIR rule.');
INSERT INTO public.reporting_period_code VALUES ('A', 'Annual', 'The total emissions for a full year.');
INSERT INTO public.reporting_period_code VALUES ('APR', 'April', 'Total emissions for a 1-month period.');
INSERT INTO public.reporting_period_code VALUES ('AUG', 'August', 'Total emissions for a 1-month period.');
INSERT INTO public.reporting_period_code VALUES ('DEC', 'December', 'Total emissions for a 1-month period.');
INSERT INTO public.reporting_period_code VALUES ('E', 'Episodic', 'The emissions for a specific actual day or contiguous range of days.');
INSERT INTO public.reporting_period_code VALUES ('FEB', 'February', 'Total emissions for a 1-month period.');
INSERT INTO public.reporting_period_code VALUES ('JAN', 'January', 'Total emissions for a 1-month period.');
INSERT INTO public.reporting_period_code VALUES ('JUL', 'July', 'Total emissions for a 1-month period.');
INSERT INTO public.reporting_period_code VALUES ('JUN', 'June', 'Total emissions for a 1-month period.');
INSERT INTO public.reporting_period_code VALUES ('MAR', 'March', 'Total emissions for a 1-month period.');
INSERT INTO public.reporting_period_code VALUES ('MAY', 'May', 'Total emissions for a 1-month period.');
INSERT INTO public.reporting_period_code VALUES ('NOV', 'November', 'Total emissions for a 1-month period.');
INSERT INTO public.reporting_period_code VALUES ('O3D', 'Ozone Season Day', 'an average day''s emissions for a typical ozone season work weekday');
INSERT INTO public.reporting_period_code VALUES ('OCT', 'October', 'Total emissions for a 1-month period.');
INSERT INTO public.reporting_period_code VALUES ('SEP', 'September', 'Total emissions for a 1-month period.');
INSERT INTO public.reporting_period_code VALUES ('W', 'Winter', 'The total emissions for the Dec 1 thru Feb 28 CO season.');
INSERT INTO public.reporting_period_code VALUES ('ASD', 'Average Season Day', 'For 24-hour PM2.5 State Implementation Plans, the sum of all emissions during the applicable season divided by the number of days in that season.');


-- Completed on 2024-02-12 15:00:26

--
-- PostgreSQL database dump complete
--

