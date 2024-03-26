--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7
-- Dumped by pg_dump version 14.1

-- Started on 2024-02-06 16:41:13

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
-- TOC entry 4499 (class 0 OID 16603)
-- Dependencies: 254
-- Data for Name: facility_category_code; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.facility_category_code VALUES ('HAP', 'HAP Major', 'Facility is Major based upon only 40 CFR 70 Major Source definition paragraph 1 (10/25 tpy HAPs).');
INSERT INTO public.facility_category_code VALUES ('CAP', 'CAP Major', 'Facility is Major based upon 40 CFR 70 Major Source definition paragraph 2 (100 tpy any CAP.  Also meets paragraph 3 definition, but NOT paragraph 1 definition).');
INSERT INTO public.facility_category_code VALUES ('OZN', 'O3 n/a Major', 'Facility is Major based upon only 40 CFR 70 Major Source definition paragraph 3 (Ozone n/a area lesser tons for NOx or VOC).');
INSERT INTO public.facility_category_code VALUES ('HAPCAP', 'HAP and CAP Major', 'Facility meets both paragraph 1 and 2 of 40 CFR 70 Major Source definitions (10/25 tpy HAPs and 100 tpy any CAP).');
INSERT INTO public.facility_category_code VALUES ('HAPOZN', 'HAP and O3 n/a Major', 'Facility meets both paragraph 1 and 3 of 40 CFR 70 Major Source definitions (10/25 tpy HAPs and Ozone n/a area lesser tons for NOx or VOC).');
INSERT INTO public.facility_category_code VALUES ('SYN', 'Synthetic non-Major', 'Facility has a FESOP which limits its Potential To Emit below all three 40 CFR 70 Major Source definitions.');
INSERT INTO public.facility_category_code VALUES ('NON', 'Non-Major', 'Facility''s Potential To Emit is below all 40 CFR 70 Major Source threshold definitions without a FESOP.');
INSERT INTO public.facility_category_code VALUES ('UNK', 'Unknown', 'Facility category per 40 CFR 70 Major Source definitions is unknown.');


-- Completed on 2024-02-06 16:41:17

--
-- PostgreSQL database dump complete
--

