--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7
-- Dumped by pg_dump version 14.1

-- Started on 2024-02-12 14:57:25

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
-- TOC entry 4499 (class 0 OID 16720)
-- Dependencies: 285
-- Data for Name: release_point_type_code; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.release_point_type_code VALUES ('2', 'Vertical  ', NULL, 'Stack');
INSERT INTO public.release_point_type_code VALUES ('3', 'Horizontal', NULL, 'Stack');
INSERT INTO public.release_point_type_code VALUES ('4', 'Goose Neck', NULL, 'Stack');
INSERT INTO public.release_point_type_code VALUES ('5', 'Vertical with Rain Cap', NULL, 'Stack');
INSERT INTO public.release_point_type_code VALUES ('6', 'Downward-facing Vent', NULL, 'Stack');
INSERT INTO public.release_point_type_code VALUES ('99', 'Unknown', 2002, 'Stack');
INSERT INTO public.release_point_type_code VALUES ('1', 'Fugitive Area: SW Corner Coords', NULL, 'Fugitive');
INSERT INTO public.release_point_type_code VALUES ('8', 'Low Flow Vent', NULL, 'Stack');
INSERT INTO public.release_point_type_code VALUES ('7', 'Fugitive 3-D: Center of Release Footprint Coords', NULL, 'Fugitive');
INSERT INTO public.release_point_type_code VALUES ('9', 'Fugitive 2-D: Two Midpoint Coord Pairs', NULL, 'Fugitive');


-- Completed on 2024-02-12 14:57:29

--
-- PostgreSQL database dump complete
--

