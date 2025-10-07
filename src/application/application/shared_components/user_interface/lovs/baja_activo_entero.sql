prompt --application/shared_components/user_interface/lovs/baja_activo_entero
begin
--   Manifest
--     BAJA_ACTIVO_ENTERO
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.9'
,p_default_workspace_id=>7231611737995830
,p_default_application_id=>102
,p_default_id_offset=>0
,p_default_owner=>'WKSP_CURSO'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(32329477478208410)
,p_lov_name=>'BAJA_ACTIVO_ENTERO'
,p_lov_query=>'.'||wwv_flow_imp.id(32329477478208410)||'.'
,p_location=>'STATIC'
,p_version_scn=>39290631713860
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(32329793557208418)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Activa'
,p_lov_return_value=>'0'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(32330135798208420)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Baja'
,p_lov_return_value=>'1'
);
wwv_flow_imp.component_end;
end;
/
