prompt --application/shared_components/user_interface/lovs/posiciones_base_jugador
begin
--   Manifest
--     POSICIONES_BASE_JUGADOR
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
 p_id=>wwv_flow_imp.id(18750571970104694)
,p_lov_name=>'POSICIONES_BASE_JUGADOR'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'FANTASY_POSITION_BASE'
,p_return_column_name=>'ID'
,p_display_column_name=>'POSITION'
,p_default_sort_column_name=>'POSITION'
,p_default_sort_direction=>'ASC'
);
wwv_flow_imp.component_end;
end;
/
