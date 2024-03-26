--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7
-- Dumped by pg_dump version 14.1

-- Started on 2024-02-12 15:03:17

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
-- TOC entry 4500 (class 0 OID 16744)
-- Dependencies: 292
-- Data for Name: schema_version_cef; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.schema_version_cef VALUES (1, '0.0.1', 'ReferenceData', 'SQL', 'V0.0.1__ReferenceData.sql', 285132797, 'cef', '2021-11-17 14:56:10.19024', 3883, true);
INSERT INTO public.schema_version_cef VALUES (2, '0.0.2', 'EmissionsReport', 'SQL', 'V0.0.2__EmissionsReport.sql', 918403283, 'cef', '2021-11-17 14:56:10.203419', 68, true);
INSERT INTO public.schema_version_cef VALUES (3, '0.0.3', 'Facility', 'SQL', 'V0.0.3__Facility.sql', 1068928609, 'cef', '2021-11-17 14:56:10.278315', 64, true);
INSERT INTO public.schema_version_cef VALUES (4, '0.0.4', 'Baseline Reporting Schema', 'SQL', 'V0.0.4__Baseline_Reporting_Schema.sql', 1952585502, 'cef', '2021-11-17 14:56:10.349016', 544, true);
INSERT INTO public.schema_version_cef VALUES (5, '0.0.5', 'UnitOfMeasure', 'SQL', 'V0.0.5__UnitOfMeasure.sql', -1822774525, 'cef', '2021-11-17 14:56:10.914995', 4, true);
INSERT INTO public.schema_version_cef VALUES (6, '0.0.6', 'UpdateOperatingDetails', 'SQL', 'V0.0.6__UpdateOperatingDetails.sql', -1713760895, 'cef', '2021-11-17 14:56:10.925685', 2, true);
INSERT INTO public.schema_version_cef VALUES (7, '0.0.7', 'AddContactInformation', 'SQL', 'V0.0.7__AddContactInformation.sql', 834844165, 'cef', '2021-11-17 14:56:10.935397', 74, true);
INSERT INTO public.schema_version_cef VALUES (8, '0.0.8', 'UpdateReleasePoint', 'SQL', 'V0.0.8__UpdateReleasePoint.sql', 211580560, 'cef', '2021-11-17 14:56:11.014098', 2, true);
INSERT INTO public.schema_version_cef VALUES (9, '0.0.9', 'UpdateFacilitySiteContact', 'SQL', 'V0.0.9__UpdateFacilitySiteContact.sql', -143958991, 'cef', '2021-11-17 14:56:11.020996', 62, true);
INSERT INTO public.schema_version_cef VALUES (10, '0.0.10', 'AddEISIdToFacility', 'SQL', 'V0.0.10__AddEISIdToFacility.sql', 930372200, 'cef', '2021-11-17 14:56:11.09178', 2, true);
INSERT INTO public.schema_version_cef VALUES (11, '0.0.11', 'RefactorFacilities', 'SQL', 'V0.0.11__RefactorFacilities.sql', -1097833, 'cef', '2021-11-17 14:56:11.098767', 2, true);
INSERT INTO public.schema_version_cef VALUES (12, '0.0.12', 'AddAircraftCodeToProcess', 'SQL', 'V0.0.12__AddAircraftCodeToProcess.sql', -1848541232, 'cef', '2021-11-17 14:56:11.105277', 3, true);
INSERT INTO public.schema_version_cef VALUES (13, '0.0.13', 'AddAddtionalReferenceData', 'SQL', 'V0.0.13__AddAddtionalReferenceData.sql', 715992501, 'cef', '2021-11-17 14:56:11.115198', 936, true);
INSERT INTO public.schema_version_cef VALUES (14, '0.0.14', 'AddCommentsAndCAS', 'SQL', 'V0.0.14__AddCommentsAndCAS.sql', 1265482701, 'cef', '2021-11-17 14:56:12.059377', 1, true);
INSERT INTO public.schema_version_cef VALUES (15, '0.0.15', 'Add Control Devices', 'SQL', 'V0.0.15__Add_Control_Devices.sql', -1715147917, 'cef', '2021-11-17 14:56:12.067786', 423, true);
INSERT INTO public.schema_version_cef VALUES (16, '0.0.16', 'AddOperatingStatusToControl', 'SQL', 'V0.0.16__AddOperatingStatusToControl.sql', 1921379183, 'cef', '2021-11-17 14:56:12.49805', 3, true);
INSERT INTO public.schema_version_cef VALUES (17, '0.0.17', 'AddCommentsFields', 'SQL', 'V0.0.17__AddCommentsFields.sql', -360032442, 'cef', '2021-11-17 14:56:12.506423', 2, true);
INSERT INTO public.schema_version_cef VALUES (18, '0.0.18', 'AddDesignCapacity', 'SQL', 'V0.0.18__AddDesignCapacity.sql', -372145072, 'cef', '2021-11-17 14:56:12.513166', 1, true);
INSERT INTO public.schema_version_cef VALUES (19, '0.0.19', 'AddPercentReduction', 'SQL', 'V0.0.19__AddPercentReduction.sql', 566498841, 'cef', '2021-11-17 14:56:12.519406', 272, true);
INSERT INTO public.schema_version_cef VALUES (20, '0.0.20', 'ViewsForTRI API', 'SQL', 'V0.0.20__ViewsForTRI_API.sql', 801774211, 'cef', '2021-11-17 14:56:12.801084', 108, true);
INSERT INTO public.schema_version_cef VALUES (21, '0.0.21', 'AddNaicsCodeIndustry', 'SQL', 'V0.0.21__AddNaicsCodeIndustry.sql', 1711605443, 'cef', '2021-11-17 14:56:12.913881', 95, true);
INSERT INTO public.schema_version_cef VALUES (22, '0.0.22', 'AddReportingPeriodComment', 'SQL', 'V0.0.22__AddReportingPeriodComment.sql', 2005722429, 'cef', '2021-11-17 14:56:13.01516', 1, true);
INSERT INTO public.schema_version_cef VALUES (23, '0.0.23', 'UpdateSubmissionsReviewDashboardView', 'SQL', 'V0.0.23__UpdateSubmissionsReviewDashboardView.sql', -788451242, 'cef', '2021-11-17 14:56:13.020588', 6, true);
INSERT INTO public.schema_version_cef VALUES (24, '0.0.24', 'Multiple NAICS Codes for Facility', 'SQL', 'V0.0.24__Multiple_NAICS_Codes_for_Facility.sql', -151171004, 'cef', '2021-11-17 14:56:13.032779', 284, true);
INSERT INTO public.schema_version_cef VALUES (25, '0.0.25', 'Update SLT Dashboard View', 'SQL', 'V0.0.25__Update_SLT_Dashboard_View.sql', -392322503, 'cef', '2021-11-17 14:56:13.323186', 7, true);
INSERT INTO public.schema_version_cef VALUES (26, '0.0.26', 'Addtional Fields For DB', 'SQL', 'V0.0.26__Addtional_Fields_For_DB.sql', -20670199, 'cef', '2021-11-17 14:56:13.33558', 8, true);
INSERT INTO public.schema_version_cef VALUES (27, '0.0.27', 'ReportSummaryView', 'SQL', 'V0.0.27__ReportSummaryView.sql', -1818850535, 'cef', '2021-11-17 14:56:13.348706', 24, true);
INSERT INTO public.schema_version_cef VALUES (28, '0.0.28', 'UpdateSubmissionsReviewDashboardView', 'SQL', 'V0.0.28__UpdateSubmissionsReviewDashboardView.sql', -962305074, 'cef', '2021-11-17 14:56:13.379998', 8, true);
INSERT INTO public.schema_version_cef VALUES (29, '0.0.29', 'AddCromerrColumns', 'SQL', 'V0.0.29__AddCromerrColumns.sql', -2499452, 'cef', '2021-11-17 14:56:13.392801', 1, true);
INSERT INTO public.schema_version_cef VALUES (30, '0.0.30', 'Add Pollutant Codes', 'SQL', 'V0.0.30__Add_Pollutant_Codes.sql', -1753648198, 'cef', '2021-11-17 14:56:13.39879', 676, true);
INSERT INTO public.schema_version_cef VALUES (31, '0.0.31', 'UpdateTRIViewToStackFugitive', 'SQL', 'V0.0.31__UpdateTRIViewToStackFugitive.sql', -1188221086, 'cef', '2021-11-17 14:56:14.084979', 6, true);
INSERT INTO public.schema_version_cef VALUES (32, '0.0.32', 'CalculationDirectEntry', 'SQL', 'V0.0.32__CalculationDirectEntry.sql', 665834106, 'cef', '2021-11-17 14:56:14.095456', 3, true);
INSERT INTO public.schema_version_cef VALUES (33, '0.0.33', 'UoMEmissionsNumeratorDenominator', 'SQL', 'V0.0.33__UoMEmissionsNumeratorDenominator.sql', 1512184784, 'cef', '2021-11-17 14:56:14.103467', 22, true);
INSERT INTO public.schema_version_cef VALUES (34, '0.0.34', 'SccCodeDescription', 'SQL', 'V0.0.34__SccCodeDescription.sql', -1149378085, 'cef', '2021-11-17 14:56:14.130363', 1, true);
INSERT INTO public.schema_version_cef VALUES (35, '0.0.35', 'RelaxNotNullConstraints', 'SQL', 'V0.0.35__RelaxNotNullConstraints.sql', -1563377963, 'cef', '2021-11-17 14:56:14.136765', 2, true);
INSERT INTO public.schema_version_cef VALUES (36, '0.0.36', 'UpdateControlStructure', 'SQL', 'V0.0.36__UpdateControlStructure.sql', 510669282, 'cef', '2021-11-17 14:56:14.143367', 26, true);
INSERT INTO public.schema_version_cef VALUES (37, '0.0.37', 'RenameControlPathChildColumn', 'SQL', 'V0.0.37__RenameControlPathChildColumn.sql', 1926210470, 'cef', '2021-11-17 14:56:14.174526', 1, true);
INSERT INTO public.schema_version_cef VALUES (38, '0.0.38', 'AddEmissionFactorTable', 'SQL', 'V0.0.38__AddEmissionFactorTable.sql', -1843007222, 'cef', '2021-11-17 14:56:14.179192', 68, true);
INSERT INTO public.schema_version_cef VALUES (39, '0.0.39', 'InsertEmissionFactors', 'SQL', 'V0.0.39__InsertEmissionFactors.sql', 1326661418, 'cef', '2021-11-17 14:56:14.251928', 5374, true);
INSERT INTO public.schema_version_cef VALUES (40, '0.0.40', 'TotalEmissionToNumeric', 'SQL', 'V0.0.40__TotalEmissionToNumeric.sql', 114197599, 'cef', '2021-11-17 14:56:19.63359', 6, true);
INSERT INTO public.schema_version_cef VALUES (41, '0.0.41', 'UpdateTRIViewForNonOperatingProcess', 'SQL', 'V0.0.41__UpdateTRIViewForNonOperatingProcess.sql', -1705434710, 'cef', '2021-11-17 14:56:19.643941', 6, true);
INSERT INTO public.schema_version_cef VALUES (42, '0.0.42', 'UpdateReportSummaryForShutdownProcess', 'SQL', 'V0.0.42__UpdateReportSummaryForShutdownProcess.sql', -1629755111, 'cef', '2021-11-17 14:56:19.655133', 36, true);
INSERT INTO public.schema_version_cef VALUES (43, '0.0.43', 'AddControlMeasureCodeTable', 'SQL', 'V0.0.43__AddControlMeasureCodeTable.sql', -253675162, 'cef', '2021-11-17 14:56:19.767664', 74, true);
INSERT INTO public.schema_version_cef VALUES (44, '0.0.44', 'CalculationMethodEpaEf', 'SQL', 'V0.0.44__CalculationMethodEpaEf.sql', 1697732296, 'cef', '2021-11-17 14:56:19.774823', 3, true);
INSERT INTO public.schema_version_cef VALUES (45, '0.0.45', 'AllowNullControlId', 'SQL', 'V0.0.45__AllowNullControlId.sql', -1784014129, 'cef', '2021-11-17 14:56:19.785388', 1, true);
INSERT INTO public.schema_version_cef VALUES (46, '0.0.46', 'UpdateReportSummaryPercentages', 'SQL', 'V0.0.46__UpdateReportSummaryPercentages.sql', -750475150, 'cef', '2021-11-17 14:56:19.792178', 36, true);
INSERT INTO public.schema_version_cef VALUES (47, '0.0.47', 'IncludeControlMeasureForEFs', 'SQL', 'V0.0.47__IncludeControlMeasureForEFs.sql', -1210097183, 'cef', '2021-11-17 14:56:19.83414', 5860, true);
INSERT INTO public.schema_version_cef VALUES (48, '0.0.48', 'UpdateSRDViewReportStatus', 'SQL', 'V0.0.48__UpdateSRDViewReportStatus.sql', -129004434, 'cef', '2021-11-17 14:56:26.469338', 14, true);
INSERT INTO public.schema_version_cef VALUES (49, '0.0.49', 'RemoveAssignmentDescription', 'SQL', 'V0.0.49__RemoveAssignmentDescription.sql', -1605943989, 'cef', '2021-11-17 14:56:26.489314', 1, true);
INSERT INTO public.schema_version_cef VALUES (50, '0.0.50', 'AddAssignmentApportionment', 'SQL', 'V0.0.50__AddAssignmentApportionment.sql', 353199657, 'cef', '2021-11-17 14:56:26.495639', 2, true);
INSERT INTO public.schema_version_cef VALUES (51, '0.0.51', 'AddEmissionsOperatingTypeCode', 'SQL', 'V0.0.51__AddEmissionsOperatingTypeCode.sql', 437442094, 'cef', '2021-11-17 14:56:26.502197', 62, true);
INSERT INTO public.schema_version_cef VALUES (52, '0.0.52', 'Update DesignCapacity StackHeight DataTypes', 'SQL', 'V0.0.52__Update_DesignCapacity_StackHeight_DataTypes.sql', -362918680, 'cef', '2021-11-17 14:56:26.569082', 1, true);
INSERT INTO public.schema_version_cef VALUES (53, '0.0.53', 'StackTestDirectEntry', 'SQL', 'V0.0.53__StackTestDirectEntry.sql', -1181941578, 'cef', '2021-11-17 14:56:26.574348', 2, true);
INSERT INTO public.schema_version_cef VALUES (54, '0.0.54', 'AddReportHistoryTable', 'SQL', 'V0.0.54__AddReportHistoryTable.sql', 963826417, 'cef', '2021-11-17 14:56:26.579512', 44, true);
INSERT INTO public.schema_version_cef VALUES (55, '0.0.55', 'UpdateReleasePoint Fugitive', 'SQL', 'V0.0.55__UpdateReleasePoint_Fugitive.sql', 1648829564, 'cef', '2021-11-17 14:56:26.62853', 8, true);
INSERT INTO public.schema_version_cef VALUES (56, '0.0.56', 'AddEmissionFormula', 'SQL', 'V0.0.56__AddEmissionFormula.sql', 1888011472, 'cef', '2021-11-17 14:56:26.642279', 2, true);
INSERT INTO public.schema_version_cef VALUES (57, '0.0.57', 'RemoveFailedValidationStatus', 'SQL', 'V0.0.57__RemoveFailedValidationStatus.sql', -321129422, 'cef', '2021-11-17 14:56:26.64763', 1, true);
INSERT INTO public.schema_version_cef VALUES (58, '0.0.58', 'UpdateAllCommentFields', 'SQL', 'V0.0.58__UpdateAllCommentFields.sql', -1820670016, 'cef', '2021-11-17 14:56:26.653976', 411, true);
INSERT INTO public.schema_version_cef VALUES (59, '0.0.59', 'RemoveTypeCodeDescription', 'SQL', 'V0.0.59__RemoveTypeCodeDescription.sql', -1793571472, 'cef', '2021-11-17 14:56:27.080793', 1, true);
INSERT INTO public.schema_version_cef VALUES (60, '0.0.60', 'AddEmissionFormulaVariable', 'SQL', 'V0.0.60__AddEmissionFormulaVariable.sql', 880014900, 'cef', '2021-11-17 14:56:27.085863', 118, true);
INSERT INTO public.schema_version_cef VALUES (61, '0.0.61', 'AddStatusForTRIEmissionService', 'SQL', 'V0.0.61__AddStatusForTRIEmissionService.sql', 2108807091, 'cef', '2021-11-17 14:56:27.208249', 6, true);
INSERT INTO public.schema_version_cef VALUES (62, '0.0.62', 'UpdatedFacilitySiteContactEmail', 'SQL', 'V0.0.62__UpdatedFacilitySiteContactEmail.sql', 1853452924, 'cef', '2021-11-17 14:56:27.219499', 1, true);
INSERT INTO public.schema_version_cef VALUES (63, '0.0.63', 'AddFacilitySiteComment', 'SQL', 'V0.0.63__AddFacilitySiteComment.sql', 1619460682, 'cef', '2021-11-17 14:56:27.225232', 1, true);
INSERT INTO public.schema_version_cef VALUES (64, '0.0.64', 'UpdateControlPath PathId', 'SQL', 'V0.0.64__UpdateControlPath_PathId.sql', -854618977, 'cef', '2021-11-17 14:56:27.232635', 2, true);
INSERT INTO public.schema_version_cef VALUES (65, '0.0.65', 'AddCertificationDateforTRIView', 'SQL', 'V0.0.65__AddCertificationDateforTRIView.sql', -1632490751, 'cef', '2021-11-17 14:56:27.240496', 62, true);
INSERT INTO public.schema_version_cef VALUES (66, '0.0.66', 'AddUomCalculationValues', 'SQL', 'V0.0.66__AddUomCalculationValues.sql', 813262113, 'cef', '2021-11-17 14:56:27.306117', 46, true);
INSERT INTO public.schema_version_cef VALUES (67, '0.0.67', 'AddEmissionTotalManualEntry', 'SQL', 'V0.0.67__AddEmissionTotalManualEntry.sql', 1441512560, 'cef', '2021-11-17 14:56:27.357002', 1, true);
INSERT INTO public.schema_version_cef VALUES (68, '0.0.68', 'AddPointSourceSccCodes', 'SQL', 'V0.0.68__AddPointSourceSccCodes.sql', -1676916737, 'cef', '2021-11-17 14:56:27.364587', 1158, true);
INSERT INTO public.schema_version_cef VALUES (69, '0.0.69', 'UpdateEmissionTotaltManualEntry', 'SQL', 'V0.0.69__UpdateEmissionTotaltManualEntry.sql', -759434521, 'cef', '2021-11-17 14:56:28.618374', 2, true);
INSERT INTO public.schema_version_cef VALUES (70, '0.0.70', 'AddEisLatLongToleranceLookup', 'SQL', 'V0.0.70__AddEisLatLongToleranceLookup.sql', -1854279842, 'cef', '2021-11-17 14:56:28.670559', 207, true);
INSERT INTO public.schema_version_cef VALUES (71, '0.0.71', 'UpdateReportSummaryIncludeBasicTotals', 'SQL', 'V0.0.71__UpdateReportSummaryIncludeBasicTotals.sql', -1342702117, 'cef', '2021-11-17 14:56:28.882707', 39, true);
INSERT INTO public.schema_version_cef VALUES (72, '0.0.72', 'AddEmissionOverallControlPercent', 'SQL', 'V0.0.72__AddEmissionOverallControlPercent.sql', 1540784654, 'cef', '2021-11-17 14:56:28.932762', 1, true);
INSERT INTO public.schema_version_cef VALUES (73, '0.0.73', 'AddReportDownloadView', 'SQL', 'V0.0.73__AddReportDownloadView.sql', -329247209, 'cef', '2021-11-17 14:56:28.937576', 6, true);
INSERT INTO public.schema_version_cef VALUES (74, '0.0.74', 'FixGAProgramSysCode', 'SQL', 'V0.0.74__FixGAProgramSysCode.sql', 1071476207, 'cef', '2021-11-17 14:56:28.948397', 1, true);
INSERT INTO public.schema_version_cef VALUES (75, '0.0.75', 'UpdateReportDownloadView2', 'SQL', 'V0.0.75__UpdateReportDownloadView2.sql', 464376638, 'cef', '2021-11-17 14:56:28.956557', 11, true);
INSERT INTO public.schema_version_cef VALUES (76, '0.0.76', 'UpdateReportDownloadView3', 'SQL', 'V0.0.76__UpdateReportDownloadView3.sql', 1053887194, 'cef', '2021-11-17 14:56:28.972657', 11, true);
INSERT INTO public.schema_version_cef VALUES (77, '0.0.77', 'AddUomLegacyFlag', 'SQL', 'V0.0.77__AddUomLegacyFlag.sql', -1949853035, 'cef', '2021-11-17 14:56:28.989178', 32, true);
INSERT INTO public.schema_version_cef VALUES (78, '0.0.78', 'RemoveProgramSystemCodeForReleasePointAndUnit', 'SQL', 'V0.0.78__RemoveProgramSystemCodeForReleasePointAndUnit.sql', -2039686726, 'cef', '2021-11-17 14:56:29.025751', 7, true);
INSERT INTO public.schema_version_cef VALUES (79, '0.0.79', 'UpdateFacilityCounty', 'SQL', 'V0.0.79__UpdateFacilityCounty.sql', -1148908689, 'cef', '2021-11-17 14:56:29.037695', 176, true);
INSERT INTO public.schema_version_cef VALUES (80, '0.0.80', 'UpdateReleasePoint', 'SQL', 'V0.0.80__UpdateReleasePoint.sql', 1383173382, 'cef', '2021-11-17 14:56:29.227637', 1, true);
INSERT INTO public.schema_version_cef VALUES (81, '0.0.81', 'UpdateReportSummaryRemoveUom', 'SQL', 'V0.0.81__UpdateReportSummaryRemoveUom.sql', 451678313, 'cef', '2021-11-17 14:56:29.235627', 42, true);
INSERT INTO public.schema_version_cef VALUES (82, '0.0.82', 'UpdateEmissionFactors', 'SQL', 'V0.0.82__UpdateEmissionFactors.sql', 1396070528, 'cef', '2021-11-17 14:56:29.283534', 5064, true);
INSERT INTO public.schema_version_cef VALUES (83, '0.0.83', 'UpdateEmissionFactorSccCodeType', 'SQL', 'V0.0.83__UpdateEmissionFactorSccCodeType.sql', 211338865, 'cef', '2021-11-17 14:56:34.460554', 436, true);
INSERT INTO public.schema_version_cef VALUES (84, '0.0.84', 'UpdateMVPReferenceData', 'SQL', 'V0.0.84__UpdateMVPReferenceData.sql', 1493468976, 'cef', '2021-11-17 14:56:35.590545', 313, true);
INSERT INTO public.schema_version_cef VALUES (85, '0.0.85', 'AddEmissionsReportYearIndex', 'SQL', 'V0.0.85__AddEmissionsReportYearIndex.sql', -60428215, 'cef', '2021-11-17 14:56:35.912449', 41, true);
INSERT INTO public.schema_version_cef VALUES (86, '1.0.0', 'UpdateControlPollutant', 'SQL', 'V1.0.0__UpdateControlPollutant.sql', -1084333795, 'cef', '2021-11-17 14:56:35.957459', 1, true);
INSERT INTO public.schema_version_cef VALUES (87, '1.0.1', 'RemoveUnusedTables', 'SQL', 'V1.0.1__RemoveUnusedTables.sql', 1654604915, 'cef', '2021-11-17 14:56:35.962687', 26, true);
INSERT INTO public.schema_version_cef VALUES (88, '1.0.2', 'UpdateFacilityState', 'SQL', 'V1.0.2__UpdateFacilityState.sql', -2044716779, 'cef', '2021-11-17 14:56:36.003779', 10, true);
INSERT INTO public.schema_version_cef VALUES (89, '1.0.3', 'CreatePropertiesTable', 'SQL', 'V1.0.3__CreatePropertiesTable.sql', 1669275598, 'cef', '2021-11-17 14:56:36.017954', 59, true);
INSERT INTO public.schema_version_cef VALUES (90, '1.0.4', 'UpdateReleasePointDescription', 'SQL', 'V1.0.4__UpdateReleasePointDescription.sql', -1442547969, 'cef', '2021-11-17 14:56:36.080953', 0, true);
INSERT INTO public.schema_version_cef VALUES (91, '1.0.5', 'AddSccUpdateTaskProperties', 'SQL', 'V1.0.5__AddSccUpdateTaskProperties.sql', -2007031982, 'cef', '2021-11-17 14:56:36.085438', 1, true);
INSERT INTO public.schema_version_cef VALUES (92, '1.0.6', 'AddVirusScannerProperties', 'SQL', 'V1.0.6__AddVirusScannerProperties.sql', 36698341, 'cef', '2021-11-17 14:56:36.091957', 1, true);
INSERT INTO public.schema_version_cef VALUES (93, '1.0.7', 'UserFeedback', 'SQL', 'V1.0.7__UserFeedback.sql', -2090293259, 'cef', '2021-11-17 14:56:36.096837', 67, true);
INSERT INTO public.schema_version_cef VALUES (94, '1.0.8', 'AddBulkEntryProperties', 'SQL', 'V1.0.8__AddBulkEntryProperties.sql', -1548573657, 'cef', '2021-11-17 14:56:36.168253', 0, true);
INSERT INTO public.schema_version_cef VALUES (95, '1.0.9', 'AddUserFeedbackProperties', 'SQL', 'V1.0.9__AddUserFeedbackProperties.sql', -739135534, 'cef', '2021-11-17 14:56:36.172098', 0, true);
INSERT INTO public.schema_version_cef VALUES (96, '1.0.10', 'AddAnnouncementBannerProperties', 'SQL', 'V1.0.10__AddAnnouncementBannerProperties.sql', 953099734, 'cef', '2021-11-17 14:56:36.178849', 49, true);
INSERT INTO public.schema_version_cef VALUES (97, '1.0.11', 'UpdateReportDownloadView4', 'SQL', 'V1.0.11__UpdateReportDownloadView4.sql', -951478020, 'cef', '2021-11-17 14:56:36.237197', 16, true);
INSERT INTO public.schema_version_cef VALUES (98, '1.0.12', 'UpdateReportDownloadView5', 'SQL', 'V1.0.12__UpdateReportDownloadView5.sql', 1743137572, 'cef', '2021-11-17 14:56:36.260467', 5, true);
INSERT INTO public.schema_version_cef VALUES (99, '1.0.13', 'AddReportAttachment', 'SQL', 'V1.0.13__AddReportAttachment.sql', 1934589647, 'cef', '2021-11-17 14:56:36.269911', 84, true);
INSERT INTO public.schema_version_cef VALUES (100, '1.0.14', 'UpdateHistoryFileNameLength', 'SQL', 'V1.0.14__UpdateHistoryFileNameLength.sql', 306995748, 'cef', '2021-11-17 14:56:36.358521', 1, true);
INSERT INTO public.schema_version_cef VALUES (101, '1.0.15', 'UpdateEmissionsReport', 'SQL', 'V1.0.15__UpdateEmissionsReport.sql', -584450493, 'cef', '2021-11-17 14:56:36.363944', 1, true);
INSERT INTO public.schema_version_cef VALUES (102, '1.0.16', 'UpdateReportDownloadView6', 'SQL', 'V1.0.16__UpdateReportDownloadView6.sql', 1082267998, 'cef', '2021-11-17 14:56:36.369503', 12, true);
INSERT INTO public.schema_version_cef VALUES (103, '1.0.17', 'AddAdminEmailProperties', 'SQL', 'V1.0.17__AddAdminEmailProperties.sql', 1323726369, 'cef', '2021-11-17 14:56:36.385782', 1, true);
INSERT INTO public.schema_version_cef VALUES (104, '1.0.18', 'UpdateReportDownloadView7', 'SQL', 'V1.0.18__UpdateReportDownloadView7.sql', -1906892539, 'cef', '2021-11-17 14:56:36.390236', 13, true);
INSERT INTO public.schema_version_cef VALUES (105, '1.0.19', 'Update SubmissionReviewDashboardView', 'SQL', 'V1.0.19__Update_SubmissionReviewDashboardView.sql', 1242718241, 'cef', '2021-11-17 14:56:36.408686', 7, true);
INSERT INTO public.schema_version_cef VALUES (106, '1.0.20', 'AddPollutantLastInventoryYear', 'SQL', 'V1.0.20__AddPollutantLastInventoryYear.sql', 17840022, 'cef', '2021-11-17 14:56:36.420357', 25, true);
INSERT INTO public.schema_version_cef VALUES (107, '1.0.21', 'AddEisFieldsToEmissionsReport', 'SQL', 'V1.0.21__AddEisFieldsToEmissionsReport.sql', 93537921, 'cef', '2021-11-17 14:56:36.449357', 4, true);
INSERT INTO public.schema_version_cef VALUES (108, '1.0.22', 'AddTriEisXref UpdateTRIView', 'SQL', 'V1.0.22__AddTriEisXref_UpdateTRIView.sql', 1021125719, 'cef', '2021-11-17 14:56:36.456513', 1763, true);
INSERT INTO public.schema_version_cef VALUES (109, '1.0.23', 'AddLastInventoryYears', 'SQL', 'V1.0.23__AddLastInventoryYears.sql', 695529402, 'cef', '2021-11-17 14:56:38.226098', 142, true);
INSERT INTO public.schema_version_cef VALUES (110, '1.0.24', 'UpdateTRIWebService ConvertToTons', 'SQL', 'V1.0.24__UpdateTRIWebService_ConvertToTons.sql', -331181521, 'cef', '2021-11-17 14:56:38.373504', 15, true);
INSERT INTO public.schema_version_cef VALUES (111, '1.0.25', 'AddAETCLastInventoryYear', 'SQL', 'V1.0.25__AddAETCLastInventoryYear.sql', 1850640880, 'cef', '2021-11-17 14:56:38.392727', 549, true);
INSERT INTO public.schema_version_cef VALUES (112, '1.0.26', 'IncreaseEisTransactionIdSize', 'SQL', 'V1.0.26__IncreaseEisTransactionIdSize.sql', 409108661, 'cef', '2021-11-17 14:56:38.948416', 1, true);
INSERT INTO public.schema_version_cef VALUES (113, '1.0.27', 'AddReleasePointTypeLastInventoryYear', 'SQL', 'V1.0.27__AddReleasePointTypeLastInventoryYear.sql', 1363474424, 'cef', '2021-11-17 14:56:38.953375', 2, true);
INSERT INTO public.schema_version_cef VALUES (114, '1.0.28', 'AddFipsCountyCodeLastInventoryYear', 'SQL', 'V1.0.28__AddFipsCountyCodeLastInventoryYear.sql', -1044091860, 'cef', '2021-11-17 14:56:38.958823', 11, true);
INSERT INTO public.schema_version_cef VALUES (115, '1.0.29', 'UpdateReportEisStatus', 'SQL', 'V1.0.29__UpdateReportEisStatus.sql', -1171176345, 'cef', '2021-11-17 14:56:38.9741', 1, true);
INSERT INTO public.schema_version_cef VALUES (116, '1.0.30', 'UpdateCalcMethodControlIndicator', 'SQL', 'V1.0.30__UpdateCalcMethodControlIndicator.sql', -5393334, 'cef', '2021-11-17 14:56:38.978837', 1, true);
INSERT INTO public.schema_version_cef VALUES (117, '1.0.31', 'UpdateReportSummary EISPriorYear', 'SQL', 'V1.0.31__UpdateReportSummary_EISPriorYear.sql', -2030810292, 'cef', '2021-11-17 14:56:38.983043', 39, true);
INSERT INTO public.schema_version_cef VALUES (118, '1.0.32', 'AddIndexes PollutantCode EISid', 'SQL', 'V1.0.32__AddIndexes_PollutantCode_EISid.sql', -1118393240, 'cef', '2021-11-17 14:56:39.045982', 87, true);
INSERT INTO public.schema_version_cef VALUES (119, '1.0.33', 'AddFacilitySourceTypeCodeLastInventoryYear', 'SQL', 'V1.0.33__AddFacilitySourceTypeCodeLastInventoryYear.sql', -715232190, 'cef', '2021-11-17 14:56:39.136397', 2, true);
INSERT INTO public.schema_version_cef VALUES (120, '1.0.34', 'UoMEmissionUnitDesignCapacity', 'SQL', 'V1.0.34__UoMEmissionUnitDesignCapacity.sql', -1788237120, 'cef', '2021-11-17 14:56:39.142219', 4, true);
INSERT INTO public.schema_version_cef VALUES (121, '1.0.35', 'CreateEisHistoryTable', 'SQL', 'V1.0.35__CreateEisHistoryTable.sql', 1291726633, 'cef', '2021-11-17 14:56:39.149668', 98, true);
INSERT INTO public.schema_version_cef VALUES (182, '3.0.10', 'AddEnergyConversionTable', 'SQL', 'V3.0.10__AddEnergyConversionTable.sql', 414861237, 'cef', '2022-01-26 14:36:25.326404', 101, true);
INSERT INTO public.schema_version_cef VALUES (122, '1.0.36', 'UpdateEmissisionUnitDesignCapacityUoM', 'SQL', 'V1.0.36__UpdateEmissisionUnitDesignCapacityUoM.sql', -918904489, 'cef', '2021-11-17 14:56:39.252317', 1, true);
INSERT INTO public.schema_version_cef VALUES (123, '1.0.37', 'CreateEisTransactionAttachmentTable', 'SQL', 'V1.0.37__CreateEisTransactionAttachmentTable.sql', -1167637547, 'cef', '2021-11-17 14:56:39.257065', 103, true);
INSERT INTO public.schema_version_cef VALUES (124, '1.0.38', 'CreateSltConfigTable', 'SQL', 'V1.0.38__CreateSltConfigTable.sql', 545745863, 'cef', '2021-11-17 14:56:39.367496', 185, true);
INSERT INTO public.schema_version_cef VALUES (125, '1.0.39', 'UpdateReportDownloadView8', 'SQL', 'V1.0.39__UpdateReportDownloadView8.sql', -887597640, 'cef', '2021-11-17 14:56:39.561878', 24, true);
INSERT INTO public.schema_version_cef VALUES (126, '1.0.40', 'AddUserFeedbackReportView', 'SQL', 'V1.0.40__AddUserFeedbackReportView.sql', 1488335330, 'cef', '2021-11-17 14:56:39.593817', 200, true);
INSERT INTO public.schema_version_cef VALUES (127, '1.0.41', 'UpdatedUserFeedbackNullFields', 'SQL', 'V1.0.41__UpdatedUserFeedbackNullFields.sql', 153409159, 'cef', '2021-11-17 14:56:39.804232', 3, true);
INSERT INTO public.schema_version_cef VALUES (128, '1.0.42', 'AddExcelExportProperty', 'SQL', 'V1.0.42__AddExcelExportProperty.sql', -1236184831, 'cef', '2021-11-17 14:56:39.813402', 1, true);
INSERT INTO public.schema_version_cef VALUES (129, '1.0.43', 'UpdateReportDownloadView9', 'SQL', 'V1.0.43__UpdateReportDownloadView9.sql', 707246258, 'cef', '2021-11-17 14:56:39.818422', 13, true);
INSERT INTO public.schema_version_cef VALUES (130, '1.0.44', 'AddOperatingStatusFlags', 'SQL', 'V1.0.44__AddOperatingStatusFlags.sql', -1430702207, 'cef', '2021-11-17 14:56:39.837576', 4, true);
INSERT INTO public.schema_version_cef VALUES (131, '1.0.45', 'IncreasePrecisionToMatchEIS', 'SQL', 'V1.0.45__IncreasePrecisionToMatchEIS.sql', 1652685257, 'cef', '2021-11-17 14:56:39.845778', 397, true);
INSERT INTO public.schema_version_cef VALUES (132, '1.0.46', 'ReplaceAgencyCodeWithProgramSystemCode', 'SQL', 'V1.0.46__ReplaceAgencyCodeWithProgramSystemCode.sql', 2068569767, 'cef', '2021-11-17 14:56:40.256258', 20, true);
INSERT INTO public.schema_version_cef VALUES (133, '1.0.47', 'UpdateReportingPeriodNullFields', 'SQL', 'V1.0.47__UpdateReportingPeriodNullFields.sql', 778447373, 'cef', '2021-11-17 14:56:40.281816', 1, true);
INSERT INTO public.schema_version_cef VALUES (134, '1.0.48', 'AddFuelUseFields', 'SQL', 'V1.0.48__AddFuelUseFields.sql', -1267249335, 'cef', '2021-11-17 14:56:40.287478', 26, true);
INSERT INTO public.schema_version_cef VALUES (135, '1.0.49', 'CreateMasterFacilityRecordTable', 'SQL', 'V1.0.49__CreateMasterFacilityRecordTable.sql', 1043575544, 'cef', '2021-11-17 14:56:40.341478', 132, true);
INSERT INTO public.schema_version_cef VALUES (136, '1.0.50', 'AddFuelUseFlagToScc', 'SQL', 'V1.0.50__AddFuelUseFlagToScc.sql', -736350801, 'cef', '2021-11-17 14:56:40.481343', 122, true);
INSERT INTO public.schema_version_cef VALUES (137, '1.0.51', 'Add Stack Width Length UOM Code Columns', 'SQL', 'V1.0.51__Add_Stack_Width_Length_UOM_Code_Columns.sql', 1774717581, 'cef', '2021-11-17 14:56:40.608557', 29, true);
INSERT INTO public.schema_version_cef VALUES (138, '1.0.52', 'UpdateReferenceData', 'SQL', 'V1.0.52__UpdateReferenceData.sql', -1045693194, 'cef', '2021-11-17 14:56:40.641358', 32, true);
INSERT INTO public.schema_version_cef VALUES (139, '1.0.53', 'CreateUserFacilityAssociationTable', 'SQL', 'V1.0.53__CreateUserFacilityAssociationTable.sql', -5010323, 'cef', '2021-11-17 14:56:40.677306', 113, true);
INSERT INTO public.schema_version_cef VALUES (140, '1.0.54', 'Insert GADNR and DOEE Facilities', 'SQL', 'V1.0.54__Insert_GADNR_and_DOEE_Facilities.sql', -1817673843, 'cef', '2021-11-17 14:56:40.794656', 196, true);
INSERT INTO public.schema_version_cef VALUES (141, '1.0.55', 'Add Fuel Use Columns to Downloadable Report', 'SQL', 'V1.0.55__Add_Fuel_Use_Columns_to_Downloadable_Report.sql', 2083673340, 'cef', '2021-11-17 14:56:40.995403', 13, true);
INSERT INTO public.schema_version_cef VALUES (142, '1.0.56', 'Insert PIMA NELLCHD NEOPWD', 'SQL', 'V1.0.56__Insert_PIMA_NELLCHD_NEOPWD.sql', -1291961744, 'cef', '2021-11-17 14:56:41.012931', 94, true);
INSERT INTO public.schema_version_cef VALUES (143, '1.0.57', 'AddControlPathPollutant', 'SQL', 'V1.0.57__AddControlPathPollutant.sql', 591021599, 'cef', '2021-11-17 14:56:41.111421', 352, true);
INSERT INTO public.schema_version_cef VALUES (144, '1.0.58', 'UpdateControlAndPathFields', 'SQL', 'V1.0.58__UpdateControlAndPathFields.sql', -1653262583, 'cef', '2021-11-17 14:56:41.471625', 4, true);
INSERT INTO public.schema_version_cef VALUES (145, '1.0.59', 'UpdateUserFacilityAssociation', 'SQL', 'V1.0.59__UpdateUserFacilityAssociation.sql', 956951097, 'cef', '2021-11-17 14:56:41.47616', 157, true);
INSERT INTO public.schema_version_cef VALUES (146, '1.0.60', 'AddedFieldsToControls', 'SQL', 'V1.0.60__AddedFieldsToControls.sql', -65284151, 'cef', '2021-11-17 14:56:41.642809', 1, true);
INSERT INTO public.schema_version_cef VALUES (147, '1.0.61', 'Require Agency Facility ID', 'SQL', 'V1.0.61__Require_Agency_Facility_ID.sql', 232723680, 'cef', '2021-11-17 14:56:41.647784', 2, true);
INSERT INTO public.schema_version_cef VALUES (148, '1.0.62', 'RemoveFrsIdNonNull', 'SQL', 'V1.0.62__RemoveFrsIdNonNull.sql', -1397940804, 'cef', '2021-11-17 14:56:41.653599', 1, true);
INSERT INTO public.schema_version_cef VALUES (149, '1.0.63', 'FuelUseSccAndUom', 'SQL', 'V1.0.63__FuelUseSccAndUom.sql', -859434096, 'cef', '2021-11-17 14:56:41.659216', 241, true);
INSERT INTO public.schema_version_cef VALUES (150, '1.0.64', 'Insert RIDEM Facilities', 'SQL', 'V1.0.64__Insert_RIDEM_Facilities.sql', 1110212213, 'cef', '2021-11-17 14:56:41.906632', 293, true);
INSERT INTO public.schema_version_cef VALUES (151, '2.0.0', 'AddCersV2AdminProperty', 'SQL', 'V2.0.0__AddCersV2AdminProperty.sql', 200194510, 'cef', '2021-11-17 14:56:42.203102', 1, true);
INSERT INTO public.schema_version_cef VALUES (152, '2.0.1', 'RemoveFrsAndEisIdColumns', 'SQL', 'V2.0.1__RemoveFrsAndEisIdColumns.sql', 1063438574, 'cef', '2021-11-17 14:56:42.207428', 10, true);
INSERT INTO public.schema_version_cef VALUES (153, '2.0.2', 'AddControlDeviceStatusYear', 'SQL', 'V2.0.2__AddControlDeviceStatusYear.sql', -1800219835, 'cef', '2021-11-17 14:56:42.221788', 1, true);
INSERT INTO public.schema_version_cef VALUES (154, '2.0.3', 'UpdateSO2CAS', 'SQL', 'V2.0.3__UpdateSO2CAS.sql', 643063276, 'cef', '2021-11-17 14:56:42.226582', 1, true);
INSERT INTO public.schema_version_cef VALUES (155, '2.0.4', 'AddDefaultHeatContent', 'SQL', 'V2.0.4__AddDefaultHeatContent.sql', -1263770631, 'cef', '2021-11-17 14:56:42.231428', 8, true);
INSERT INTO public.schema_version_cef VALUES (156, '2.0.5', 'UpdateFuelMaterial', 'SQL', 'V2.0.5__UpdateFuelMaterial.sql', -74532963, 'cef', '2021-11-17 14:56:42.242578', 1, true);
INSERT INTO public.schema_version_cef VALUES (157, '2.0.6', 'AddUtePsc', 'SQL', 'V2.0.6__AddUtePsc.sql', -1239455618, 'cef', '2021-11-17 14:56:42.24674', 0, true);
INSERT INTO public.schema_version_cef VALUES (158, '2.0.7', 'AddReturnedReportFlag', 'SQL', 'V2.0.7__AddReturnedReportFlag.sql', 270104536, 'cef', '2021-11-17 14:56:42.249992', 1, true);
INSERT INTO public.schema_version_cef VALUES (159, '2.0.8', 'UpdateAdminProperties', 'SQL', 'V2.0.8__UpdateAdminProperties.sql', -806679267, 'cef', '2021-11-17 14:56:42.253668', 5, true);
INSERT INTO public.schema_version_cef VALUES (160, '2.0.9', 'CreateSLTPropertiesTable', 'SQL', 'V2.0.9__CreateSLTPropertiesTable.sql', 933195306, 'cef', '2021-11-17 14:56:42.261999', 55, true);
INSERT INTO public.schema_version_cef VALUES (161, '2.0.10', 'UpdateSLTPropertyText', 'SQL', 'V2.0.10__UpdateSLTPropertyText.sql', -480911694, 'cef', '2021-11-17 14:56:42.321145', 1, true);
INSERT INTO public.schema_version_cef VALUES (162, '2.0.11', 'ConvertNaicsTypeToString', 'SQL', 'V2.0.11__ConvertNaicsTypeToString.sql', 1072533108, 'cef', '2021-11-17 14:56:42.325995', 6, true);
INSERT INTO public.schema_version_cef VALUES (163, '2.0.12', 'MultipleNAICSForMasterFacilityRecord', 'SQL', 'V2.0.12__MultipleNAICSForMasterFacilityRecord.sql', -18133074, 'cef', '2021-11-17 14:56:42.336076', 178, true);
INSERT INTO public.schema_version_cef VALUES (164, '2.0.13', 'AddCromerrToReportHistory', 'SQL', 'V2.0.13__AddCromerrToReportHistory.sql', 1342355489, 'cef', '2021-11-17 14:56:42.522713', 2, true);
INSERT INTO public.schema_version_cef VALUES (165, '3.0.0', 'AddSLT NAICS Property', 'SQL', 'V3.0.0__AddSLT_NAICS_Property.sql', 1981560179, 'cef', '2021-11-17 14:56:42.53122', 5, true);
INSERT INTO public.schema_version_cef VALUES (166, '3.0.1', 'MigrateFacilitySiteInfoToMFR', 'SQL', 'V3.0.1__MigrateFacilitySiteInfoToMFR.sql', -417703348, 'cef', '2021-11-17 14:56:42.542685', 207, true);
INSERT INTO public.schema_version_cef VALUES (167, NULL, 'Coordinate Tolerance', 'SQL', 'R__Coordinate_Tolerance.sql', 653550579, 'cef', '2021-11-17 14:56:42.762856', 238, true);
INSERT INTO public.schema_version_cef VALUES (168, NULL, 'EIS TRI XREF', 'SQL', 'R__EIS_TRI_XREF.sql', -1800840572, 'cef', '2021-11-17 14:56:43.011279', 2775, true);
INSERT INTO public.schema_version_cef VALUES (169, NULL, 'Emission Factors', 'SQL', 'R__Emission_Factors.sql', -1234502954, 'cef', '2021-11-17 14:56:45.796746', 6858, true);
INSERT INTO public.schema_version_cef VALUES (170, NULL, 'VW EMISSIONS BY FACILITY AND CAS', 'SQL', 'R__VW_EMISSIONS_BY_FACILITY_AND_CAS.sql', -5402258, 'cef', '2021-11-17 14:56:52.667523', 15, true);
INSERT INTO public.schema_version_cef VALUES (171, NULL, 'VW REPORT DOWNLOAD', 'SQL', 'R__VW_REPORT_DOWNLOAD.sql', -1205925843, 'cef', '2021-11-17 14:56:52.687589', 18, true);
INSERT INTO public.schema_version_cef VALUES (172, NULL, 'VW REPORT SUMMARY', 'SQL', 'R__VW_REPORT_SUMMARY.sql', -2077841956, 'cef', '2021-11-17 14:56:52.710676', 40, true);
INSERT INTO public.schema_version_cef VALUES (173, NULL, 'VW SUBMISSIONS REVIEW DASHBOARD', 'SQL', 'R__VW_SUBMISSIONS_REVIEW_DASHBOARD.sql', -1447843201, 'cef', '2021-11-17 14:56:52.756421', 6, true);
INSERT INTO public.schema_version_cef VALUES (174, '3.0.2', 'AddSLTBannerProperty', 'SQL', 'V3.0.2__AddSLTBannerProperty.sql', -396047045, 'cef', '2022-01-26 14:36:20.018059', 109, true);
INSERT INTO public.schema_version_cef VALUES (175, '3.0.3', 'UpdateFugitiveReleasePointDim', 'SQL', 'V3.0.3__UpdateFugitiveReleasePointDim.sql', 1560929333, 'cef', '2022-01-26 14:36:20.157531', 891, true);
INSERT INTO public.schema_version_cef VALUES (176, '3.0.4', 'CombineFuelUseAndPointSourceSccTable', 'SQL', 'V3.0.4__CombineFuelUseAndPointSourceSccTable.sql', -755214492, 'cef', '2022-01-26 14:36:21.082615', 3868, true);
INSERT INTO public.schema_version_cef VALUES (177, '3.0.5', 'AddReportAttachmentFileTypesProperties', 'SQL', 'V3.0.5__AddReportAttachmentFileTypesProperties.sql', -504297150, 'cef', '2022-01-26 14:36:24.986115', 88, true);
INSERT INTO public.schema_version_cef VALUES (178, '3.0.6', 'UpdateFugitiveReleasePointTypes', 'SQL', 'V3.0.6__UpdateFugitiveReleasePointTypes.sql', -1176099430, 'cef', '2022-01-26 14:36:25.08542', 12, true);
INSERT INTO public.schema_version_cef VALUES (179, '3.0.7', 'AlterReportAttachmentFileTypesPropertiesForCSV', 'SQL', 'V3.0.7__AlterReportAttachmentFileTypesPropertiesForCSV.sql', 405510893, 'cef', '2022-01-26 14:36:25.110064', 2, true);
INSERT INTO public.schema_version_cef VALUES (180, '3.0.8', 'AddCommunicationsForEmailNotifications', 'SQL', 'V3.0.8__AddCommunicationsForEmailNotifications.sql', -1773418389, 'cef', '2022-01-26 14:36:25.117903', 142, true);
INSERT INTO public.schema_version_cef VALUES (181, '3.0.9', 'AddPreviousYearStatusCodes', 'SQL', 'V3.0.9__AddPreviousYearStatusCodes.sql', -526429602, 'cef', '2022-01-26 14:36:25.270219', 50, true);
INSERT INTO public.schema_version_cef VALUES (183, '3.0.11', 'AddEmailStatusToCommunication', 'SQL', 'V3.0.11__AddEmailStatusToCommunication.sql', -1723272298, 'cef', '2022-01-26 14:36:25.434028', 1, true);
INSERT INTO public.schema_version_cef VALUES (184, '3.0.12', 'AddSLTPropDisableEmail', 'SQL', 'V3.0.12__AddSLTPropDisableEmail.sql', 1080681881, 'cef', '2022-01-26 14:36:25.596531', 14, true);
INSERT INTO public.schema_version_cef VALUES (185, '3.0.13', 'RemoveConversionFactorNotNullConstraint', 'SQL', 'V3.0.13__RemoveConversionFactorNotNullConstraint.sql', 1563810556, 'cef', '2022-01-26 14:36:25.614253', 1, true);
INSERT INTO public.schema_version_cef VALUES (186, '3.0.14', 'AddSLT GADNR Threshold Property', 'SQL', 'V3.0.14__AddSLT_GADNR_Threshold_Property.sql', 799910651, 'cef', '2022-01-26 14:36:25.61863', 1, true);
INSERT INTO public.schema_version_cef VALUES (187, '3.0.15', 'AddSLTPropEnableMonthlyReporting', 'SQL', 'V3.0.15__AddSLTPropEnableMonthlyReporting.sql', 847254890, 'cef', '2022-01-26 14:36:25.623465', 78, true);
INSERT INTO public.schema_version_cef VALUES (188, '3.0.16', 'UpdateMonthlyReportingSccAndFuelMaterial', 'SQL', 'V3.0.16__UpdateMonthlyReportingSccAndFuelMaterial.sql', -459713878, 'cef', '2022-01-26 14:36:25.711625', 36, true);
INSERT INTO public.schema_version_cef VALUES (189, '3.0.17', 'AddMidYearSubmissionStatus', 'SQL', 'V3.0.17__AddMidYearSubmissionStatus.sql', -125185413, 'cef', '2022-01-26 14:36:25.75474', 1, true);
INSERT INTO public.schema_version_cef VALUES (190, '3.0.18', 'RemoveMonthlyReportingUnusedColumns', 'SQL', 'V3.0.18__RemoveMonthlyReportingUnusedColumns.sql', -838695421, 'cef', '2022-01-26 14:36:25.760929', 10, true);
INSERT INTO public.schema_version_cef VALUES (191, '3.0.19', 'UpdateHeatContentColumnSizeAndData', 'SQL', 'V3.0.19__UpdateHeatContentColumnSizeAndData.sql', -1417875197, 'cef', '2022-01-26 14:36:25.817072', 138, true);
INSERT INTO public.schema_version_cef VALUES (192, '3.0.20', 'UpdateRemoveMonthlyStatusNotStarted', 'SQL', 'V3.0.20__UpdateRemoveMonthlyStatusNotStarted.sql', -1480623047, 'cef', '2022-01-26 14:36:25.963184', 3, true);
INSERT INTO public.schema_version_cef VALUES (193, '3.0.21', 'RemoveCtrlPathDescrpNotNullConstraint', 'SQL', 'V3.0.21__RemoveCtrlPathDescrpNotNullConstraint.sql', 1269296200, 'cef', '2022-01-26 14:36:25.971324', 1, true);
INSERT INTO public.schema_version_cef VALUES (194, '3.0.22', 'FY21ReferenceDataUpdates', 'SQL', 'V3.0.22__FY21ReferenceDataUpdates.sql', -1547755182, 'cef', '2022-01-26 14:36:25.977153', 1276, true);
INSERT INTO public.schema_version_cef VALUES (195, '3.0.23', 'AddRevokedToEmissionFactor', 'SQL', 'V3.0.23__AddRevokedToEmissionFactor.sql', 1625571759, 'cef', '2022-01-26 14:36:27.257565', 1, true);
INSERT INTO public.schema_version_cef VALUES (196, '3.0.24', 'UpdateReleasePointTypeCodeDesc', 'SQL', 'V3.0.24__UpdateReleasePointTypeCodeDesc.sql', 1513269267, 'cef', '2022-01-26 14:36:27.263004', 1, true);
INSERT INTO public.schema_version_cef VALUES (197, '3.0.25', 'UpdateGasHeatContentDenominators', 'SQL', 'V3.0.25__UpdateGasHeatContentDenominators.sql', 18790194, 'cef', '2022-01-26 14:36:27.267768', 2, true);
INSERT INTO public.schema_version_cef VALUES (198, '3.0.26', 'RenameAltSiteIdentifier', 'SQL', 'V3.0.26__RenameAltSiteIdentifier.sql', -1349383761, 'cef', '2022-01-26 14:36:27.273728', 1, true);
INSERT INTO public.schema_version_cef VALUES (199, NULL, 'Coordinate Tolerance', 'SQL', 'R__Coordinate_Tolerance.sql', -15408053, 'cef', '2022-01-26 14:36:27.278938', 472, true);
INSERT INTO public.schema_version_cef VALUES (200, NULL, 'VW REPORT DOWNLOAD', 'SQL', 'R__VW_REPORT_DOWNLOAD.sql', -823058539, 'cef', '2022-01-26 14:36:27.762666', 82, true);
INSERT INTO public.schema_version_cef VALUES (201, NULL, 'VW SUBMISSIONS REVIEW DASHBOARD', 'SQL', 'R__VW_SUBMISSIONS_REVIEW_DASHBOARD.sql', -1716740252, 'cef', '2022-01-26 14:36:27.855438', 15, true);


-- Completed on 2024-02-12 15:03:21

--
-- PostgreSQL database dump complete
--

