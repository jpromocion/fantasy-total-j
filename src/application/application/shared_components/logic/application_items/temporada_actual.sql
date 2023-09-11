prompt --application/shared_components/logic/application_items/temporada_actual
begin
--   Manifest
--     APPLICATION ITEM: TEMPORADA_ACTUAL
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.2'
,p_default_workspace_id=>7231611737995830
,p_default_application_id=>102
,p_default_id_offset=>0
,p_default_owner=>'WKSP_CURSO'
);
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(17435026397109395)
,p_name=>'TEMPORADA_ACTUAL'
,p_protection_level=>'I'
,p_item_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Fijaremos a la entrada del login del usuario la mayor temporada actual guardada.',
'Sera con la que se trabaje por defecto'))
);
wwv_flow_imp.component_end;
end;
/
