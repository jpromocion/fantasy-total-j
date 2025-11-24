prompt --application/shared_components/user_interface/lovs/tipo_long_term
begin
--   Manifest
--     TIPO_LONG_TERM
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
 p_id=>wwv_flow_imp.id(37635882126431468)
,p_lov_name=>'TIPO_LONG_TERM'
,p_lov_query=>'.'||wwv_flow_imp.id(37635882126431468)||'.'
,p_location=>'STATIC'
,p_version_scn=>39293846310560
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(37636119628431468)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Dynasty'
,p_lov_return_value=>'DYN'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(37636596923431469)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Resto de temporada'
,p_lov_return_value=>'ROS'
);
wwv_flow_imp.component_end;
end;
/
