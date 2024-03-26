--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7
-- Dumped by pg_dump version 14.1

-- Started on 2024-02-12 15:11:14

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
-- TOC entry 4499 (class 0 OID 16760)
-- Dependencies: 296
-- Data for Name: tribal_code; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tribal_code VALUES ('603', 'Colorado River Indian Tribes of the Colorado River Indian Reservation, Arizona and California');
INSERT INTO public.tribal_code VALUES ('606', 'Hualapai Indian Tribe of the Hualapai Indian Reservation, Arizona');
INSERT INTO public.tribal_code VALUES ('608', 'Hopi Tribe of Arizona');
INSERT INTO public.tribal_code VALUES ('616', 'San Carlos Apache Tribe of the San Carlos Reservation, Arizona');
INSERT INTO public.tribal_code VALUES ('617', 'Kaibab Band of Paiute Indians of the Kaibab Indian Reservation, Arizona');
INSERT INTO public.tribal_code VALUES ('692', 'Paiute Indian Tribe of Utah');
INSERT INTO public.tribal_code VALUES ('696', 'Quechan Tribe of the Fort Yuma Indian Reservation, California & Arizona');
INSERT INTO public.tribal_code VALUES ('701', 'Jicarilla Apache Nation, New Mexico');
INSERT INTO public.tribal_code VALUES ('702', 'Mescalero Apache Tribe of the Mescalero Reservation, New Mexico');
INSERT INTO public.tribal_code VALUES ('704', 'Pueblo of Cochiti, New Mexico');
INSERT INTO public.tribal_code VALUES ('705', 'Pueblo of Isleta, New Mexico');
INSERT INTO public.tribal_code VALUES ('708', 'Pueblo of Nambe, New Mexico');
INSERT INTO public.tribal_code VALUES ('712', 'Pueblo of San Felipe, New Mexico');
INSERT INTO public.tribal_code VALUES ('716', 'Pueblo of Santa Clara, New Mexico');
INSERT INTO public.tribal_code VALUES ('830', 'Alabama-Coushatta Tribes of Texas');
INSERT INTO public.tribal_code VALUES ('980', 'Mississippi Band of Choctaw Indians, Mississippi');
INSERT INTO public.tribal_code VALUES ('719', 'Pueblo of Tesuque, New Mexico');
INSERT INTO public.tribal_code VALUES ('861', 'Kickapoo Tribe of Indians of the Kickapoo Reservation in Kansas');
INSERT INTO public.tribal_code VALUES ('703', 'Pueblo of Acoma');
INSERT INTO public.tribal_code VALUES ('435', 'Red Cliff Band of Lake Superior Chippewa Indians of Wisconsin');
INSERT INTO public.tribal_code VALUES ('904', 'United Keetoowah Band of Cherokee Indians in Oklahoma');
INSERT INTO public.tribal_code VALUES ('806', 'Caddo Indian Tribe of Oklahoma');
INSERT INTO public.tribal_code VALUES ('577', 'La Posta Band of Diegueno Mission Indians of the La Posta Indian Reservation, California');
INSERT INTO public.tribal_code VALUES ('604', 'Fort Mojave Indian Tribe of Arizona, California & Nevada');
INSERT INTO public.tribal_code VALUES ('610', 'Tohono O''Odham Nation of Arizona');
INSERT INTO public.tribal_code VALUES ('614', 'Gila River Indian Community of the Gila River Indian Reservation, Arizona');
INSERT INTO public.tribal_code VALUES ('615', 'Salt River Pima-Maricopa Indian Community of the Salt River Reservation, Arizona');
INSERT INTO public.tribal_code VALUES ('018', 'Penobscot Tribe of Maine');
INSERT INTO public.tribal_code VALUES ('101', 'Confederated Tribes of the Colville Reservation, Washington');
INSERT INTO public.tribal_code VALUES ('568', 'Cabazon Band of Cahuilla Mission Indians of the Cabazon Reservation, California');
INSERT INTO public.tribal_code VALUES ('549', 'Paiute-Shoshone Indians of the Bishop Community of the Bishop Colony, California');
INSERT INTO public.tribal_code VALUES ('124', 'Confederated Tribes and Bands of the Yakama Nation, Washington');
INSERT INTO public.tribal_code VALUES ('380', 'Omaha Tribe of Nebraska');
INSERT INTO public.tribal_code VALUES ('206', 'Assiniboine and Sioux Tribes of the Fort Peck Indian Reservation, Montana');
INSERT INTO public.tribal_code VALUES ('207', 'Northern Cheyenne Tribe of the Northern Cheyenne Indian Reservation, Montana');
INSERT INTO public.tribal_code VALUES ('281', 'Arapahoe Tribe of the Wind River Reservation, Wyoming');
INSERT INTO public.tribal_code VALUES ('303', 'Spirit Lake Tribe, North Dakota');
INSERT INTO public.tribal_code VALUES ('383', 'Winnebago Tribe of Nebraska');
INSERT INTO public.tribal_code VALUES ('407', 'Leech Lake Band of Ojibwe');
INSERT INTO public.tribal_code VALUES ('433', 'Oneida Tribe of Indians of Wisconsin');
INSERT INTO public.tribal_code VALUES ('905', 'Cherokee Nation, Oklahoma');
INSERT INTO public.tribal_code VALUES ('180', 'Shoshone-Bannock Tribes of the Fort Hall Reservation of Idaho');
INSERT INTO public.tribal_code VALUES ('181', 'Coeur d''Alene Tribe of the Coeur d''Alene Reservation, Idaho');
INSERT INTO public.tribal_code VALUES ('182', 'Nez Perce Tribe of Idaho');
INSERT INTO public.tribal_code VALUES ('201', 'Blackfeet Tribe of the Blackfeet Indian Reservation of Montana');
INSERT INTO public.tribal_code VALUES ('202', 'Crow Tribe of Montana');
INSERT INTO public.tribal_code VALUES ('203', 'Confederated Salish & Kootenai Tribes of the Flathead Reservation, Montana');
INSERT INTO public.tribal_code VALUES ('707', 'Pueblo of Laguna, New Mexico');
INSERT INTO public.tribal_code VALUES ('715', 'Pueblo of Santa Ana, New Mexico');
INSERT INTO public.tribal_code VALUES ('033', 'Mohegan Tribe of Indians of Connecticut');
INSERT INTO public.tribal_code VALUES ('513', 'Cortina Band of Wintun Indians');
INSERT INTO public.tribal_code VALUES ('558', 'Blue Lake Rancheria');
INSERT INTO public.tribal_code VALUES ('434', 'Forest County Potawatomi Community');
INSERT INTO public.tribal_code VALUES ('108', 'Makah Indian Tribe of the Makah Indian Reservation');
INSERT INTO public.tribal_code VALUES ('751', 'Ute Mountain Tribe of the Ute Mountain Reservation, Colorado, New Mexico & Utah');
INSERT INTO public.tribal_code VALUES ('780', 'Navajo Nation, Arizona, New Mexico & Utah');
INSERT INTO public.tribal_code VALUES ('409', 'Red Lake Band of Chippewa Indians');
INSERT INTO public.tribal_code VALUES ('862', 'Prairie Band Potawatomi Nation');
INSERT INTO public.tribal_code VALUES ('672', 'Washoe Tribe of California and Nevada');
INSERT INTO public.tribal_code VALUES ('823', 'Kickapoo Tribe of Oklahoma');
INSERT INTO public.tribal_code VALUES ('863', 'Sac & Fox Nation of Missouri in Kansas and Nebraska');
INSERT INTO public.tribal_code VALUES ('143', 'Confederated Tribes of the Umatilla Reservation, Oregon');
INSERT INTO public.tribal_code VALUES ('529', 'Lone Band of Miwok Indians of California');
INSERT INTO public.tribal_code VALUES ('361', 'Pala Band of Missions Indians');
INSERT INTO public.tribal_code VALUES ('601', 'Yavapai-Apache Nation of the Camp Verde Indian Reservation, Arizona');
INSERT INTO public.tribal_code VALUES ('507', 'Big Valley Band of Pomo Indians of the Big Valley Rancheria, California');
INSERT INTO public.tribal_code VALUES ('651', 'Pyramid Lake Paiute Tribe of the Pyramid Lake Reservation, Nevada');
INSERT INTO public.tribal_code VALUES ('920', 'Quapaw Tribe of Indians, Oklahoma');
INSERT INTO public.tribal_code VALUES ('032', 'Catawba Indian Nation, South Carolina');
INSERT INTO public.tribal_code VALUES ('001', 'Eastern Band of Cherokee Indians');
INSERT INTO public.tribal_code VALUES ('840', 'Kaw Nation of Oklahoma');
INSERT INTO public.tribal_code VALUES ('408', 'Mille Lacs Band of Ojibwe');
INSERT INTO public.tribal_code VALUES ('750', 'Southern Ute Indian Tribe');
INSERT INTO public.tribal_code VALUES ('123', 'Tulalip Tribes of Washington');
INSERT INTO public.tribal_code VALUES ('821', 'Citizen Potawatami Nation, Oklahoma');
INSERT INTO public.tribal_code VALUES ('007', 'St. Regis Band of Mohawk Indians of New York');
INSERT INTO public.tribal_code VALUES ('028', 'Poarch Band of Creek Indians of Alabama');
INSERT INTO public.tribal_code VALUES ('382', 'Santee Sioux Nation, Nebraska');
INSERT INTO public.tribal_code VALUES ('472', 'Saginaw Chippewa Indian Tribe of Michigan');
INSERT INTO public.tribal_code VALUES ('469', 'Sault Ste. Marie Tribe of Chippewa Indians of Michigan and Wisconsin');
INSERT INTO public.tribal_code VALUES ('479', 'Lac Vieux Desert Band of Lake Superior Chippewa Indians, Michigan');
INSERT INTO public.tribal_code VALUES ('482', 'Little River Band of Ottawa Indians, Michigan');
INSERT INTO public.tribal_code VALUES ('183', 'Kootenai Tribe of Idaho');
INSERT INTO public.tribal_code VALUES ('822', 'Iowa Tribe of Oklahoma');
INSERT INTO public.tribal_code VALUES ('710', 'Pueblo of Pojoaque');
INSERT INTO public.tribal_code VALUES ('906', 'Chickasaw Nation');
INSERT INTO public.tribal_code VALUES ('406', 'Grand Portage of the Minnesota Chippewa Tribe');
INSERT INTO public.tribal_code VALUES ('483', 'Little Traverse Bay Bands of Odawa Indians, Michigan');
INSERT INTO public.tribal_code VALUES ('595', 'Torres-Martinez Band of Cahuilla Mission Indians of California');
INSERT INTO public.tribal_code VALUES ('653', 'Reno-Sparks Indian Colony, Nevada');
INSERT INTO public.tribal_code VALUES ('824', 'Sac and Fox Nation of Oklahoma');
INSERT INTO public.tribal_code VALUES ('102', 'Spokane Tribe of the Spokane Reservation, Washington');
INSERT INTO public.tribal_code VALUES ('282', 'Shoshone Tribe of the Wind River Reservation, Wyoming');
INSERT INTO public.tribal_code VALUES ('301', 'Three Affiliated Tribes of the Fort Berthold Reservation, North Dakota');
INSERT INTO public.tribal_code VALUES ('302', 'Standing Rock Sioux Tribe of North & South Dakota');
INSERT INTO public.tribal_code VALUES ('304', 'Turtle Mountain Band of Chippewa Indians of North Dakota');
INSERT INTO public.tribal_code VALUES ('346', 'Yankton Sioux Tribe of South Dakota');
INSERT INTO public.tribal_code VALUES ('347', 'Sisseton-Wahpeton Sioux Tribe of the Lake Traverse Reservation, South Dakota');
INSERT INTO public.tribal_code VALUES ('405', 'Fond du Lac Band of Lake Superior Chippewa Tribe');
INSERT INTO public.tribal_code VALUES ('553', 'Tule River Indian Tribe of the Tule River Reservation, California');
INSERT INTO public.tribal_code VALUES ('687', 'Ute Indian Tribe of the Uintah & Ouray Reservation, Utah');
INSERT INTO public.tribal_code VALUES ('721', 'Zuni Tribe of the Zuni Reservation, New Mexico');
INSERT INTO public.tribal_code VALUES ('021', 'Seminole Tribe of Florida, Dania, Big Cypress, Brighton, Hollywood & Tampa Reservations');
INSERT INTO public.tribal_code VALUES ('026', 'Miccosukee Tribe of Indians of Florida');
INSERT INTO public.tribal_code VALUES ('110', 'Nisqually Indian Tribe of the Nisqually Reservation, Washington');
INSERT INTO public.tribal_code VALUES ('115', 'Puyallup Tribe of the Puyallup Reservation, Washington');
INSERT INTO public.tribal_code VALUES ('117', 'Quinault Tribe of the Quinault Reservation, Washington');
INSERT INTO public.tribal_code VALUES ('141', 'Confederated Tribes of the Grand Ronde Community of Oregon');
INSERT INTO public.tribal_code VALUES ('142', 'Confederated Tribes of the Siletz Reservation, Oregon');
INSERT INTO public.tribal_code VALUES ('145', 'Confederated Tribes of the Warm Springs Reservation of Oregon');
INSERT INTO public.tribal_code VALUES ('204', 'Fort Belknap Indian Community of the Fort Belknap Reservation of Montana');
INSERT INTO public.tribal_code VALUES ('205', 'Chippewa-Cree Indians of the Rocky Boy''s Reservation, Montana');
INSERT INTO public.tribal_code VALUES ('340', 'Cheyenne River Sioux Tribe of the Cheyenne River Reservation, South Dakota');
INSERT INTO public.tribal_code VALUES ('342', 'Crow Creek Sioux Tribe of the Crow Creek Reservation, South Dakota');
INSERT INTO public.tribal_code VALUES ('343', 'Lower Brule Sioux Tribe of the Lower Brule Reservation, South Dakota');
INSERT INTO public.tribal_code VALUES ('344', 'Oglala Sioux Tribe of the Pine Ridge Reservation, South Dakota');
INSERT INTO public.tribal_code VALUES ('345', 'Rosebud Sioux Tribe of the Rosebud Indian Reservation, South Dakota');
INSERT INTO public.tribal_code VALUES ('400', 'Minnesota Chippewa Tribe, Minnesota');
INSERT INTO public.tribal_code VALUES ('410', 'White Earth Band of the Minnesota Chippewa Tribe');
INSERT INTO public.tribal_code VALUES ('440', 'Menominee Indian Tribe of Wisconsin');
INSERT INTO public.tribal_code VALUES ('561', 'Hoopa Valley Tribe, California');
INSERT INTO public.tribal_code VALUES ('569', 'Cahuilla Band of Mission Indians of the Cahuilla Reservation, California');
INSERT INTO public.tribal_code VALUES ('578', 'Los Coyotes Band of Cahuilla Mission Indians of the Los Coyotes Reservation, California');
INSERT INTO public.tribal_code VALUES ('582', 'Morongo Band of Cahuilla Mission Indians of the Morongo Reservation, California');
INSERT INTO public.tribal_code VALUES ('590', 'Santa Rosa Band of Cahuilla Mission Indians of the Santa Rosa Reservation, California');
INSERT INTO public.tribal_code VALUES ('598', 'Twenty-Nine Palms Band of Mission Indians of California');
INSERT INTO public.tribal_code VALUES ('490', 'Sac & Fox Tribe of the Mississippi in Iowa');
INSERT INTO public.tribal_code VALUES ('607', 'White Mountain Apache Tribe of the Fort Apache Reservation, Arizona');
INSERT INTO public.tribal_code VALUES ('586', 'Pechanga Band of Luiseno Mission Indians of the Pechanga Reservation, California');
INSERT INTO public.tribal_code VALUES ('122', 'Swinomish Indians of the Swinomish Reservation, Washington');


-- Completed on 2024-02-12 15:11:18

--
-- PostgreSQL database dump complete
--

