prompt --application/shared_components/logic/application_items/id_temporada_actual
begin
--   Manifest
--     APPLICATION ITEM: ID_TEMPORADA_ACTUAL
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.04.12'
,p_release=>'22.1.6'
,p_default_workspace_id=>7231611737995830
,p_default_application_id=>102
,p_default_id_offset=>0
,p_default_owner=>'WKSP_CURSO'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(17435613877129032)
,p_name=>'ID_TEMPORADA_ACTUAL'
,p_protection_level=>'I'
);
wwv_flow_imp.component_end;
end;
/
