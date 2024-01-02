prompt --application/pages/page_00015
begin
--   Manifest
--     PAGE: 00015
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
 p_id=>15
,p_name=>'Proyecciones'
,p_alias=>'PROYECCIONES'
,p_step_title=>'Proyecciones'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'21'
,p_last_updated_by=>'JORTRI'
,p_last_upd_yyyymmddhh24miss=>'20240102123710'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(17818958079020011)
,p_plug_name=>'Proyecciones'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(17067238129935143)
,p_plug_display_sequence=>60
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  pr.ID,',
'  pr.IDFANTASYSEASON,',
'  pr.IDFANTASYWORKTEAM,',
'  pr.WEEK,',
'  pr.IDFANTASYSUPPLIER,',
'  pr.IDFANTASYPOSITION,',
'  pr.IDFANTASYPLAYER,',
'  pr.CREATED,',
'  pr.CREATED_BY,',
'  pr.UPDATED,',
'  pr.UPDATED_BY,  ',
'  (select su.VISUALORDER from FANTASY_SUPPLIER su where su.id = pr.IDFANTASYSUPPLIER) as VISUALORDERPAGINA,',
'  (select pos.VISUALORDER from FANTASY_POSITION pos where pos.id = pr.IDFANTASYPOSITION) as VISUALORDERPLAYER',
'from FANTASY_PROYECTION pr',
'where pr.idfantasyseason = :P15_TEMPORADA',
'  and pr.IDFANTASYWORKTEAM = :P15_EQUIPOFANTASY',
'  and pr.week = :P15_SEMANA'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P15_TEMPORADA,P15_SEMANA,P15_EQUIPOFANTASY'
,p_prn_page_header=>'Proyecciones'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(17820270728020013)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(17820738288020014)
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
 p_id=>wwv_flow_imp.id(17821747948020016)
,p_name=>'ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attribute_01=>'Y'
,p_enable_filter=>false
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(17822757129020017)
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
 p_id=>wwv_flow_imp.id(17823752784020018)
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
,p_attribute_01=>'EXACT_CASE'
,p_attribute_04=>'N'
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
 p_id=>wwv_flow_imp.id(17824718850020018)
,p_name=>'IDFANTASYSUPPLIER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDFANTASYSUPPLIER'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>unistr('P\00E1gina')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
,p_attribute_04=>'N'
,p_attribute_05=>'Y'
,p_attribute_06=>'0'
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(17840568429088319)
,p_lov_display_extra=>false
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
 p_id=>wwv_flow_imp.id(17825741421020019)
,p_name=>'IDFANTASYPOSITION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDFANTASYPOSITION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>unistr('Posici\00F3n')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
,p_attribute_04=>'N'
,p_attribute_05=>'Y'
,p_attribute_06=>'0'
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(17575011258357878)
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
 p_id=>wwv_flow_imp.id(17826722033020019)
,p_name=>'IDFANTASYPLAYER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDFANTASYPLAYER'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Jugador'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
,p_attribute_04=>'N'
,p_attribute_05=>'Y'
,p_attribute_06=>'0'
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
 p_id=>wwv_flow_imp.id(17827796843020020)
,p_name=>'CREATED'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATED'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(17828752996020021)
,p_name=>'CREATED_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATED_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(17829787024020021)
,p_name=>'UPDATED'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UPDATED'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(17830705779020022)
,p_name=>'UPDATED_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UPDATED_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>150
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(18467358660230820)
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
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(18472566352716404)
,p_name=>'VISUALORDERPLAYER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VISUALORDERPLAYER'
,p_data_type=>'NUMBER'
,p_is_query_only=>true
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Orden posicion'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>110
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_attribute_04=>'text'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(18472686673716405)
,p_name=>'VISUALORDERPAGINA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VISUALORDERPAGINA'
,p_data_type=>'NUMBER'
,p_is_query_only=>true
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>unistr('Orden p\00E1gina')
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_attribute_04=>'text'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(17819461123020012)
,p_internal_uid=>17819461123020012
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
,p_no_data_found_message=>'No hay filas'
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
 p_id=>wwv_flow_imp.id(17819821878020012)
,p_interactive_grid_id=>wwv_flow_imp.id(17819461123020012)
,p_static_id=>'178199'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(17820064601020013)
,p_report_id=>wwv_flow_imp.id(17819821878020012)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(17821104551020015)
,p_view_id=>wwv_flow_imp.id(17820064601020013)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(17820738288020014)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>70.15100000000001
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(17822171937020017)
,p_view_id=>wwv_flow_imp.id(17820064601020013)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(17821747948020016)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(17823182072020017)
,p_view_id=>wwv_flow_imp.id(17820064601020013)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(17822757129020017)
,p_is_visible=>false
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(17824111841020018)
,p_view_id=>wwv_flow_imp.id(17820064601020013)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(17823752784020018)
,p_is_visible=>false
,p_is_frozen=>false
,p_sort_order=>2
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(17825191835020018)
,p_view_id=>wwv_flow_imp.id(17820064601020013)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(17824718850020018)
,p_is_visible=>true
,p_is_frozen=>false
,p_break_order=>15
,p_break_is_enabled=>true
,p_break_sort_direction=>'ASC'
,p_break_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(17826187064020019)
,p_view_id=>wwv_flow_imp.id(17820064601020013)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(17825741421020019)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(17827132338020020)
,p_view_id=>wwv_flow_imp.id(17820064601020013)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(17826722033020019)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(17828121257020020)
,p_view_id=>wwv_flow_imp.id(17820064601020013)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(17827796843020020)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(17829146149020021)
,p_view_id=>wwv_flow_imp.id(17820064601020013)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(17828752996020021)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(17830170551020021)
,p_view_id=>wwv_flow_imp.id(17820064601020013)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(17829787024020021)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(17831101090020022)
,p_view_id=>wwv_flow_imp.id(17820064601020013)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(17830705779020022)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(18490373693534670)
,p_view_id=>wwv_flow_imp.id(17820064601020013)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(18467358660230820)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(18599933877315509)
,p_view_id=>wwv_flow_imp.id(17820064601020013)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(18472566352716404)
,p_is_visible=>false
,p_is_frozen=>false
,p_sort_order=>4
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(18651388518446174)
,p_view_id=>wwv_flow_imp.id(17820064601020013)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(18472686673716405)
,p_is_visible=>false
,p_is_frozen=>false
,p_sort_order=>3
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(20203257081424104)
,p_plug_name=>'Pre-carga'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(17069367738935144)
,p_plug_display_sequence=>70
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(20203496017424106)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(20203257081424104)
,p_button_name=>'PreCargaPosicion'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(17167082771935205)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Pre Cargar'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17835142557029110)
,p_name=>'P15_TEMPORADA'
,p_item_sequence=>10
,p_prompt=>'Temporada'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'TEMPORADAS_EXISTENTES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT season as display, id as value',
'FROM FANTASY_SEASON',
'order by season desc'))
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(17164567568935201)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18467433558230821)
,p_name=>'P15_EQUIPOFANTASY_PRECARGA'
,p_item_sequence=>20
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'Y'
,p_item_comment=>'Al precargar como hace submit... se carga los combos de nuevo... utilizamos este valor para dejar guardado el de antes de la precarga de forma que vuelva a cargarse los del mismo equipo fantasy'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18487437064518397)
,p_name=>'P15_EQUIPOFANTASY'
,p_item_sequence=>30
,p_prompt=>'Equipo Fantasy'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'EQUIPOS_FANTASY'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT workteam as display, id as value',
'FROM FANTASY_WORKTEAM',
'order by id asc'))
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(17164567568935201)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18620025279339033)
,p_name=>'P15_SEMANA'
,p_item_sequence=>50
,p_prompt=>'Semana'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'SEMANAS'
,p_lov=>'.'||wwv_flow_imp.id(17843189527123159)||'.'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(17164567568935201)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20203373414424105)
,p_name=>'P15_PROVEEDOR_CARGA'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(20203257081424104)
,p_prompt=>'Proveedor Carga'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'FUENTES_POSIBLES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name, id',
'from FANTASY_SUPPLIER',
'order by id'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(17164567568935201)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'POPUP'
,p_attribute_02=>'FIRST_ROWSET'
,p_attribute_03=>'N'
,p_attribute_04=>'N'
,p_attribute_05=>'Y'
,p_attribute_06=>'0'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(18191709825270202)
,p_computation_sequence=>10
,p_computation_item=>'P15_TEMPORADA'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'ID_TEMPORADA_ACTUAL'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(18467276091230819)
,p_computation_sequence=>20
,p_computation_item=>'P15_EQUIPOFANTASY'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_language=>'PLSQL'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    devolver NUMBER;',
'BEGIN',
'    IF :P15_EQUIPOFANTASY_PRECARGA IS NULL THEN',
'        RETURN :ID_EQUIPO_FANTASY_INICIO;',
'    ELSE',
'        devolver := :P15_EQUIPOFANTASY_PRECARGA;',
'        :P15_EQUIPOFANTASY_PRECARGA := NULL;',
'        RETURN devolver;',
'    END IF;',
'END;'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(17835390594036050)
,p_name=>'Refrescar cambio temporada'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P15_TEMPORADA,P15_SEMANA,P15_EQUIPOFANTASY'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(17835771966036050)
,p_event_id=>wwv_flow_imp.id(17835390594036050)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(17818958079020011)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(17834271932020025)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(17818958079020011)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Proyecciones - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>17834271932020025
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(20203558098424107)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Precarga posiciones proveedor'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE    ',
'    idJugadorFijo_  FANTASY_PLAYER.ID%TYPE;',
'',
'    CURSOR cPosiciones IS ',
'        SELECT ID, POSITION, NAME, VISUALORDER',
'        FROM FANTASY_POSITION',
'        ORDER BY VISUALORDER;',
'BEGIN',
'    --Cogemos un jugador cualquiera para insertarlo fijo, dado que es obligatorio',
'    SELECT MIN(ID)',
'    INTO idJugadorFijo_',
'    FROM FANTASY_PLAYER',
'    WHERE IDFANTASYSEASON = :P15_TEMPORADA',
'      and IDFANTASYWORKTEAM = :P15_EQUIPOFANTASY;',
'',
'    <<recorrePosiciones>>',
'    FOR rPosiciones IN cPosiciones LOOP',
'        INSERT INTO FANTASY_PROYECTION(',
'                IDFANTASYSEASON,',
'                WEEK,',
'                IDFANTASYSUPPLIER,',
'                IDFANTASYPOSITION,',
'                IDFANTASYPLAYER,',
'                IDFANTASYWORKTEAM)',
'        VALUES(',
'                :P15_TEMPORADA,',
'                :P15_SEMANA,',
'                :P15_PROVEEDOR_CARGA,',
'                rPosiciones.ID,',
'                idJugadorFijo_,',
'                :P15_EQUIPOFANTASY',
'        );',
'    END LOOP recorrePosiciones;',
'',
'    :P15_EQUIPOFANTASY_PRECARGA := :P15_EQUIPOFANTASY;',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'Ha sucedido un error al precargar posiciones sobre el proveedor'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(20203496017424106)
,p_process_when=>'P15_PROVEEDOR_CARGA'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
,p_process_success_message=>'Posiciones al proveedor pre-cargadas'
,p_internal_uid=>20203558098424107
);
wwv_flow_imp.component_end;
end;
/
