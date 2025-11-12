prompt --application/shared_components/user_interface/lovs/fuentes_posibles
begin
--   Manifest
--     FUENTES_POSIBLES
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.10'
,p_default_workspace_id=>7231611737995830
,p_default_application_id=>102
,p_default_id_offset=>0
,p_default_owner=>'WKSP_CURSO'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(17840568429088319)
,p_lov_name=>'FUENTES_POSIBLES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name, id',
'from FANTASY_SUPPLIER',
'WHERE NVL(CLOSED,0) = 0',
'order by id'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'ID'
,p_display_column_name=>'NAME'
,p_group_sort_direction=>'ASC'
,p_default_sort_direction=>'ASC'
,p_version_scn=>39290631913153
);
wwv_flow_imp.component_end;
end;
/
