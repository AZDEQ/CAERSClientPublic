--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7
-- Dumped by pg_dump version 14.1

-- Started on 2024-02-12 15:17:34

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
-- TOC entry 4499 (class 0 OID 16770)
-- Dependencies: 298
-- Data for Name: unit_type_code; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.unit_type_code VALUES ('100', 'Boiler');
INSERT INTO public.unit_type_code VALUES ('120', 'Turbine');
INSERT INTO public.unit_type_code VALUES ('140', 'Combined Cycle (Boiler/Gas Turbine)');
INSERT INTO public.unit_type_code VALUES ('150', 'Duct Burner');
INSERT INTO public.unit_type_code VALUES ('160', 'Reciprocating IC Engine');
INSERT INTO public.unit_type_code VALUES ('170', 'Engine Test Cell');
INSERT INTO public.unit_type_code VALUES ('180', 'Process Heater');
INSERT INTO public.unit_type_code VALUES ('200', 'Furnace');
INSERT INTO public.unit_type_code VALUES ('210', 'Kiln');
INSERT INTO public.unit_type_code VALUES ('220', 'Calciner');
INSERT INTO public.unit_type_code VALUES ('250', 'Direct-fired Dryer');
INSERT INTO public.unit_type_code VALUES ('255', 'Dryer, unknown if direct or indirect.');
INSERT INTO public.unit_type_code VALUES ('260', 'Indirect-fired Dryer');
INSERT INTO public.unit_type_code VALUES ('270', 'Incinerator');
INSERT INTO public.unit_type_code VALUES ('280', 'Flare');
INSERT INTO public.unit_type_code VALUES ('285', 'Open Burning');
INSERT INTO public.unit_type_code VALUES ('290', 'Other combustion');
INSERT INTO public.unit_type_code VALUES ('300', 'Open Air Fugitive Source');
INSERT INTO public.unit_type_code VALUES ('310', 'Roof vents/Building vents');
INSERT INTO public.unit_type_code VALUES ('350', 'Process Equipment Fugitive Leaks');
INSERT INTO public.unit_type_code VALUES ('360', 'Process Equipment and Process Area Drains');
INSERT INTO public.unit_type_code VALUES ('390', 'Other fugitive');
INSERT INTO public.unit_type_code VALUES ('400', 'Storage Tank');
INSERT INTO public.unit_type_code VALUES ('410', 'Open Tank or Vat');
INSERT INTO public.unit_type_code VALUES ('430', 'Degreaser');
INSERT INTO public.unit_type_code VALUES ('450', 'Spray Booth or Coating Line');
INSERT INTO public.unit_type_code VALUES ('470', 'Printing Line');
INSERT INTO public.unit_type_code VALUES ('480', 'Gasoline Loading Rack or Arm');
INSERT INTO public.unit_type_code VALUES ('490', 'Other evaporative sources');
INSERT INTO public.unit_type_code VALUES ('600', 'Chemical Reactor');
INSERT INTO public.unit_type_code VALUES ('610', 'Oxidation Unit');
INSERT INTO public.unit_type_code VALUES ('620', 'Distillation Column/Stripper');
INSERT INTO public.unit_type_code VALUES ('640', 'Mixer or Blender');
INSERT INTO public.unit_type_code VALUES ('680', 'Cooling Tower');
INSERT INTO public.unit_type_code VALUES ('690', 'Other process equipment');
INSERT INTO public.unit_type_code VALUES ('720', 'Crusher');
INSERT INTO public.unit_type_code VALUES ('730', 'Grinder');
INSERT INTO public.unit_type_code VALUES ('740', 'Screen');
INSERT INTO public.unit_type_code VALUES ('760', 'Conveyor');
INSERT INTO public.unit_type_code VALUES ('770', 'Transfer Point');
INSERT INTO public.unit_type_code VALUES ('780', 'Silo');
INSERT INTO public.unit_type_code VALUES ('785', 'Open Storage Pile');
INSERT INTO public.unit_type_code VALUES ('790', 'Other bulk material equipment');
INSERT INTO public.unit_type_code VALUES ('999', 'Unclassified');
INSERT INTO public.unit_type_code VALUES ('202', 'Regenerative Furnace');
INSERT INTO public.unit_type_code VALUES ('203', 'Recuperative Furnace');
INSERT INTO public.unit_type_code VALUES ('204', 'Electric Furnace');
INSERT INTO public.unit_type_code VALUES ('205', 'Unit Melter Furnace');
INSERT INTO public.unit_type_code VALUES ('206', 'Air Gas Furnace');
INSERT INTO public.unit_type_code VALUES ('207', 'Oxyfuel Furnace');
INSERT INTO public.unit_type_code VALUES ('208', 'Cold top Furnace');
INSERT INTO public.unit_type_code VALUES ('209', 'Pot/Marble Melt Furnace');
INSERT INTO public.unit_type_code VALUES ('1200', 'Electric Steel Shell Furnace');
INSERT INTO public.unit_type_code VALUES ('1201', 'Recovery Furnace - Direct Contact Evaporator');
INSERT INTO public.unit_type_code VALUES ('1202', 'Recovery Furnace - Nondirect Contact Evaporator');
INSERT INTO public.unit_type_code VALUES ('211', 'Lumber Dry Kiln');
INSERT INTO public.unit_type_code VALUES ('212', 'Rotary Kiln');
INSERT INTO public.unit_type_code VALUES ('213', 'Wet Kiln');
INSERT INTO public.unit_type_code VALUES ('214', 'Dry Kiln');
INSERT INTO public.unit_type_code VALUES ('215', 'Lime Kiln');
INSERT INTO public.unit_type_code VALUES ('251', 'Softwood Veneer Dryer');
INSERT INTO public.unit_type_code VALUES ('252', 'Veneer Redryer');
INSERT INTO public.unit_type_code VALUES ('253', 'Hardwood Veneer Dryer');
INSERT INTO public.unit_type_code VALUES ('254', 'Rotary Strand Dryer');
INSERT INTO public.unit_type_code VALUES ('1251', 'Conveyor Stand Dryer');
INSERT INTO public.unit_type_code VALUES ('1252', 'Primary Tube Dryer');
INSERT INTO public.unit_type_code VALUES ('1253', 'Secondary Tube Dryer');
INSERT INTO public.unit_type_code VALUES ('1254', 'Rotary Yeast Dryer');
INSERT INTO public.unit_type_code VALUES ('2251', 'Hogged Fuel Dryer');
INSERT INTO public.unit_type_code VALUES ('261', 'Green Rotary Dryer');
INSERT INTO public.unit_type_code VALUES ('262', 'Dry Rotary Dryer');
INSERT INTO public.unit_type_code VALUES ('263', 'Rotary Agricultural Fiber Dryer');
INSERT INTO public.unit_type_code VALUES ('264', 'Hardboard Press Predryer');
INSERT INTO public.unit_type_code VALUES ('265', 'Fiberboard Mat Dryer');
INSERT INTO public.unit_type_code VALUES ('271', 'Vapor Incinerator');
INSERT INTO public.unit_type_code VALUES ('281', 'Sludge Digester Gas Flare');
INSERT INTO public.unit_type_code VALUES ('291', 'Hardboard Oven');
INSERT INTO public.unit_type_code VALUES ('292', 'Curing Oven');
INSERT INTO public.unit_type_code VALUES ('293', 'Chemical Recovery Combustion Unit');
INSERT INTO public.unit_type_code VALUES ('361', 'Primary Clarifier');
INSERT INTO public.unit_type_code VALUES ('362', 'Diffused Air Activated Sludge Thickener');
INSERT INTO public.unit_type_code VALUES ('363', 'Mechanical Mix Air Activated Sludge');
INSERT INTO public.unit_type_code VALUES ('364', 'Pure Oxygen Activated Sludge');
INSERT INTO public.unit_type_code VALUES ('365', 'Trickling Filter');
INSERT INTO public.unit_type_code VALUES ('366', 'Secondary Clarifier');
INSERT INTO public.unit_type_code VALUES ('367', 'Tertiary Filters');
INSERT INTO public.unit_type_code VALUES ('369', 'Gravity Sludge Thickener');
INSERT INTO public.unit_type_code VALUES ('370', 'DAF Sludge Thickener');
INSERT INTO public.unit_type_code VALUES ('371', 'Anaerobic Digester');
INSERT INTO public.unit_type_code VALUES ('372', 'Belt Filter Press');
INSERT INTO public.unit_type_code VALUES ('373', 'Oil-Water Separator');
INSERT INTO public.unit_type_code VALUES ('374', 'Organic-Water Separator');
INSERT INTO public.unit_type_code VALUES ('375', 'Primary Condenser');
INSERT INTO public.unit_type_code VALUES ('376', 'Process Vent');
INSERT INTO public.unit_type_code VALUES ('378', 'Separator, Other than oil-water or organic-water');
INSERT INTO public.unit_type_code VALUES ('379', 'Batch Digester');
INSERT INTO public.unit_type_code VALUES ('380', 'Continuous Digester');
INSERT INTO public.unit_type_code VALUES ('381', 'White Liquor Clarifier');
INSERT INTO public.unit_type_code VALUES ('382', 'Green Liquor Clarifier');
INSERT INTO public.unit_type_code VALUES ('383', 'Fractionation Unit');
INSERT INTO public.unit_type_code VALUES ('391', 'Manhole');
INSERT INTO public.unit_type_code VALUES ('392', 'Individual Drain System');
INSERT INTO public.unit_type_code VALUES ('401', 'Primary Settling Tank');
INSERT INTO public.unit_type_code VALUES ('402', 'Secondary Settling Tank');
INSERT INTO public.unit_type_code VALUES ('403', 'Fermenter');
INSERT INTO public.unit_type_code VALUES ('404', 'Trade Fermenter');
INSERT INTO public.unit_type_code VALUES ('405', 'Stock Fermenter');
INSERT INTO public.unit_type_code VALUES ('406', 'Pure Culture Fermenter');
INSERT INTO public.unit_type_code VALUES ('407', 'Bottoms Receiver Vessel');
INSERT INTO public.unit_type_code VALUES ('408', 'Liquid Waste Container');
INSERT INTO public.unit_type_code VALUES ('409', 'Distillate Receiver Vessel');
INSERT INTO public.unit_type_code VALUES ('1401', 'Surge Control Tank');
INSERT INTO public.unit_type_code VALUES ('1402', 'Storage bin');
INSERT INTO public.unit_type_code VALUES ('1403', 'Pulp Storage');
INSERT INTO public.unit_type_code VALUES ('1404', 'Black Liquor Storage');
INSERT INTO public.unit_type_code VALUES ('1405', 'White Liquor Storage');
INSERT INTO public.unit_type_code VALUES ('1406', 'Bleach Storage');
INSERT INTO public.unit_type_code VALUES ('1407', 'Methanol Storage');
INSERT INTO public.unit_type_code VALUES ('411', 'Log Vat');
INSERT INTO public.unit_type_code VALUES ('412', 'Aeration Basin');
INSERT INTO public.unit_type_code VALUES ('413', 'Equalization Basin');
INSERT INTO public.unit_type_code VALUES ('414', 'Chlorine Contact Basin');
INSERT INTO public.unit_type_code VALUES ('415', 'Sludge Drying Bed');
INSERT INTO public.unit_type_code VALUES ('416', 'Sludge Storage Lagoons/Drying Beds');
INSERT INTO public.unit_type_code VALUES ('417', 'Aerated Grit Chamber');
INSERT INTO public.unit_type_code VALUES ('418', 'Hot Well');
INSERT INTO public.unit_type_code VALUES ('419', 'Flotation Cell');
INSERT INTO public.unit_type_code VALUES ('420', 'Dechlorination Basin');
INSERT INTO public.unit_type_code VALUES ('451', 'Miscellaneous Coating Operation');
INSERT INTO public.unit_type_code VALUES ('492', 'Settling Pit');
INSERT INTO public.unit_type_code VALUES ('494', 'Surface Impoundment');
INSERT INTO public.unit_type_code VALUES ('611', 'Black Liquor Oxidation System');
INSERT INTO public.unit_type_code VALUES ('621', 'Condensate Stripper');
INSERT INTO public.unit_type_code VALUES ('622', 'Steam Stripper');
INSERT INTO public.unit_type_code VALUES ('623', 'Gas Stripper');
INSERT INTO public.unit_type_code VALUES ('641', 'Blend Chest');
INSERT INTO public.unit_type_code VALUES ('681', 'Cooling Process Equipment');
INSERT INTO public.unit_type_code VALUES ('691', 'Reconstituted Wood Product Press');
INSERT INTO public.unit_type_code VALUES ('692', 'Reconstituted Wood Product Board Cooler');
INSERT INTO public.unit_type_code VALUES ('693', 'Hardboard Humidifier');
INSERT INTO public.unit_type_code VALUES ('694', 'Stand Alone Digester');
INSERT INTO public.unit_type_code VALUES ('695', 'Softwood Plywood Press');
INSERT INTO public.unit_type_code VALUES ('696', 'Hardwood Plywood Press');
INSERT INTO public.unit_type_code VALUES ('697', 'Engineered Wood Products Press');
INSERT INTO public.unit_type_code VALUES ('698', 'Agricultural Fiber Board Press');
INSERT INTO public.unit_type_code VALUES ('699', 'Fiber Washer');
INSERT INTO public.unit_type_code VALUES ('700', 'Atmospheric Refiner');
INSERT INTO public.unit_type_code VALUES ('701', 'Sludge Centrifuge');
INSERT INTO public.unit_type_code VALUES ('702', 'Effluent Weir');
INSERT INTO public.unit_type_code VALUES ('703', 'Non-TSDF Treatment, Storage, Disposal System');
INSERT INTO public.unit_type_code VALUES ('705', 'Pressure Relief Device, not a valve');
INSERT INTO public.unit_type_code VALUES ('706', 'Pressure Relief Valve');
INSERT INTO public.unit_type_code VALUES ('712', 'Finish Mill');
INSERT INTO public.unit_type_code VALUES ('713', 'Fiber Forming Equipment');
INSERT INTO public.unit_type_code VALUES ('714', 'O2 Delignification');
INSERT INTO public.unit_type_code VALUES ('715', 'ClO2 Generator');
INSERT INTO public.unit_type_code VALUES ('716', 'Ozone Reactor');
INSERT INTO public.unit_type_code VALUES ('717', 'Bleaching and Extraction Tower');
INSERT INTO public.unit_type_code VALUES ('718', 'Evaporator');
INSERT INTO public.unit_type_code VALUES ('719', 'Smelt Dissolving Tank');
INSERT INTO public.unit_type_code VALUES ('1690', 'Salt Cake Tank');
INSERT INTO public.unit_type_code VALUES ('1691', 'Dregs Washer');
INSERT INTO public.unit_type_code VALUES ('1692', 'Lime Mud Washer');
INSERT INTO public.unit_type_code VALUES ('1693', 'Slaker');
INSERT INTO public.unit_type_code VALUES ('1694', 'Paper Machine');
INSERT INTO public.unit_type_code VALUES ('1695', 'Conical Refiner');
INSERT INTO public.unit_type_code VALUES ('1696', 'Machine Chest');
INSERT INTO public.unit_type_code VALUES ('1697', 'Repulper');
INSERT INTO public.unit_type_code VALUES ('1698', 'Mechanical Pulping Refiner (RMP)');
INSERT INTO public.unit_type_code VALUES ('1699', 'Brown Stock Refiner');
INSERT INTO public.unit_type_code VALUES ('1700', 'White Stock Refiner');
INSERT INTO public.unit_type_code VALUES ('1701', 'Solvent Extraction Unit');
INSERT INTO public.unit_type_code VALUES ('1702', 'Thin Film Evaporator');
INSERT INTO public.unit_type_code VALUES ('1703', 'Pressurized Refiner');
INSERT INTO public.unit_type_code VALUES ('721', 'Primary Crusher');
INSERT INTO public.unit_type_code VALUES ('722', 'Secondary Crusher');
INSERT INTO public.unit_type_code VALUES ('1731', 'Chipper/Flaker/Hammermill');
INSERT INTO public.unit_type_code VALUES ('1732', 'Cumminutor/Grinder');
INSERT INTO public.unit_type_code VALUES ('1733', 'Raw Material Grinder');
INSERT INTO public.unit_type_code VALUES ('1734', 'Clinker Grinder');
INSERT INTO public.unit_type_code VALUES ('1741', 'Headworks Screen');
INSERT INTO public.unit_type_code VALUES ('1742', 'Chip Screen');
INSERT INTO public.unit_type_code VALUES ('1743', 'Pulp Screen');
INSERT INTO public.unit_type_code VALUES ('1744', 'Stock Screen');
INSERT INTO public.unit_type_code VALUES ('761', 'Chip Conveyer');
INSERT INTO public.unit_type_code VALUES ('762', 'Coal Conveyer');
INSERT INTO public.unit_type_code VALUES ('1771', 'Waste Water Junction Box');
INSERT INTO public.unit_type_code VALUES ('1772', 'Collector Sewers');
INSERT INTO public.unit_type_code VALUES ('1773', 'Waste Water Lift Station');
INSERT INTO public.unit_type_code VALUES ('1775', 'Transfer System');
INSERT INTO public.unit_type_code VALUES ('1776', 'Weigh Hopper');
INSERT INTO public.unit_type_code VALUES ('786', 'Chip Pile');
INSERT INTO public.unit_type_code VALUES ('792', 'Former');
INSERT INTO public.unit_type_code VALUES ('793', 'Sander');
INSERT INTO public.unit_type_code VALUES ('794', 'Saw');
INSERT INTO public.unit_type_code VALUES ('796', 'Debarking Drum');
INSERT INTO public.unit_type_code VALUES ('797', 'Knotter');
INSERT INTO public.unit_type_code VALUES ('798', 'Decker');
INSERT INTO public.unit_type_code VALUES ('801', 'Wastewater Treatment Unit');
INSERT INTO public.unit_type_code VALUES ('805', 'Waste Stabilization Equipment');
INSERT INTO public.unit_type_code VALUES ('810', 'Wastewater Handling Equipment');
INSERT INTO public.unit_type_code VALUES ('230', 'Coke Battery');


-- Completed on 2024-02-12 15:17:38

--
-- PostgreSQL database dump complete
--

