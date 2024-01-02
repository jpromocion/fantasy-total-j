prompt --application/shared_components/logic/application_items/id_equipo_fantasy_inicio
begin
--   Manifest
--     APPLICATION ITEM: ID_EQUIPO_FANTASY_INICIO
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.5'
,p_default_workspace_id=>7231611737995830
,p_default_application_id=>102
,p_default_id_offset=>0
,p_default_owner=>'WKSP_CURSO'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(18478990734317870)
,p_name=>'ID_EQUIPO_FANTASY_INICIO'
,p_protection_level=>'I'
);
wwv_flow_imp.component_end;
end;
/
