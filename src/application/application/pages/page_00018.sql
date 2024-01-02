prompt --application/pages/page_00018
begin
--   Manifest
--     PAGE: 00018
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
 p_id=>18
,p_name=>'Resumen Mensual'
,p_alias=>'RESUMEN-MENSUAL'
,p_step_title=>'Resumen Mensual'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
,p_last_updated_by=>'JORTRI'
,p_last_upd_yyyymmddhh24miss=>'20240102124834'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(36840528635767285)
,p_plug_name=>unistr('Puntuaci\00F3n en semana')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(17069367738935144)
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'Y'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(36790509410580618)
,p_plug_name=>'Resumen Semanal'
,p_parent_plug_id=>wwv_flow_imp.id(36840528635767285)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(17067238129935143)
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'  py.id as idfantasyproyection,',
'  po.id as idfantasypoint,',
'  PY.idfantasyseason,',
'  PY.IDFANTASYWORKTEAM,',
'  PY.week,',
'  PY.idfantasysupplier,',
'  SU.visualorder AS ORDENPROVEEDOR,',
'  PY.idfantasyposition,',
'  POS.visualorder AS ORDENPOSICION,',
'  PY.idfantasyplayer,',
'  pl.urlphoto AS URLFOTOJUGADOR,',
'  TM.city || '' '' || TM.team AS TEAM,',
'  TM.urllogo AS URLLOGOTEAM,',
'  NVL(PO.FANTASYPOINTS,0) as FANTASYPOINTS',
'FROM',
'  FANTASY_PROYECTION PY,',
'  FANTASY_POINT PO,',
'  FANTASY_POSITION POS,',
'  FANTASY_SUPPLIER SU,',
'  FANTASY_PLAYER PL,',
'  FANTASY_TEAM TM',
'WHERE PY.idfantasyseason = PO.idfantasyseason(+)',
'  AND PY.IDFANTASYWORKTEAM = PO.IDFANTASYWORKTEAM(+)',
'  AND PY.week = PO.week(+)',
'  AND PY.idfantasyplayer = PO.idfantasyplayer(+)',
'  AND PY.idfantasyposition = POS.id',
'  AND PY.idfantasysupplier = SU.id(+)',
'  AND PY.idfantasyplayer = PL.id(+)',
'  AND PL.idfantasyteam = TM.id(+)',
'  AND PY.idfantasyseason = :P18_TEMPORADA',
'  AND PY.IDFANTASYWORKTEAM = :P18_EQUIPOFANTASY',
'  AND PY.week = :P18_SEMANA'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P18_TEMPORADA,P18_SEMANA,P18_EQUIPOFANTASY'
,p_prn_page_header=>'Resumen Semanal'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(18467954666230826)
,p_name=>'IDFANTASYWORKTEAM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDFANTASYWORKTEAM'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Idfantasyworkteam'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>40
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'left'
,p_attribute_04=>'decimal'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(34924868415677515)
,p_name=>'IDFANTASYPOINT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDFANTASYPOINT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(34925005952677516)
,p_name=>'ORDENPROVEEDOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ORDENPROVEEDOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Ordenproveedor'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>70
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(34925103400677517)
,p_name=>'ORDENPOSICION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ORDENPOSICION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Ordenposicion'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_attribute_04=>'text'
,p_is_required=>true
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(34925162205677518)
,p_name=>'TEAM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TEAM'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Equipo'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>false
,p_max_length=>101
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(34925250906677519)
,p_name=>'URLLOGOTEAM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'URLLOGOTEAM'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_attribute_01=>'<img src="&URLLOGOTEAM." height="20" width="20"/>'
,p_link_target=>'URLLOGOTEAM'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(36791810686580619)
,p_name=>'IDFANTASYPROYECTION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDFANTASYPROYECTION'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
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
 p_id=>wwv_flow_imp.id(36792741971580621)
,p_name=>'IDFANTASYSEASON'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDFANTASYSEASON'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Temporada'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
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
,p_filter_exact_match=>true
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
 p_id=>wwv_flow_imp.id(36793814422580621)
,p_name=>'WEEK'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WEEK'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Week'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(17843189527123159)
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(36794795535580622)
,p_name=>'IDFANTASYSUPPLIER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDFANTASYSUPPLIER'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Proveedor'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(17840568429088319)
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(36795759918580623)
,p_name=>'IDFANTASYPOSITION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDFANTASYPOSITION'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('Posici\00F3n')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(17575011258357878)
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(36796775213580623)
,p_name=>'IDFANTASYPLAYER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDFANTASYPLAYER'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Jugador'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name as display, id as value',
'from FANTASY_PLAYER',
'where idfantasyseason = :P18_TEMPORADA',
'order by name'))
,p_lov_display_extra=>false
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
,p_enable_pivot=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(36797809722580624)
,p_name=>'FANTASYPOINTS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FANTASYPOINTS'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Puntos Fantasy'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>140
,p_value_alignment=>'RIGHT'
,p_attribute_03=>'right'
,p_attribute_04=>'text'
,p_format_mask=>'FM990D90'
,p_item_width=>6
,p_item_placeholder=>'Puntos Fantasy'
,p_is_required=>false
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
 p_id=>wwv_flow_imp.id(36839033432767270)
,p_name=>'URLFOTOJUGADOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'URLFOTOJUGADOR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attribute_01=>'<img src="&URLFOTOJUGADOR." height="20" width="20"/>'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(36791014996580619)
,p_internal_uid=>36791014996580619
,p_is_editable=>false
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
 p_id=>wwv_flow_imp.id(36791376823580619)
,p_interactive_grid_id=>wwv_flow_imp.id(36791014996580619)
,p_static_id=>'182264'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(36791547625580619)
,p_report_id=>wwv_flow_imp.id(36791376823580619)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(18518840866746787)
,p_view_id=>wwv_flow_imp.id(36791547625580619)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(18467954666230826)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(18570057043185996)
,p_view_id=>wwv_flow_imp.id(36791547625580619)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(34925005952677516)
,p_is_visible=>false
,p_is_frozen=>false
,p_sort_order=>3
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(18571333238185999)
,p_view_id=>wwv_flow_imp.id(36791547625580619)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(34925103400677517)
,p_is_visible=>false
,p_is_frozen=>false
,p_sort_order=>4
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(18572717225186003)
,p_view_id=>wwv_flow_imp.id(36791547625580619)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(34925162205677518)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(18576639323177635)
,p_view_id=>wwv_flow_imp.id(36791547625580619)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(36839033432767270)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>20
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(36792139376580620)
,p_view_id=>wwv_flow_imp.id(36791547625580619)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(36791810686580619)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(36793124166580621)
,p_view_id=>wwv_flow_imp.id(36791547625580619)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(36792741971580621)
,p_is_visible=>false
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(36794163186580622)
,p_view_id=>wwv_flow_imp.id(36791547625580619)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(36793814422580621)
,p_is_visible=>false
,p_is_frozen=>false
,p_sort_order=>2
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(36795138963580622)
,p_view_id=>wwv_flow_imp.id(36791547625580619)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(36794795535580622)
,p_is_visible=>false
,p_is_frozen=>false
,p_break_order=>5
,p_break_is_enabled=>true
,p_break_sort_direction=>'ASC'
,p_break_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(36796213135580623)
,p_view_id=>wwv_flow_imp.id(36791547625580619)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(36795759918580623)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(36797169960580624)
,p_view_id=>wwv_flow_imp.id(36791547625580619)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(36796775213580623)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(36798128267580625)
,p_view_id=>wwv_flow_imp.id(36791547625580619)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(36797809722580624)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(36803601384648899)
,p_view_id=>wwv_flow_imp.id(36791547625580619)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(34924868415677515)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(36831566064728777)
,p_view_id=>wwv_flow_imp.id(36791547625580619)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(34925250906677519)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>20
);
wwv_flow_imp_page.create_ig_report_aggregate(
 p_id=>wwv_flow_imp.id(429949000002)
,p_view_id=>wwv_flow_imp.id(36791547625580619)
,p_function=>'SUM'
,p_column_id=>wwv_flow_imp.id(36797809722580624)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(36840623463767286)
,p_plug_name=>'Proveedor (puntuaciones)'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(17069367738935144)
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(36839191417767271)
,p_plug_name=>'Ya asignados'
,p_parent_plug_id=>wwv_flow_imp.id(36840623463767286)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(17067238129935143)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'  va.id,',
'  va.idfantasyseason,',
'  va.IDFANTASYWORKTEAM,',
'  va.week,',
'  va.idfantasysupplier,',
'  su.name as namesupplier,',
'  va.winpoint,',
'  ''Delete'' Del',
'FROM FANTASY_VALUE va,',
'  FANTASY_SUPPLIER su',
'where va.idfantasysupplier = su.id',
'  and va.idfantasyseason = :P18_TEMPORADA',
'  and va.IDFANTASYWORKTEAM = :P18_EQUIPOFANTASY',
'  and va.week = :P18_SEMANA',
'order by va.idfantasyseason, va.IDFANTASYWORKTEAM, va.week, su.visualorder'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P18_TEMPORADA,P18_SEMANA,P18_EQUIPOFANTASY'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Ya asignados'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(18472747002716406)
,p_max_row_count=>'1000000'
,p_allow_save_rpt_public=>'Y'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link_text=>'<img src="#APEX_FILES#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_allow_exclude_null_values=>'N'
,p_allow_hide_extra_columns=>'N'
,p_owner=>'JORTRI'
,p_internal_uid=>18472747002716406
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18472875924716407)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18472970615716408)
,p_db_column_name=>'IDFANTASYSEASON'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Idfantasyseason'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18467835581230825)
,p_db_column_name=>'IDFANTASYWORKTEAM'
,p_display_order=>30
,p_column_identifier=>'H'
,p_column_label=>'Idfantasyworkteam'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18473006411716409)
,p_db_column_name=>'WEEK'
,p_display_order=>40
,p_column_identifier=>'C'
,p_column_label=>'Week'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18473163617716410)
,p_db_column_name=>'IDFANTASYSUPPLIER'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>'Idfantasysupplier'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18473236382716411)
,p_db_column_name=>'NAMESUPPLIER'
,p_display_order=>60
,p_column_identifier=>'E'
,p_column_label=>'Namesupplier'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18473341426716412)
,p_db_column_name=>'WINPOINT'
,p_display_order=>70
,p_column_identifier=>'F'
,p_column_label=>'Winpoint'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18473431876716413)
,p_db_column_name=>'DEL'
,p_display_order=>80
,p_column_identifier=>'G'
,p_column_label=>'Borrar'
,p_column_link=>'javascript:void(null);'
,p_column_linktext=>'<span class="t-Icon fa fa-trash delete-irrow" aria-hidden="true"></span>'
,p_column_link_attr=>'data-id=#ID#'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_security_scheme=>wwv_flow_imp.id(17195882813935255)
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(18694257208644077)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'186943'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DEL:NAMESUPPLIER:WINPOINT:'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(18813546688510843)
,p_report_id=>wwv_flow_imp.id(18694257208644077)
,p_name=>'Mayor Puntuacion'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'WINPOINT'
,p_operator=>'='
,p_expr=>'10'
,p_condition_sql=>' (case when ("WINPOINT" = to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = #APXWS_EXPR_NUMBER#  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#2ae800'
,p_row_font_color=>'#ffffff'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(18813916553510843)
,p_report_id=>wwv_flow_imp.id(18694257208644077)
,p_name=>'Media Puntuacion'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'WINPOINT'
,p_operator=>'='
,p_expr=>'5'
,p_condition_sql=>' (case when ("WINPOINT" = to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = #APXWS_EXPR_NUMBER#  '
,p_enabled=>'Y'
,p_highlight_sequence=>20
,p_row_bg_color=>'#e1bc00'
,p_row_font_color=>'#ffffff'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(18813188414510842)
,p_report_id=>wwv_flow_imp.id(18694257208644077)
,p_name=>unistr('Menor puntuaci\00F3n')
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'WINPOINT'
,p_operator=>'='
,p_expr=>'0'
,p_condition_sql=>' (case when ("WINPOINT" = to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = #APXWS_EXPR_NUMBER#  '
,p_enabled=>'Y'
,p_highlight_sequence=>30
,p_row_bg_color=>'#f90101'
,p_row_font_color=>'#ffffff'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(36840722845767287)
,p_plug_name=>'Insertar'
,p_parent_plug_id=>wwv_flow_imp.id(36840623463767286)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(17069367738935144)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(37037477226868772)
,p_plug_name=>'Regiones'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(17069367738935144)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_attribute_01=>'STANDARD'
,p_attribute_02=>'N'
,p_attribute_03=>'SESSION'
,p_attribute_04=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(18575865393152429)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(36840722845767287)
,p_button_name=>'Cargar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(17167082771935205)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cargar'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(17195882813935255)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18473512679716414)
,p_name=>'P18_ID_BORRADO'
,p_item_sequence=>60
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18512655015724336)
,p_name=>'P18_EQUIPOFANTASY'
,p_item_sequence=>40
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
 p_id=>wwv_flow_imp.id(18522837972770453)
,p_name=>'P18_EQUIPOFANTASY_PRECARGA'
,p_item_sequence=>30
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'Y'
,p_item_comment=>'Al precargar como hace submit... se carga los combos de nuevo... utilizamos este valor para dejar guardado el de antes de la precarga de forma que vuelva a cargarse los del mismo equipo fantasy'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18576202072152429)
,p_name=>'P18_PUNTUACION_CARGA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(36840722845767287)
,p_prompt=>'Puntuacion Carga'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PUNTUACION_PROVEEDOR'
,p_lov=>'.'||wwv_flow_imp.id(18340823008868820)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(17164567568935201)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18576656524152431)
,p_name=>'P18_PROVEEDOR_CARGA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(36840722845767287)
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
,p_attribute_05=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18577312389152440)
,p_name=>'P18_TEMPORADA'
,p_item_sequence=>20
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
 p_id=>wwv_flow_imp.id(18577746134152440)
,p_name=>'P18_SEMANA'
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
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(18578219194152441)
,p_computation_sequence=>10
,p_computation_item=>'P18_TEMPORADA'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'ID_TEMPORADA_ACTUAL'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(18467730066230824)
,p_computation_sequence=>20
,p_computation_item=>'P18_EQUIPOFANTASY'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_language=>'PLSQL'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    devolver NUMBER;',
'BEGIN',
'    IF :P18_EQUIPOFANTASY_PRECARGA IS NULL THEN',
'        RETURN :ID_EQUIPO_FANTASY_INICIO;',
'    ELSE',
'        devolver := :P18_EQUIPOFANTASY_PRECARGA;',
'        :P18_EQUIPOFANTASY_PRECARGA := NULL;',
'        RETURN devolver;',
'    END IF;',
'END;'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(18579835934152447)
,p_name=>'Refrescar semanal cambio temporada semana'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P18_TEMPORADA,P18_SEMANA,P18_EQUIPOFANTASY'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18580375009152447)
,p_event_id=>wwv_flow_imp.id(18579835934152447)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(36790509410580618)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(18578955454152443)
,p_name=>'Refrescar proveedor cambio temporada semana'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P18_TEMPORADA,P18_SEMANA,P18_EQUIPOFANTASY'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp.component_end;
end;
/
begin
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.5'
,p_default_workspace_id=>7231611737995830
,p_default_application_id=>102
,p_default_id_offset=>0
,p_default_owner=>'WKSP_CURSO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18579400477152446)
,p_event_id=>wwv_flow_imp.id(18578955454152443)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(36839191417767271)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(18473640532716415)
,p_name=>'DA_DELETEROW'
,p_event_sequence=>30
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'.delete-irrow'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18473721402716416)
,p_event_id=>wwv_flow_imp.id(18473640532716415)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CONFIRM'
,p_attribute_01=>unistr('\00BFEstas seguro de querer borrar?')
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18473842667716417)
,p_event_id=>wwv_flow_imp.id(18473640532716415)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P18_ID_BORRADO'
,p_attribute_01=>'JAVASCRIPT_EXPRESSION'
,p_attribute_05=>'$(this.triggeringElement).parent().data(''id'')'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18474005099716419)
,p_event_id=>wwv_flow_imp.id(18473640532716415)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Delete from FANTASY_VALUE where id = :P18_ID_BORRADO;',
'COMMIT;'))
,p_attribute_02=>'P18_ID_BORRADO'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18474181632716420)
,p_event_id=>wwv_flow_imp.id(18473640532716415)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(36839191417767271)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(18578555673152442)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Puntuacion Proveedor'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'INSERT INTO FANTASY_VALUE(',
'  idfantasyseason,',
'  week,',
'  idfantasysupplier,',
'  winpoint,',
'  IDFANTASYWORKTEAM)',
'VALUES(',
'  :P18_TEMPORADA,',
'  :P18_SEMANA,',
'  :P18_PROVEEDOR_CARGA,',
'  :P18_PUNTUACION_CARGA,',
'  :P18_EQUIPOFANTASY);',
'',
':P18_EQUIPOFANTASY_PRECARGA := :P18_EQUIPOFANTASY;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>unistr('Error al cargar puntuaci\00F3n al proveedor')
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(18575865393152429)
,p_process_when=>':P18_PROVEEDOR_CARGA IS NOT NULL AND :P18_PUNTUACION_CARGA IS NOT NULL'
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
,p_process_success_message=>unistr('Puntuaci\00F3n proveedor cargada')
,p_internal_uid=>18578555673152442
);
wwv_flow_imp.component_end;
end;
/
