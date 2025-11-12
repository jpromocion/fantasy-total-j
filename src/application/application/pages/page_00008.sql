prompt --application/pages/page_00008
begin
--   Manifest
--     PAGE: 00008
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.10'
,p_default_workspace_id=>7231611737995830
,p_default_application_id=>102
,p_default_id_offset=>0
,p_default_owner=>'WKSP_CURSO'
);
wwv_flow_imp_page.create_page(
 p_id=>8
,p_name=>'Jugadores temporada'
,p_alias=>'JUGADORES-TEMPORADA'
,p_step_title=>'Jugadores temporada'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'23'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(17563816962252532)
,p_plug_name=>'Jugadores temporada'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>30
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    p.ID,',
'    p.IDFANTASYSEASON,',
'    p.IDFANTASYWORKTEAM,',
'    p.NAME,',
'    p.IDFANTASYPOSITIONBASE,',
'    po.position as FANTASYPOSITION,',
'    decode(po.position,''QB'',1,''RB'',2,''WR'',3,''TE'',4,5) as FANTASYPOSITIONORDEN,',
'    p.CREATED,',
'    p.CREATED_BY,',
'    p.UPDATED,',
'    p.UPDATED_BY,',
'    p.URLPHOTO,',
'    p.idfantasyteam,',
'    t.city || '' '' || t.team as teamfull,',
'    t.urllogo as urllogoteam',
' from FANTASY_PLAYER p,',
'    FANTASY_POSITION_BASE po,',
'    FANTASY_TEAM t',
' where p.IDFANTASYPOSITIONBASE = po.id',
'    and p.idfantasyteam = t.id(+)',
'    and p.idfantasyseason = :P8_TEMPORADA',
'    and p.IDFANTASYWORKTEAM = :P8_EQUIPOFANTASY'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_ajax_items_to_submit=>'P8_TEMPORADA,P8_EQUIPOFANTASY'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(17564386355252534)
,p_region_id=>wwv_flow_imp.id(17563816962252532)
,p_layout_type=>'GRID'
,p_title_adv_formatting=>false
,p_title_column_name=>'NAME'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'FANTASYPOSITION'
,p_body_adv_formatting=>false
,p_body_column_name=>'TEAMFULL'
,p_second_body_adv_formatting=>false
,p_icon_source_type=>'URL'
,p_icon_image_url=>'&URLLOGOTEAM.'
,p_icon_position=>'START'
,p_media_adv_formatting=>false
,p_media_source_type=>'STATIC_URL'
,p_media_url=>'&URLPHOTO.'
,p_media_display_position=>'BODY'
,p_media_sizing=>'FIT'
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(16357510238525123)
,p_card_id=>wwv_flow_imp.id(17564386355252534)
,p_action_type=>'BUTTON'
,p_position=>'PRIMARY'
,p_display_sequence=>10
,p_label=>'Editar'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.::P9_ID:&ID.'
,p_button_display_type=>'TEXT'
,p_is_hot=>true
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(16357377417525121)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(17563816962252532)
,p_button_name=>'Crear'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_redirect_url=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.::P9_IDFANTASYSEASON,P9_IDFANTASYWORKTEAM:&P8_TEMPORADA.,&P8_EQUIPOFANTASY.'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(16356545679525113)
,p_name=>'P8_TEMPORADA'
,p_item_sequence=>10
,p_prompt=>'Temporada'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'TEMPORADAS_EXISTENTES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT season as display, id as value',
'FROM FANTASY_SEASON',
'order by season desc'))
,p_cHeight=>1
,p_display_when=>'1=0'
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
,p_item_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'OLD: Antes cambiamos temporada/equipo en cada pantalla.',
'-Ahora la seleccionamos en el HOME con los combos y fijamos las variables globales con ese valor para todas las pantalals -> por eso los pusimos Read Only.',
unistr('-Pero es que adem\00E1s ahora tenemos el panel del breadcrumb bar en el global para verse en todas las paginas, con los datos actualizados con el seleccionado de temporada/equipo -> por eso directamente ocultamos los campos siempre con una server side co')
||'ndition siempre falsa (no los borramos por dejarlos por si algun dia del futuro queremos cambiar algo... pero vamos, ya no sirven para nada)'))
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17564857656252536)
,p_name=>'P8_ORDER_BY'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(17563816962252532)
,p_item_display_point=>'ORDER_BY_ITEM'
,p_item_default=>'NAME'
,p_prompt=>unistr('Ordenaci\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>unistr('STATIC2:Nombre;NAME,Posici\00F3n;FANTASYPOSITIONORDEN')
,p_cHeight=>1
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18475735286304844)
,p_name=>'P8_EQUIPOFANTASY'
,p_item_sequence=>20
,p_prompt=>'Equipo Fantasy'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'EQUIPOS_FANTASY'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT workteam as display, id as value',
'FROM FANTASY_WORKTEAM',
'order by id asc'))
,p_cHeight=>1
,p_display_when=>'1=0'
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
,p_item_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'OLD: Antes cambiamos temporada/equipo en cada pantalla.',
'-Ahora la seleccionamos en el HOME con los combos y fijamos las variables globales con ese valor para todas las pantalals -> por eso los pusimos Read Only.',
unistr('-Pero es que adem\00E1s ahora tenemos el panel del breadcrumb bar en el global para verse en todas las paginas, con los datos actualizados con el seleccionado de temporada/equipo -> por eso directamente ocultamos los campos siempre con una server side co')
||'ndition siempre falsa (no los borramos por dejarlos por si algun dia del futuro queremos cambiar algo... pero vamos, ya no sirven para nada)'))
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(16356776380525115)
,p_computation_sequence=>10
,p_computation_item=>'P8_TEMPORADA'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'ID_TEMPORADA_ACTUAL'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(18466864983230815)
,p_computation_sequence=>20
,p_computation_item=>'P8_EQUIPOFANTASY'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'ID_EQUIPO_FANTASY_INICIO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(16358214988525130)
,p_name=>'Editar - Dialog Closed - Refrescar'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(17563816962252532)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(16358386625525131)
,p_event_id=>wwv_flow_imp.id(16358214988525130)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(17563816962252532)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(16357661272525124)
,p_name=>'Refrescar cambio temporada'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P8_TEMPORADA,P8_EQUIPOFANTASY'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(16357737414525125)
,p_event_id=>wwv_flow_imp.id(16357661272525124)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(17563816962252532)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
