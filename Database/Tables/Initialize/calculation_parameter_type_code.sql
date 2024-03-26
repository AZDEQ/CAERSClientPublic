--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7
-- Dumped by pg_dump version 14.1

-- Started on 2024-02-06 13:43:29

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
-- TOC entry 4499 (class 0 OID 16458)
-- Dependencies: 216
-- Data for Name: calculation_parameter_type_code; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.calculation_parameter_type_code VALUES ('E', 'Existing');
INSERT INTO public.calculation_parameter_type_code VALUES ('I', 'Input');
INSERT INTO public.calculation_parameter_type_code VALUES ('O', 'Output');


-- Completed on 2024-02-06 13:43:33

--
-- PostgreSQL database dump complete
--

