prompt --application/shared_components/user_interface/lovs/equipos_fantasy
begin
--   Manifest
--     EQUIPOS_FANTASY
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.5'
,p_default_workspace_id=>7231611737995830
,p_default_application_id=>102
,p_default_id_offset=>0
,p_default_owner=>'WKSP_CURSO'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(18465272704229490)
,p_lov_name=>'EQUIPOS_FANTASY'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT workteam as display, id as value',
'FROM FANTASY_WORKTEAM',
'order by id asc'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'VALUE'
,p_display_column_name=>'DISPLAY'
);
wwv_flow_imp.component_end;
end;
/
