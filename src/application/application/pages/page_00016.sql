prompt --application/pages/page_00016
begin
--   Manifest
--     PAGE: 00016
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
 p_id=>16
,p_name=>'Puntos Fantasy'
,p_alias=>'PUNTOS-FANTASY'
,p_step_title=>'Puntos Fantasy'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'21'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(18178191623255392)
,p_plug_name=>'Puntos Fantasy'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>40
,p_query_type=>'TABLE'
,p_query_table=>'FANTASY_POINT'
,p_query_where=>wwv_flow_string.join(wwv_flow_t_varchar2(
'idfantasyseason = :P16_TEMPORADA',
'and IDFANTASYWORKTEAM = :P16_EQUIPOFANTASY',
'and week = :P16_SEMANA'))
,p_include_rowid_column=>false
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P16_TEMPORADA,P16_SEMANA,P16_EQUIPOFANTASY'
,p_prn_page_header=>'Puntos Fantasy'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(18179483714255393)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'enable_multi_select', 'Y',
  'hide_control', 'N',
  'show_select_all', 'Y')).to_clob
,p_enable_hide=>true
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(18179995852255393)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_label=>'Actions'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_enable_hide=>true
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(18180964010255395)
,p_name=>'ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_enable_filter=>false
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(18181924015255395)
,p_name=>'IDFANTASYSEASON'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDFANTASYSEASON'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Temporada'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(17566710244272327)
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(18182995133255396)
,p_name=>'WEEK'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WEEK'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_AUTO_COMPLETE'
,p_heading=>'Week'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'fetch_on_type', 'N',
  'match_type', 'EXACT_CASE')).to_clob
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(17843189527123159)
,p_lov_display_extra=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(18183924829255397)
,p_name=>'IDFANTASYPLAYER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDFANTASYPLAYER'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Jugador'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name as display, id as value',
'from FANTASY_PLAYER',
'where idfantasyseason = :IDFANTASYSEASON',
'  and IDFANTASYWORKTEAM = :IDFANTASYWORKTEAM',
'order by name'))
,p_lov_display_extra=>false
,p_lov_display_null=>true
,p_lov_cascade_parent_items=>'IDFANTASYSEASON,IDFANTASYWORKTEAM'
,p_ajax_items_to_submit=>'IDFANTASYSEASON,IDFANTASYWORKTEAM'
,p_ajax_optimize_refresh=>true
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(18184902648255397)
,p_name=>'FANTASYPOINTS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FANTASYPOINTS'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Puntos Fantasy'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
,p_stretch=>'A'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
,p_format_mask=>'FM990D90'
,p_item_width=>6
,p_item_placeholder=>'Puntos Fantasy Finales'
,p_is_required=>true
,p_max_length=>6
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(18185974311255398)
,p_name=>'CREATED'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATED'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(18186959192255398)
,p_name=>'CREATED_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATED_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(18187990625255399)
,p_name=>'UPDATED'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UPDATED'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(18188966375255400)
,p_name=>'UPDATED_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UPDATED_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(18467624908230823)
,p_name=>'IDFANTASYWORKTEAM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDFANTASYWORKTEAM'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Equipo Fantasy'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(18465272704229490)
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(18178653500255393)
,p_internal_uid=>18178653500255393
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_add_authorization_scheme=>wwv_flow_imp.id(17195882813935255)
,p_update_authorization_scheme=>wwv_flow_imp.id(17195882813935255)
,p_delete_authorization_scheme=>wwv_flow_imp.id(17195882813935255)
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
,p_submit_checked_rows=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(18179030820255393)
,p_interactive_grid_id=>wwv_flow_imp.id(18178653500255393)
,p_static_id=>'181791'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(18179297731255393)
,p_report_id=>wwv_flow_imp.id(18179030820255393)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(18180369418255394)
,p_view_id=>wwv_flow_imp.id(18179297731255393)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(18179995852255393)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>48.579999999999984
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(18181307920255395)
,p_view_id=>wwv_flow_imp.id(18179297731255393)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(18180964010255395)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(18182306657255396)
,p_view_id=>wwv_flow_imp.id(18179297731255393)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(18181924015255395)
,p_is_visible=>false
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(18183394489255396)
,p_view_id=>wwv_flow_imp.id(18179297731255393)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(18182995133255396)
,p_is_visible=>false
,p_is_frozen=>false
,p_sort_order=>2
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(18184310938255397)
,p_view_id=>wwv_flow_imp.id(18179297731255393)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(18183924829255397)
,p_is_visible=>true
,p_is_frozen=>false
,p_sort_order=>3
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(18185379455255397)
,p_view_id=>wwv_flow_imp.id(18179297731255393)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(18184902648255397)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(18186344592255398)
,p_view_id=>wwv_flow_imp.id(18179297731255393)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(18185974311255398)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(18187374673255399)
,p_view_id=>wwv_flow_imp.id(18179297731255393)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(18186959192255398)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(18188397083255399)
,p_view_id=>wwv_flow_imp.id(18179297731255393)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(18187990625255399)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(18189382842255400)
,p_view_id=>wwv_flow_imp.id(18179297731255393)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(18188966375255400)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(18506446323653070)
,p_view_id=>wwv_flow_imp.id(18179297731255393)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(18467624908230823)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18192203966277537)
,p_name=>'P16_TEMPORADA'
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
 p_id=>wwv_flow_imp.id(18503986023635814)
,p_name=>'P16_EQUIPOFANTASY'
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18638837992372835)
,p_name=>'P16_SEMANA'
,p_item_sequence=>30
,p_prompt=>'Semana'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'SEMANAS'
,p_lov=>'.'||wwv_flow_imp.id(17843189527123159)||'.'
,p_cHeight=>1
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(16359176523525139)
,p_computation_sequence=>10
,p_computation_item=>'P16_TEMPORADA'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'ID_TEMPORADA_ACTUAL'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(18467544919230822)
,p_computation_sequence=>20
,p_computation_item=>'P16_EQUIPOFANTASY'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'ID_EQUIPO_FANTASY_INICIO'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(33531898581593835)
,p_computation_sequence=>30
,p_computation_item=>'P16_SEMANA'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_language=>'PLSQL'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  week_ VARCHAR2(2);',
'BEGIN',
'',
'    SELECT to_char(nvl(max(po.week),1))',
'    INTO week_',
'    from FANTASY_POINT po',
'    where po.idfantasyseason = :P16_TEMPORADA',
'        and po.IDFANTASYWORKTEAM = :P16_EQUIPOFANTASY;',
'',
'    return week_;',
'END;'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(16359288446525140)
,p_name=>'Refrescar cambio temporada'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P16_TEMPORADA,P16_SEMANA,P16_EQUIPOFANTASY'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(16359375005525141)
,p_event_id=>wwv_flow_imp.id(16359288446525140)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(18178191623255392)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(18615773370059728)
,p_name=>'Primera entrada cargue'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18616102671059730)
,p_event_id=>wwv_flow_imp.id(18615773370059728)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(18178191623255392)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(18190744923255401)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(18178191623255392)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Puntos Fantasy - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>18190744923255401
);
wwv_flow_imp.component_end;
end;
/
