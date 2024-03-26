--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7
-- Dumped by pg_dump version 14.1

-- Started on 2024-02-06 14:34:42

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
-- TOC entry 4499 (class 0 OID 16469)
-- Dependencies: 219
-- Data for Name: contact_type_code; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.contact_type_code VALUES ('RO', 'Responsible Official');
INSERT INTO public.contact_type_code VALUES ('TECH', 'Technical');
INSERT INTO public.contact_type_code VALUES ('FAC', 'Facility');
INSERT INTO public.contact_type_code VALUES ('PERM', 'Permit');
INSERT INTO public.contact_type_code VALUES ('COMP', 'Compliance');
INSERT INTO public.contact_type_code VALUES ('ASB', 'Asbestos');
INSERT INTO public.contact_type_code VALUES ('BI', 'Billing/Invoice');
INSERT INTO public.contact_type_code VALUES ('EI', 'Emissions Inventory');
INSERT INTO public.contact_type_code VALUES ('ENV', 'Environmental');
INSERT INTO public.contact_type_code VALUES ('MON', 'Monitoring');
INSERT INTO public.contact_type_code VALUES ('NSRB', 'NSR Billing');
INSERT INTO public.contact_type_code VALUES ('OSO', 'On Site Operator');
INSERT INTO public.contact_type_code VALUES ('NSRP', 'NSR Permitting');
INSERT INTO public.contact_type_code VALUES ('TVP', 'Title V Permission');


-- Completed on 2024-02-06 14:34:46

--
-- PostgreSQL database dump complete
--

