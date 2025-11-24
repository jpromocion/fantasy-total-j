prompt --application/shared_components/user_interface/lovs/sino_y_n
begin
--   Manifest
--     SINO_Y_N
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
 p_id=>wwv_flow_imp.id(37634575323422066)
,p_lov_name=>'SINO_Y_N'
,p_lov_query=>'.'||wwv_flow_imp.id(37634575323422066)||'.'
,p_location=>'STATIC'
,p_version_scn=>39293846234805
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(37634836416422067)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Si'
,p_lov_return_value=>'Y'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(37635219602422068)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'No'
,p_lov_return_value=>'N'
);
wwv_flow_imp.component_end;
end;
/
