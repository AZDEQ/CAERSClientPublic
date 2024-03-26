--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7
-- Dumped by pg_dump version 14.1

-- Started on 2024-02-12 13:14:56

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
-- TOC entry 4499 (class 0 OID 16685)
-- Dependencies: 276
-- Data for Name: operating_status_code; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.operating_status_code VALUES ('I', 'Seasonal', false, false);
INSERT INTO public.operating_status_code VALUES ('OP', 'Operating', true, true);
INSERT INTO public.operating_status_code VALUES ('PS', 'Permanently Shutdown', true, true);
INSERT INTO public.operating_status_code VALUES ('TS', 'Temporarily Shutdown', true, true);
INSERT INTO public.operating_status_code VALUES ('ONRE', 'Operating but State/Local/Tribe Not Reporting Emissions', false, true);
INSERT INTO public.operating_status_code VALUES ('ONP', 'Operating but State/Local/Tribe Reporting Emissions in the Nonpoint Category', false, true);


-- Completed on 2024-02-12 13:15:01

--
-- PostgreSQL database dump complete
--

