prompt --application/shared_components/user_interface/lovs/temporadas_existentes
begin
--   Manifest
--     TEMPORADAS_EXISTENTES
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.1'
,p_default_workspace_id=>7231611737995830
,p_default_application_id=>102
,p_default_id_offset=>0
,p_default_owner=>'WKSP_CURSO'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(17566710244272327)
,p_lov_name=>'TEMPORADAS_EXISTENTES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT season as display, id as value',
'FROM FANTASY_SEASON',
'order by season desc'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'VALUE'
,p_display_column_name=>'DISPLAY'
);
wwv_flow_imp.component_end;
end;
/
