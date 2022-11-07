prompt --application/shared_components/user_interface/lovs/puntuacion_proveedor
begin
--   Manifest
--     PUNTUACION_PROVEEDOR
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.04.12'
,p_release=>'22.1.6'
,p_default_workspace_id=>7231611737995830
,p_default_application_id=>102
,p_default_id_offset=>0
,p_default_owner=>'WKSP_CURSO'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(18340823008868820)
,p_lov_name=>'PUNTUACION_PROVEEDOR'
,p_lov_query=>'.'||wwv_flow_imp.id(18340823008868820)||'.'
,p_location=>'STATIC'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(18341106087868821)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'0'
,p_lov_return_value=>'0'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(18341554807868822)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'5'
,p_lov_return_value=>'5'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(18341984122868822)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'10'
,p_lov_return_value=>'10'
);
wwv_flow_imp.component_end;
end;
/
