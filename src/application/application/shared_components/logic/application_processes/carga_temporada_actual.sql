prompt --application/shared_components/logic/application_processes/carga_temporada_actual
begin
--   Manifest
--     APPLICATION PROCESS: CARGA_TEMPORADA_ACTUAL
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.9'
,p_default_workspace_id=>7231611737995830
,p_default_application_id=>102
,p_default_id_offset=>0
,p_default_owner=>'WKSP_CURSO'
);
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(17435459437127434)
,p_process_sequence=>1
,p_process_point=>'AFTER_LOGIN'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CARGA_TEMPORADA_ACTUAL'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'  SELECT id, season',
'  INTO :ID_TEMPORADA_ACTUAL, :TEMPORADA_ACTUAL',
'  FROM FANTASY_SEASON',
'  WHERE season = (SELECT MAX(season) FROM FANTASY_SEASON);',
'',
'EXCEPTION ',
'   WHEN NO_DATA_FOUND THEN',
'      :TEMPORADA_ACTUAL := NULL;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
