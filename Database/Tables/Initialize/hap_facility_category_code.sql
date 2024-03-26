--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7
-- Dumped by pg_dump version 14.1

-- Started on 2024-02-12 12:59:14

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
-- TOC entry 4499 (class 0 OID 16642)
-- Dependencies: 265
-- Data for Name: hap_facility_category_code; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.hap_facility_category_code VALUES ('HAP', 'Major');
INSERT INTO public.hap_facility_category_code VALUES ('SYN', 'Synthetic Minor');
INSERT INTO public.hap_facility_category_code VALUES ('AREA', 'Area');


-- Completed on 2024-02-12 12:59:19

--
-- PostgreSQL database dump complete
--

