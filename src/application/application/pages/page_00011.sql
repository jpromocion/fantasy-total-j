prompt --application/pages/page_00011
begin
--   Manifest
--     PAGE: 00011
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.5'
,p_default_workspace_id=>7231611737995830
,p_default_application_id=>102
,p_default_id_offset=>0
,p_default_owner=>'WKSP_CURSO'
);
wwv_flow_imp_page.create_page(
 p_id=>11
,p_name=>'Equipos NFL'
,p_alias=>'EQUIPOS-NFL'
,p_step_title=>'Equipos NFL'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'23'
,p_last_updated_by=>'JORTRI'
,p_last_upd_yyyymmddhh24miss=>'20221107100632'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(17733187085807358)
,p_plug_name=>'Equipos NFL'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(17040854231935129)
,p_plug_display_sequence=>10
,p_query_type=>'TABLE'
,p_query_table=>'FANTASY_TEAM'
,p_query_order_by_type=>'ITEM'
,p_query_order_by=>'{ "itemName": "P11_ORDER_BY", "orderBys": [{"key":"CITY","expr":"\"CITY\" asc"},{"key":"TEAM","expr":"\"TEAM\" asc"}]}'
,p_include_rowid_column=>false
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(17733631536807359)
,p_region_id=>wwv_flow_imp.id(17733187085807358)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>false
,p_title_column_name=>'CITY'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'TEAM'
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
,p_media_source_type=>'STATIC_URL'
,p_media_url=>'&URLLOGO.'
,p_media_display_position=>'BODY'
,p_media_sizing=>'FIT'
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(16358497546525132)
,p_card_id=>wwv_flow_imp.id(17733631536807359)
,p_action_type=>'BUTTON'
,p_position=>'PRIMARY'
,p_display_sequence=>10
,p_label=>'Editar'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.::P12_ID:&ID.'
,p_button_display_type=>'TEXT'
,p_is_hot=>true
,p_authorization_scheme=>wwv_flow_imp.id(17195882813935255)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(17807308801858767)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(17733187085807358)
,p_button_name=>'Crear'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(17167082771935205)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_redirect_url=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:12::'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_security_scheme=>wwv_flow_imp.id(17195882813935255)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17734149457807360)
,p_name=>'P11_ORDER_BY'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(17733187085807358)
,p_item_display_point=>'ORDER_BY_ITEM'
,p_item_default=>'CITY'
,p_prompt=>'Order By'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Ciudad;CITY,Nombre equipo;TEAM'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(17164567568935201)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(17808505665873175)
,p_name=>'Editar - Dialog Closed - Refrescar'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(17733187085807358)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(17808900914873177)
,p_event_id=>wwv_flow_imp.id(17808505665873175)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(17733187085807358)
);
wwv_flow_imp.component_end;
end;
/
