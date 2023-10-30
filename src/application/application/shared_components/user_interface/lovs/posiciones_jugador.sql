prompt --application/shared_components/user_interface/lovs/posiciones_jugador
begin
--   Manifest
--     POSICIONES_JUGADOR
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
 p_id=>wwv_flow_imp.id(17575011258357878)
,p_lov_name=>'POSICIONES_JUGADOR'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT position, id',
'FROM FANTASY_POSITION',
'ORDER BY visualorder'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_use_local_sync_table=>false
,p_query_table=>'FANTASY_POSITION'
,p_return_column_name=>'ID'
,p_display_column_name=>'POSITION'
,p_group_sort_direction=>'ASC'
,p_default_sort_direction=>'ASC'
);
wwv_flow_imp.component_end;
end;
/
