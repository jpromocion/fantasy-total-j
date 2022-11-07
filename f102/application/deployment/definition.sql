prompt --application/deployment/definition
begin
--   Manifest
--     INSTALL: 102
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.04.12'
,p_release=>'22.1.6'
,p_default_workspace_id=>7231611737995830
,p_default_application_id=>102
,p_default_id_offset=>0
,p_default_owner=>'WKSP_CURSO'
);
wwv_flow_imp_shared.create_install(
 p_id=>wwv_flow_imp.id(17317298307119342)
,p_required_free_kb=>100
,p_required_sys_privs=>'CREATE PROCEDURE:CREATE SEQUENCE:CREATE TABLE:CREATE TRIGGER:CREATE VIEW'
,p_required_names_available=>'FANTASY_PLAYER:FANTASY_PLAYER_BIU:FANTASY_POINT:FANTASY_POINT_BIU:FANTASY_POSITION:FANTASY_POSITION_BIU:FANTASY_PROYECTION:FANTASY_PROYECTION_BIU:FANTASY_SEASON:FANTASY_SEASON_BIU:FANTASY_SUPPLIER:FANTASY_SUPPLIER_BIU:FANTASY_TEAM:FANTASY_TEAM_BIU:FA'
||'NTASY_VALUE:FANTASY_VALUE_BIU'
);
wwv_flow_imp.component_end;
end;
/
