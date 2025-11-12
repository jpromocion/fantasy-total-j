prompt --application/deployment/install/install_delta_2_4_sql
begin
--   Manifest
--     INSTALL: INSTALL-delta_2.4.sql
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.10'
,p_default_workspace_id=>7231611737995830
,p_default_application_id=>102
,p_default_id_offset=>0
,p_default_owner=>'WKSP_CURSO'
);
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(32328351204188981)
,p_install_id=>wwv_flow_imp.id(17317298307119342)
,p_name=>'delta_2.4.sql'
,p_sequence=>60
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'alter table FANTASY_SUPPLIER add closed number(1,0) default 0',
'/'))
);
wwv_flow_imp.component_end;
end;
/
