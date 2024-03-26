--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7
-- Dumped by pg_dump version 14.1

-- Started on 2024-02-06 14:37:24

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
-- TOC entry 4499 (class 0 OID 16488)
-- Dependencies: 224
-- Data for Name: control_measure_code; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.control_measure_code VALUES ('19', 'Catalytic Afterburner', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('20', 'Catalytic Afterburner with Heat Exchanger', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('21', 'Direct Flame Afterburner', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('22', 'Direct Flame Afterburner with Heat Exchanger', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('23', 'Flaring', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('25', 'Staged combustion', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('26', 'Flue Gas Recirculation', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('29', 'Low Excess Air Firing', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('31', 'Air Injection', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('35', 'Magnesium Oxide Scrubbing', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('36', 'Dual Alkali Scrubbing', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('38', 'Ammonia Scrubbing', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('41', 'Dry Limestone Injection', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('42', 'Wet Limestone Injection', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('45', 'Sulfur Plant', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('46', 'Process Change', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('48', 'Adsorption - Activated Carbon or other', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('49', 'Liquid Filtration System', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('50', 'Packed-Gas Absorption Column', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('51', 'Tray-Type Gas Absorption Column', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('52', 'Spray Tower', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('54', 'Process Enclosed', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('56', 'Dynamic Separator (Dry)', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('57', 'Dynamic Separator (wet)', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('58', 'Mat or Panel Filter', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('59', 'Metal Fabric Filter Screen (Cotton Gins)', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('60', 'Process Gas Recovery', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('63', 'Gravel Bed Filter', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('64', 'Annular Ring Filter', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('65', 'Catalytic Reduction', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('66', 'Molecular Sieve', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('67', 'Wet Lime Slurry Scrubbing', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('68', 'Alkaline Fly Ash Scrubbing', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('69', 'Sodium Carbonate Scrubbing', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('75', 'Cyclone / Centrifugal Collector', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('79', 'Dry Electrostatic Granular Filter (DEGF)', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('82', 'Ozonation', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('86', 'Water Curtain', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('87', 'Nitrogen Blanket', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('88', 'Conservation Vent', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('89', 'Bottom Filling', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('93', 'Submerged Filling', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('95', 'White Paint', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('96', 'Vapor Lock Balance Recovery System', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('97', 'Secondary Seal on Floating Roof Tank', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('101', 'High-Efficiency Particulate Air Filter (HEPA)', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('102', 'Low Solvent Coatings', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('103', 'Powder Coatings', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('104', 'Waterborne Coatings', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('109', 'Catalytic Oxidizer / Incinerator', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('110', 'Vapor Recovery Unit', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('112', 'Afterburner', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('113', 'Rotoclone', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('119', 'Dry Scrubber', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('121', 'Cyclones (Multiple)', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('127', 'Fabric Filter / Baghouse', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('128', 'Electrostatic Precipitator - Dry (DESP)', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('132', 'Condenser', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('139', 'Selective Catalytic Reduction (SCR)', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('140', 'Selective Non-catalytic Reduction (SNCR)', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('141', 'Wet Scrubber', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('146', 'Electrostatic Precipitator - Wet  (WESP)', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('147', 'Increased Air/Fuel Ratio with Intercooling', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('149', 'Pre-Combustion Chamber', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('154', 'Screened Drums or Cages', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('157', 'Screen', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('201', 'Knock Out Box', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('202', 'Spray Dryer Adsorber (SDA)', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('203', 'Catalytic Converter', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('204', 'Overfire Air', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('205', 'Low NOx Burner (LNB)', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('206', 'Dry Sorbent Injection (DSI, other than ACI)', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('207', 'Activated Carbon Injection (ACI)', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('208', 'Freeboard Refrigeration Device', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('209', 'Gravity Collector', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('211', 'Mist Eliminator', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('212', 'Steam Injection', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('213', 'Water Injection', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('214', 'Low Nitrogen Content Fuel', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('215', 'Flue Gas Desulfurization (FGD)', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('217', 'Dust Suppression', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('218', 'Electrostatic Spraying', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('133', 'Thermal Oxidizer / Incinerator', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('70', 'Sodium-Alkali Scrubbing', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('85', 'Wet Cyclonic Separator', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('99', 'Other Control Device', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('300', 'Devices Repeated in Series', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('301', 'Fuel reburning', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('302', 'Biofilter', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('303', 'Catalytic Additives', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('304', 'Enclosed Combustor', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('305', 'Diesel Particulate Filters (DPF)', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('306', 'Duct Sorbent Injection', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('307', 'Furnace Sorbent Injection', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('308', 'Wet Sorbent Injection', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('309', 'Leak Detection and Repair (LDAR) Program', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('310', 'Non-Selective Catalytic Reduction (NSCR)', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('311', 'Other Pollution Prevention Technique', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('312', 'Oxidation Catalyst', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('313', 'Spray booth and Filter', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('314', 'Spray booth and Overspray Arrestor', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('315', 'Spray guns - High Volume, Low Pressure (HVLP)', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('316', 'Ultra Low NOx Burners (ULNB)', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('317', 'Recuperative Thermal Oxidizer', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('318', 'Product Substitution', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('319', 'Regenerative Thermal Oxidizer', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('320', 'Combustion Device', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('321', 'Cover Vented to Control Device', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('322', 'External Floating Roof Tank', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('323', 'Fixed Roof Tank', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('324', 'Fixed Roof Tank vented to Control Device', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('325', 'Fixed Roof Tank with Internal Floating Roof', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('326', 'Floating Membrane Cover', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('327', 'Floating Roof', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('328', 'Internal Floating Roof', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('329', 'Multiple Controls in Series', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('330', 'Pressurized Tank', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('331', 'Process Modification', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('332', 'Vapor Balancing', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('333', 'Thermal Catalytic Oxidizer without heat recovery', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('334', 'Rotary Bed Protector', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('335', 'Process Incineration in onsite unit (100% of exhaust gas)', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('336', 'Process Incineration in onsite unit (<100% of exhaust gas)', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('337', 'Thermal Catalytic Oxidizer', NULL, NULL);
INSERT INTO public.control_measure_code VALUES ('145', 'Single Wet Cap', 2005, NULL);
INSERT INTO public.control_measure_code VALUES ('148', 'Clean Burn', 2013, NULL);
INSERT INTO public.control_measure_code VALUES ('216', 'Sulfuric Acid Plant', 2013, NULL);
INSERT INTO public.control_measure_code VALUES ('219', 'Increased Monitoring Frequency (IMF) of PM Controls', 2013, NULL);
INSERT INTO public.control_measure_code VALUES ('78', 'Baffle', 2013, NULL);
INSERT INTO public.control_measure_code VALUES ('80', 'Chemical Oxidation', 2013, NULL);
INSERT INTO public.control_measure_code VALUES ('90', 'Conversion to Variable Vapor Space Tank', 2013, NULL);
INSERT INTO public.control_measure_code VALUES ('0', 'Uncontrolled', 2005, NULL);
INSERT INTO public.control_measure_code VALUES ('220', 'CEM Upgrade and Increased Monitoring Frequency of PM Controls', 2013, NULL);
INSERT INTO public.control_measure_code VALUES ('24', 'Modified Burner or Furnace Design', 2013, NULL);
INSERT INTO public.control_measure_code VALUES ('27', 'Reduced Combustion - Air Preheating', 2013, NULL);
INSERT INTO public.control_measure_code VALUES ('33', 'Control of % O2 in Combustion Air (Off Stoichiometric Firing)', 2013, NULL);
INSERT INTO public.control_measure_code VALUES ('40', 'Alkalized Alumina', 2013, NULL);
INSERT INTO public.control_measure_code VALUES ('81', 'Chemical Reduction', 2013, NULL);
INSERT INTO public.control_measure_code VALUES ('83', 'Chemical Neutralization', 2013, NULL);
INSERT INTO public.control_measure_code VALUES ('91', 'Conversion to Floating Roof Tank', 2013, NULL);
INSERT INTO public.control_measure_code VALUES ('92', 'Conversion to Pressurized Tank', 2013, NULL);
INSERT INTO public.control_measure_code VALUES ('94', 'Underground Tank', 2013, NULL);
INSERT INTO public.control_measure_code VALUES ('122', 'Quench Tower', 2013, NULL);
INSERT INTO public.control_measure_code VALUES ('137', 'HVAF', 2005, NULL);
INSERT INTO public.control_measure_code VALUES ('138', 'Boiler at Landfill', 2013, NULL);
INSERT INTO public.control_measure_code VALUES ('144', 'Spray Screen', 2013, NULL);
INSERT INTO public.control_measure_code VALUES ('1', 'Wet Scrubber - High Efficiency', 2005, 'Wet Scrubber');
INSERT INTO public.control_measure_code VALUES ('2', 'Wet Scrubber - Medium Efficiency', 2005, 'Wet Scrubber');
INSERT INTO public.control_measure_code VALUES ('3', 'Wet Scrubber - Low Efficiency', 2005, 'Wet Scrubber');
INSERT INTO public.control_measure_code VALUES ('4', 'Gravity Collector - High Efficiency', 2005, 'Gravity Collector');
INSERT INTO public.control_measure_code VALUES ('5', 'Gravity Collector - Medium Efficiency', 2005, 'Gravity Collector');
INSERT INTO public.control_measure_code VALUES ('6', 'Gravity Collector - Low Efficiency', 2005, 'Gravity Collector');
INSERT INTO public.control_measure_code VALUES ('7', 'Centrifugal Collector (Cyclone) - High Efficiency', 2005, 'Cyclone / Centrifugal Collector');
INSERT INTO public.control_measure_code VALUES ('8', 'Centrifugal Collector (Cyclone) - Medium Efficiency', 2005, 'Cyclone / Centrifugal Collector');
INSERT INTO public.control_measure_code VALUES ('9', 'Centrifugal Collector (Cyclone) - Low Efficiency', 2005, 'Cyclone / Centrifugal Collector');
INSERT INTO public.control_measure_code VALUES ('10', 'Electrostatic Precipitator - High Efficiency', 2005, 'Electrostatic Precipitator - Dry (DESP)');
INSERT INTO public.control_measure_code VALUES ('11', 'Electrostatic Precipitator - Medium Efficiency', 2005, 'Electrostatic Precipitator - Dry (DESP)');
INSERT INTO public.control_measure_code VALUES ('12', 'Electrostatic Precipitator - Low Efficiency', 2005, 'Electrostatic Precipitator - Dry (DESP)');
INSERT INTO public.control_measure_code VALUES ('14', 'Mist Eliminator - High Velocity, I.E. V>250 Ft/Min.', 2005, 'Mist Eliminator');
INSERT INTO public.control_measure_code VALUES ('15', 'Mist Eliminator - Low Velocity, I.E. V<250 Ft/Min.', 2005, 'Mist Eliminator');
INSERT INTO public.control_measure_code VALUES ('16', 'Fabric Filter - High Temperature, I.E. T>250F', 2005, 'Fabric Filter / Baghouse');
INSERT INTO public.control_measure_code VALUES ('17', 'Fabric Filter - Medium Temperature, I.E. 180F<T<250F', 2005, 'Fabric Filter / Baghouse');
INSERT INTO public.control_measure_code VALUES ('18', 'Fabric Filter - Low Temperature , I.E. T<180F', 2005, 'Fabric Filter / Baghouse');
INSERT INTO public.control_measure_code VALUES ('28', 'Steam or Water Injection', 2005, 'Water Injection');
INSERT INTO public.control_measure_code VALUES ('30', 'Use of  Fuel with Low Nitrogen Content', 2005, 'Low Nitrogen Content Fuel');
INSERT INTO public.control_measure_code VALUES ('34', 'Wellman-Lord/Sodium Sulfite Scrubbing', 2005, 'Scrubber');
INSERT INTO public.control_measure_code VALUES ('37', 'Citrate Process Scrubbing', 2005, 'Scrubber');
INSERT INTO public.control_measure_code VALUES ('39', 'Catalytic Oxidation - Flue Gas Desulfurization', 2005, 'Flue Gas Desulfurization (FGD)');
INSERT INTO public.control_measure_code VALUES ('43', 'Sulfuric Acid Plant - Contact Process', 2005, 'Sulfuric Acid Plant');
INSERT INTO public.control_measure_code VALUES ('44', 'Sulfuric Acid Plant - Double Contact Process', 2005, 'Sulfuric Acid Plant');
INSERT INTO public.control_measure_code VALUES ('47', 'Vapor Recovery System (Including Condensers, Hooding, Other Enclosures)', 2005, 'Vapor Recovery Unit');
INSERT INTO public.control_measure_code VALUES ('53', 'Venturi Scrubber', 2005, 'Wet Scrubber');
INSERT INTO public.control_measure_code VALUES ('55', 'Impingement Plate Scrubber', 2005, 'Wet Scrubber');
INSERT INTO public.control_measure_code VALUES ('61', 'Dust Suppression by Water Sprays', 2005, 'Dust Suppression');
INSERT INTO public.control_measure_code VALUES ('62', 'Dust Suppression by Chemical Stabilizers or Wetting Agents', 2005, 'Dust Suppression');
INSERT INTO public.control_measure_code VALUES ('71', 'Fluid Bed Dry Scrubber', 2005, 'Dry Scrubber');
INSERT INTO public.control_measure_code VALUES ('72', 'Tube and Shell Condenser', 2005, 'Condenser');
INSERT INTO public.control_measure_code VALUES ('73', 'Refrigerated Condenser', 2005, 'Condenser');
INSERT INTO public.control_measure_code VALUES ('74', 'Barometric Condenser', 2005, 'Condenser');
INSERT INTO public.control_measure_code VALUES ('76', 'Multiple Cyclone w/o Fly Ash Reinjection', 2005, 'Cyclones (Multiple)');
INSERT INTO public.control_measure_code VALUES ('77', 'Multiple Cyclone w/ Fly Ash Reinjection', 2005, 'Cyclones (Multiple)');
INSERT INTO public.control_measure_code VALUES ('84', 'Activated Clay Adsorption', 2013, 'Adsorption - Activated Carbon or other');
INSERT INTO public.control_measure_code VALUES ('98', 'Moving Bed Dry Scrubber', 2005, 'Dry Scrubber');
INSERT INTO public.control_measure_code VALUES ('100', 'Baghouse', 2013, 'Fabric Filter / Baghouse');
INSERT INTO public.control_measure_code VALUES ('105', 'Process Modification - Electrostatic Spraying', 2005, 'Electrostatic Spraying');
INSERT INTO public.control_measure_code VALUES ('106', 'Dust Suppression by Physical Stabilization', 2005, 'Dust Suppression');
INSERT INTO public.control_measure_code VALUES ('107', 'Selective Noncatalytic Reduction for NOx', 2005, 'Selective Non-catalytic Reduction (SNCR)');
INSERT INTO public.control_measure_code VALUES ('108', 'Dust Suppression - Traffic Control', 2005, 'Dust Suppression');
INSERT INTO public.control_measure_code VALUES ('115', 'Impingement Type Wet Scrubber', 2005, 'Wet Scrubber');
INSERT INTO public.control_measure_code VALUES ('116', 'Catalytic Incinerator', 2005, 'Catalytic Oxidizer / Incinerator');
INSERT INTO public.control_measure_code VALUES ('117', 'Packed Scrubber', 2005, 'Wet Scrubber');
INSERT INTO public.control_measure_code VALUES ('118', 'Crossflow Packed Bed', 2005, 'Scrubber');
INSERT INTO public.control_measure_code VALUES ('120', 'Floating Bed Scrubber', 2005, 'Wet Scrubber');
INSERT INTO public.control_measure_code VALUES ('123', 'Spray Scrubber', 2005, 'Wet Scrubber');
INSERT INTO public.control_measure_code VALUES ('124', 'High Pressure Scrubber', 2005, 'Wet Scrubber');
INSERT INTO public.control_measure_code VALUES ('125', 'Low Pressure Scrubber', 2005, 'Wet Scrubber');
INSERT INTO public.control_measure_code VALUES ('130', 'Caustic Scrubber', 2005, 'Wet Scrubber');
INSERT INTO public.control_measure_code VALUES ('134', 'Demister', 2005, 'Mist Eliminator');
INSERT INTO public.control_measure_code VALUES ('143', 'Wet Suppression', 2013, 'Dust Suppression');
INSERT INTO public.control_measure_code VALUES ('150', 'Mechanical Collector', 2013, 'Cyclone / Centrifugal Collector');
INSERT INTO public.control_measure_code VALUES ('151', 'Fiber Mist Eliminator', 2005, 'Mist Eliminator');
INSERT INTO public.control_measure_code VALUES ('152', 'Mist Eliminator - High Efficiency', 2005, 'Mist Eliminator');
INSERT INTO public.control_measure_code VALUES ('153', 'Water Sprays', 2005, 'Dust Suppression');
INSERT INTO public.control_measure_code VALUES ('155', 'Packed Bed Scrubber - High Efficiency', 2005, 'Wet Scrubber');
INSERT INTO public.control_measure_code VALUES ('158', 'Ionizing Wet Scrubber', 2005, 'Wet Scrubber');
INSERT INTO public.control_measure_code VALUES ('159', 'Electrified Filter Bed', 2005, 'Scrubber');
INSERT INTO public.control_measure_code VALUES ('210', 'Centrifugal Collector', 2013, 'Cyclone / Centrifugal Collector');
INSERT INTO public.control_measure_code VALUES ('13', 'Gas Scrubber (General, Not Classified)', 2005, 'Dry Scrubber or Wet Scrubber');
INSERT INTO public.control_measure_code VALUES ('32', 'Ammonia Injection', 2013, 'Selective Catalytic Reduction (SCR) or Selective Non-catalytic Reduction (SNCR)');
INSERT INTO public.control_measure_code VALUES ('129', 'Scrubber', 2013, 'Dry Scrubber or Wet Scrubber');
INSERT INTO public.control_measure_code VALUES ('131', 'Thermal Oxidizer', 2013, 'Recuperative Thermal Oxidizer, Regenerative Thermal Oxidizer, or Thermal Oxidizer / Incinerator');


-- Completed on 2024-02-06 14:37:28

--
-- PostgreSQL database dump complete
--

