--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7
-- Dumped by pg_dump version 14.1

-- Started on 2024-02-06 16:26:21

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
-- TOC entry 4502 (class 0 OID 16597)
-- Dependencies: 252
-- Data for Name: energy_conversion_factor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.energy_conversion_factor VALUES (1, '640', 'E6BTU', 'E3TON', 25300.0000, 'AP-42, Appendix A', NULL);
INSERT INTO public.energy_conversion_factor VALUES (2, '639', 'E6BTU', 'TON', 15.0000, 'https://www.eia.gov/totalenergy/data/monthly/pdf/sec13.pdf', NULL);
INSERT INTO public.energy_conversion_factor VALUES (3, '663', 'E6BTU', 'E3TON', 26000.0000, 'AP-42, Appendix A', NULL);
INSERT INTO public.energy_conversion_factor VALUES (4, '675', 'BTU', 'GAL', 97400.0000, 'AP-42, Appendix A', NULL);
INSERT INTO public.energy_conversion_factor VALUES (5, '717', 'E6BTU', 'TON', 19.2920, 'https://www.eia.gov/totalenergy/data/monthly/pdf/sec12_6.pdf', NULL);
INSERT INTO public.energy_conversion_factor VALUES (6, '724', 'E6BTU', 'TON', 24.8000, 'https://www.eia.gov/totalenergy/data/monthly/pdf/sec12_6.pdf', NULL);
INSERT INTO public.energy_conversion_factor VALUES (7, '56', 'E6BTU', 'E3BBL', 5900.0000, 'AP-42, Appendix A', NULL);
INSERT INTO public.energy_conversion_factor VALUES (8, '127', 'BTU', 'GAL', 120285.7140, 'DOE EIA: https://www.eia.gov/energyexplained/units-and-calculators/energy-conversion-calculators.php', NULL);
INSERT INTO public.energy_conversion_factor VALUES (9, '173', 'E6BTU', 'TON', 16.0000, 'AP-42, Appendix A', NULL);
INSERT INTO public.energy_conversion_factor VALUES (10, '178', 'E6BTU', 'E3BBL', 4090.0000, 'AP-42, Appendix A', NULL);
INSERT INTO public.energy_conversion_factor VALUES (11, '209', 'E6BTU', 'E6FT3S', 1050.0000, 'AP-42, Appendix A', NULL);
INSERT INTO public.energy_conversion_factor VALUES (12, '255', 'BTU', 'GAL', 90500.0000, 'AP-42, Appendix A', NULL);
INSERT INTO public.energy_conversion_factor VALUES (13, '922', 'E6BTU', 'E3BBL', 6300.0000, 'AP-42, Appendix A', NULL);
INSERT INTO public.energy_conversion_factor VALUES (14, '374', 'E6BTU', 'GAL', 239.3160, 'DOE EIA: https://www.eia.gov/energyexplained/units-and-calculators/energy-conversion-calculators.php', NULL);
INSERT INTO public.energy_conversion_factor VALUES (15, '828', 'BTU', 'KW-HR', 3412.0000, 'DOE EIA: https://www.eia.gov/energyexplained/units-and-calculators/energy-conversion-calculators.php', NULL);
INSERT INTO public.energy_conversion_factor VALUES (16, '374', 'GAL', 'BBL', 42.0000, NULL, NULL);
INSERT INTO public.energy_conversion_factor VALUES (17, '15', 'E6BTU', 'TON', 10.4000, 'AP-42, Appendix A', NULL);


--
-- TOC entry 4509 (class 0 OID 0)
-- Dependencies: 253
-- Name: energy_conversion_factor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.energy_conversion_factor_id_seq', 1, false);


-- Completed on 2024-02-06 16:26:26

--
-- PostgreSQL database dump complete
--

