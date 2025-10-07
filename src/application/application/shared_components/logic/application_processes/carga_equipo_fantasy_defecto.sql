prompt --application/shared_components/logic/application_processes/carga_equipo_fantasy_defecto
begin
--   Manifest
--     APPLICATION PROCESS: CARGA_EQUIPO_FANTASY_DEFECTO
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
 p_id=>wwv_flow_imp.id(18479248548339990)
,p_process_sequence=>2
,p_process_point=>'AFTER_LOGIN'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CARGA_EQUIPO_FANTASY_DEFECTO'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'  SELECT id, WORKTEAM',
'  INTO :ID_EQUIPO_FANTASY_INICIO, :EQUIPO_FANTASY_INICIO',
'  FROM FANTASY_WORKTEAM',
'  ORDER BY ID',
'  FETCH FIRST 1 ROW ONLY;',
'',
'EXCEPTION',
'   WHEN NO_DATA_FOUND THEN',
'      :ID_EQUIPO_FANTASY_INICIO := NULL;',
'      :EQUIPO_FANTASY_INICIO := NULL;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_version_scn=>1
);
wwv_flow_imp.component_end;
end;
/
