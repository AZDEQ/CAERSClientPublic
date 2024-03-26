--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7
-- Dumped by pg_dump version 14.1

-- Started on 2024-02-06 16:44:45

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
-- TOC entry 4499 (class 0 OID 16630)
-- Dependencies: 261
-- Data for Name: facility_source_type_code; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.facility_source_type_code VALUES ('999', 'Ship Yards', NULL);
INSERT INTO public.facility_source_type_code VALUES ('100', 'Airport', NULL);
INSERT INTO public.facility_source_type_code VALUES ('101', 'Marine Port', NULL);
INSERT INTO public.facility_source_type_code VALUES ('102', 'Military Base', NULL);
INSERT INTO public.facility_source_type_code VALUES ('103', 'Municipal Waste Combustor', NULL);
INSERT INTO public.facility_source_type_code VALUES ('104', 'Landfill', NULL);
INSERT INTO public.facility_source_type_code VALUES ('105', 'Wastewater Treatment Facility', NULL);
INSERT INTO public.facility_source_type_code VALUES ('106', 'Oil or Gas Facility (On-shore)', NULL);
INSERT INTO public.facility_source_type_code VALUES ('107', 'Tank Battery', NULL);
INSERT INTO public.facility_source_type_code VALUES ('108', 'Gas Plant', NULL);
INSERT INTO public.facility_source_type_code VALUES ('109', 'Off-shore Oil or Gas Platform', NULL);
INSERT INTO public.facility_source_type_code VALUES ('110', 'Compressor Station', NULL);
INSERT INTO public.facility_source_type_code VALUES ('112', 'Mines/Quarries', NULL);
INSERT INTO public.facility_source_type_code VALUES ('113', 'Gravel/Sand Plant', NULL);
INSERT INTO public.facility_source_type_code VALUES ('114', 'Gasoline/Diesel Service Station', NULL);
INSERT INTO public.facility_source_type_code VALUES ('115', 'Dry Cleaner - Petroleum Solvent', NULL);
INSERT INTO public.facility_source_type_code VALUES ('116', 'Dry Cleaner - Perchloroethylene', NULL);
INSERT INTO public.facility_source_type_code VALUES ('117', 'Auto Body, Painting, or Repair Shop', NULL);
INSERT INTO public.facility_source_type_code VALUES ('118', 'Animal Feedlot or Farm', NULL);
INSERT INTO public.facility_source_type_code VALUES ('119', 'Crematory - Human', NULL);
INSERT INTO public.facility_source_type_code VALUES ('120', 'Crematory - Animal', NULL);
INSERT INTO public.facility_source_type_code VALUES ('121', 'Hot Mix Asphalt Plant', NULL);
INSERT INTO public.facility_source_type_code VALUES ('123', 'Concrete Batch Plant', NULL);
INSERT INTO public.facility_source_type_code VALUES ('124', 'Portland Cement Manufacturing', NULL);
INSERT INTO public.facility_source_type_code VALUES ('125', 'Electricity Generation via Combustion', NULL);
INSERT INTO public.facility_source_type_code VALUES ('126', 'Petroleum Refinery', NULL);
INSERT INTO public.facility_source_type_code VALUES ('127', 'Ethanol Biorefineries/Soy Biodiesel', NULL);
INSERT INTO public.facility_source_type_code VALUES ('129', 'Chemical Plant', NULL);
INSERT INTO public.facility_source_type_code VALUES ('130', 'Pharmaceutical Manufacturing', NULL);
INSERT INTO public.facility_source_type_code VALUES ('131', 'Petroleum Storage Facility', NULL);
INSERT INTO public.facility_source_type_code VALUES ('132', 'Brick, Structural Clay, or Clay Ceramics Plant', NULL);
INSERT INTO public.facility_source_type_code VALUES ('133', 'Pulp and Paper Plant', NULL);
INSERT INTO public.facility_source_type_code VALUES ('134', 'Plywood & Engineered Wood Products', NULL);
INSERT INTO public.facility_source_type_code VALUES ('135', 'Lumber/Sawmill', NULL);
INSERT INTO public.facility_source_type_code VALUES ('136', 'Woodwork, Furniture, Millwork Manufacturing', NULL);
INSERT INTO public.facility_source_type_code VALUES ('137', 'Automobile/Truck or Parts Plant', NULL);
INSERT INTO public.facility_source_type_code VALUES ('138', 'Steel Mill', NULL);
INSERT INTO public.facility_source_type_code VALUES ('139', 'Foundries, Iron and Steel', NULL);
INSERT INTO public.facility_source_type_code VALUES ('140', 'Primary Aluminum Plant', NULL);
INSERT INTO public.facility_source_type_code VALUES ('142', 'Breweries/Distilleries/Wineries', NULL);
INSERT INTO public.facility_source_type_code VALUES ('143', 'Bakeries', NULL);
INSERT INTO public.facility_source_type_code VALUES ('144', 'Printing/Publishing Facility', NULL);
INSERT INTO public.facility_source_type_code VALUES ('145', 'Textile, Yarn, or Carpet Plant', NULL);
INSERT INTO public.facility_source_type_code VALUES ('146', 'Grain Handling Facility', NULL);
INSERT INTO public.facility_source_type_code VALUES ('147', 'Food Products Processing Plant', NULL);
INSERT INTO public.facility_source_type_code VALUES ('148', 'Institutional (school, hospital, prison, etc.)', NULL);
INSERT INTO public.facility_source_type_code VALUES ('149', 'Coke Battery', NULL);
INSERT INTO public.facility_source_type_code VALUES ('153', 'Taconite Processing', NULL);
INSERT INTO public.facility_source_type_code VALUES ('154', 'Sugar Mill', NULL);
INSERT INTO public.facility_source_type_code VALUES ('158', 'Fertilizer Plant', NULL);
INSERT INTO public.facility_source_type_code VALUES ('156', 'Carbon Black Plant', NULL);
INSERT INTO public.facility_source_type_code VALUES ('157', 'Calcined Pet Coke Plant', NULL);
INSERT INTO public.facility_source_type_code VALUES ('150', 'Gold Mine or Processing Facility', NULL);
INSERT INTO public.facility_source_type_code VALUES ('151', 'Rail Yard', NULL);
INSERT INTO public.facility_source_type_code VALUES ('152', 'Foundries, non-ferrous', NULL);
INSERT INTO public.facility_source_type_code VALUES ('159', 'Wet Corn Mill', NULL);
INSERT INTO public.facility_source_type_code VALUES ('160', 'Aircraft, Aerospace, or Related Parts Plant', NULL);
INSERT INTO public.facility_source_type_code VALUES ('161', 'Battery Plant', NULL);
INSERT INTO public.facility_source_type_code VALUES ('162', 'Carbon or Graphite Plant', NULL);
INSERT INTO public.facility_source_type_code VALUES ('163', 'Concrete Block, Pipe or Other Manuf', NULL);
INSERT INTO public.facility_source_type_code VALUES ('164', 'Chlor-alkali Plant', NULL);
INSERT INTO public.facility_source_type_code VALUES ('165', 'Cotton Gin', NULL);
INSERT INTO public.facility_source_type_code VALUES ('166', 'Fabricated Metal Products Plant', NULL);
INSERT INTO public.facility_source_type_code VALUES ('167', 'Ferroalloy Plant', NULL);
INSERT INTO public.facility_source_type_code VALUES ('168', 'Glass Plant', NULL);
INSERT INTO public.facility_source_type_code VALUES ('169', 'Industrial Machinery or Equipment Plant', NULL);
INSERT INTO public.facility_source_type_code VALUES ('170', 'Mineral Processing Plant', NULL);
INSERT INTO public.facility_source_type_code VALUES ('171', 'Mineral Wool Plant', NULL);
INSERT INTO public.facility_source_type_code VALUES ('172', 'Munition or Explosives Plant', NULL);
INSERT INTO public.facility_source_type_code VALUES ('173', 'Plastic, Resin, Rubber or Syn Fiber Manuf Plant', NULL);
INSERT INTO public.facility_source_type_code VALUES ('174', 'Alumina Refinery', NULL);
INSERT INTO public.facility_source_type_code VALUES ('175', 'Primary Copper Smelting/Refining Plant', NULL);
INSERT INTO public.facility_source_type_code VALUES ('176', 'Primary Lead Smelting Plant', NULL);
INSERT INTO public.facility_source_type_code VALUES ('177', 'Primary Non-ferrous Metal Smelting/Refining Plant (not Lead, Gold, Aluminum, or Copper)', NULL);
INSERT INTO public.facility_source_type_code VALUES ('178', 'Secondary Aluminum Smelting/Refining Plant', NULL);
INSERT INTO public.facility_source_type_code VALUES ('179', 'Secondary Copper Smelting/Refining Plant', NULL);
INSERT INTO public.facility_source_type_code VALUES ('180', 'Secondary Lead Smelting Plant', NULL);
INSERT INTO public.facility_source_type_code VALUES ('181', 'Secondary Non-ferrous Metal Smelting/Refining Plant (not Lead, Aluminum, or Copper)', NULL);
INSERT INTO public.facility_source_type_code VALUES ('182', 'Fiberglass Products Manuf', NULL);
INSERT INTO public.facility_source_type_code VALUES ('183', 'Steam/Heating Facility', NULL);
INSERT INTO public.facility_source_type_code VALUES ('184', 'Coal Gasification Plant', NULL);
INSERT INTO public.facility_source_type_code VALUES ('185', 'Electricity Generation Geothermal', NULL);
INSERT INTO public.facility_source_type_code VALUES ('128', 'Soy Biofuel Plant', 1990);
INSERT INTO public.facility_source_type_code VALUES ('141', 'Secondary Metal Processing', 2010);
INSERT INTO public.facility_source_type_code VALUES ('155', 'Primary Metal Smelting/Refining', 2010);


-- Completed on 2024-02-06 16:44:49

--
-- PostgreSQL database dump complete
--

