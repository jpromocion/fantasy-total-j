prompt --application/pages/page_00030
begin
--   Manifest
--     PAGE: 00030
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
 p_id=>30
,p_name=>'Proyecciones ROS'
,p_alias=>'PROYECCIONES-ROS'
,p_step_title=>'Proyecciones ROS'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.negrita{',
'    font-weight: bold;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'21'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(37730165231194045)
,p_plug_name=>'tab-proyecciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_location=>null
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'include_show_all', 'N',
  'rds_mode', 'STANDARD',
  'remember_selection', 'SESSION')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(75377886198619160)
,p_plug_name=>'Proyecciones ROS'
,p_title=>'Proyecciones Rest Of Season'
,p_parent_plug_id=>wwv_flow_imp.id(37730165231194045)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    pr.ID,',
'    pr.TYPE_LONG_TERM,',
'    pr.date_done,',
'    pr.IDFANTASYSEASON,',
'    pr.IDFANTASYWORKTEAM,',
'    pr.IDFANTASYSUPPLIER,',
'    pr.IDFANTASYPOSITIONBASE,',
'    pr.RANKING,',
'    pr.PLAYER_NAME,',
'    pr.ALIAS_TEAM,',
'    pr.VALUE,',
'    pr.ISOWNED,',
'    pr.CREATED,',
'    pr.CREATED_BY,',
'    pr.UPDATED,',
'    pr.UPDATED_BY, ',
'  (select su.VISUALORDER from FANTASY_SUPPLIER su where su.id = pr.IDFANTASYSUPPLIER) as VISUALORDERPAGINA,',
'  (select LPAD(SU.visualorder,2,''0'') || '' - '' || SU.NAME from FANTASY_SUPPLIER su where su.id = pr.IDFANTASYSUPPLIER) as VISUALORDERPAGINA_COMPLEO,',
'  (select pos.ID from FANTASY_POSITION_BASE pos where pos.id = pr.IDFANTASYPOSITIONBASE) as VISUALORDERPLAYER,    ',
'  (select LPAD(pos.ID,2,''0'') || '' - '' ||  pos.POSITION from FANTASY_POSITION_BASE pos where pos.id = pr.IDFANTASYPOSITIONBASE) as VISUALORDERPLAYER_COMPLETO   ',
'from FANTASY_PROYECTION_LONG_TERM pr',
'where pr.idfantasyseason = :P30_TEMPORADA',
'  and pr.IDFANTASYWORKTEAM = :P30_EQUIPOFANTASY  ',
'  and pr.date_done = :P30_FILTRO_FECHA',
'  and pr.TYPE_LONG_TERM = ''ROS'''))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P30_TEMPORADA,P30_EQUIPOFANTASY,P30_FILTRO_FECHA'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Proyecciones largo plazo'
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
,p_plug_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<p>Se aplica el filtro fecha anterior para obtener los resultados de un an\00E1lisis \00FAnicamente. Por defecto carga el valor del m\00E1s reciente al entrar. Los filtros proveedor/posici\00F3n dentro del IG, por defecto sin rellenar, nos permite acotar los resulta')
||'dos a demanda.</p>',
'<p>Proveedores ROS: fantasypros, fftoday, keeptradecut, profootballnetwork, rototrade, draftsharks, fantasylife, fantasysharks, dynastydaddy, adpddaddy, fantasynavigator, fantasycalc</p>'))
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(73453958820136044)
,p_name=>'VISUALORDERPAGINA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VISUALORDERPAGINA'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Visualorderpagina'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>210
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
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
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(73454111829136045)
,p_name=>'VISUALORDERPAGINA_COMPLEO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VISUALORDERPAGINA_COMPLEO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Prov.:'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>220
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>111
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(73454171421136046)
,p_name=>'VISUALORDERPLAYER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VISUALORDERPLAYER'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Visualorderplayer'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>230
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
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
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(73454271920136047)
,p_name=>'VISUALORDERPLAYER_COMPLETO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VISUALORDERPLAYER_COMPLETO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Pos:'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>240
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>16
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(75379214776619170)
,p_name=>'APEX$ROW_SELECTOR'
,p_session_state_data_type=>'VARCHAR2'
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
 p_id=>wwv_flow_imp.id(75379648961619171)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_label=>'Actions'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
,p_value_alignment=>'CENTER'
,p_enable_hide=>true
,p_is_primary_key=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(75380695845619174)
,p_name=>'ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(75381662840619177)
,p_name=>'TYPE_LONG_TERM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TYPE_LONG_TERM'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Tipo'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(37635882126431468)
,p_lov_display_extra=>false
,p_lov_display_null=>false
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
 p_id=>wwv_flow_imp.id(75382647288619178)
,p_name=>'IDFANTASYSEASON'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDFANTASYSEASON'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Temporada'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
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
 p_id=>wwv_flow_imp.id(75383662648619178)
,p_name=>'IDFANTASYWORKTEAM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDFANTASYWORKTEAM'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Equipo'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
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
 p_id=>wwv_flow_imp.id(75384721455619179)
,p_name=>'IDFANTASYSUPPLIER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDFANTASYSUPPLIER'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Proveedor'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
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
 p_id=>wwv_flow_imp.id(75385667914619179)
,p_name=>'IDFANTASYPOSITIONBASE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDFANTASYPOSITIONBASE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Posicion'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(18750571970104694)
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
 p_id=>wwv_flow_imp.id(75386707423619180)
,p_name=>'RANKING'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RANKING'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Ranking'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>120
,p_value_alignment=>'RIGHT'
,p_value_css_classes=>'negrita'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'99990'
,p_is_required=>false
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
 p_id=>wwv_flow_imp.id(75387709225619181)
,p_name=>'PLAYER_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PLAYER_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Jugador'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_value_css_classes=>'negrita'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
,p_max_length=>50
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
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
 p_id=>wwv_flow_imp.id(75388666531619181)
,p_name=>'ALIAS_TEAM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ALIAS_TEAM'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Equipo'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>140
,p_value_alignment=>'LEFT'
,p_value_css_classes=>'negrita'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
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
 p_id=>wwv_flow_imp.id(75389676214619182)
,p_name=>'VALUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VALUE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Valor'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>150
,p_value_alignment=>'RIGHT'
,p_value_css_classes=>'negrita'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999990D00'
,p_is_required=>false
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
 p_id=>wwv_flow_imp.id(75390709640619182)
,p_name=>'ISOWNED'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ISOWNED'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>unistr('\00BFPropietario?')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>160
,p_value_alignment=>'LEFT'
,p_value_css_classes=>'negrita'
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(37634575323422066)
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
 p_id=>wwv_flow_imp.id(75391681454619183)
,p_name=>'CREATED'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATED'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>170
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
 p_id=>wwv_flow_imp.id(75392722705619183)
,p_name=>'CREATED_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATED_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>180
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
 p_id=>wwv_flow_imp.id(75393664272619184)
,p_name=>'UPDATED'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UPDATED'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>190
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
 p_id=>wwv_flow_imp.id(75394717259619185)
,p_name=>'UPDATED_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UPDATED_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>200
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
 p_id=>wwv_flow_imp.id(75501837351478519)
,p_name=>'DATE_DONE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DATE_DONE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Fecha'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>250
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_format_mask=>'DD/MM/YYYY'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(75378352959619166)
,p_internal_uid=>75378352959619166
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
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
 p_id=>wwv_flow_imp.id(75378833307619167)
,p_interactive_grid_id=>wwv_flow_imp.id(75378352959619166)
,p_static_id=>'376036'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(75378945840619168)
,p_report_id=>wwv_flow_imp.id(75378833307619167)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(37872261003495264)
,p_view_id=>wwv_flow_imp.id(75378945840619168)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(75501837351478519)
,p_is_visible=>true
,p_is_frozen=>false
,p_sort_order=>2
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(75380052657619172)
,p_view_id=>wwv_flow_imp.id(75378945840619168)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(75379648961619171)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>75
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(75381125080619175)
,p_view_id=>wwv_flow_imp.id(75378945840619168)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(75380695845619174)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(75382091376619178)
,p_view_id=>wwv_flow_imp.id(75378945840619168)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(75381662840619177)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(75383097211619178)
,p_view_id=>wwv_flow_imp.id(75378945840619168)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(75382647288619178)
,p_is_visible=>false
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(75384109595619179)
,p_view_id=>wwv_flow_imp.id(75378945840619168)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(75383662648619178)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(75385058302619179)
,p_view_id=>wwv_flow_imp.id(75378945840619168)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(75384721455619179)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(75386120009619180)
,p_view_id=>wwv_flow_imp.id(75378945840619168)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(75385667914619179)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(75387132688619180)
,p_view_id=>wwv_flow_imp.id(75378945840619168)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(75386707423619180)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>167
,p_sort_order=>5
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(75388121142619181)
,p_view_id=>wwv_flow_imp.id(75378945840619168)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(75387709225619181)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(75389123893619181)
,p_view_id=>wwv_flow_imp.id(75378945840619168)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(75388666531619181)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>105
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(75390119707619182)
,p_view_id=>wwv_flow_imp.id(75378945840619168)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(75389676214619182)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(75391077325619182)
,p_view_id=>wwv_flow_imp.id(75378945840619168)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(75390709640619182)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(75392096119619183)
,p_view_id=>wwv_flow_imp.id(75378945840619168)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(75391681454619183)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(75393077088619184)
,p_view_id=>wwv_flow_imp.id(75378945840619168)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(75392722705619183)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(75394080139619184)
,p_view_id=>wwv_flow_imp.id(75378945840619168)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(75393664272619184)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(75395129546619185)
,p_view_id=>wwv_flow_imp.id(75378945840619168)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(75394717259619185)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(75412952180760956)
,p_view_id=>wwv_flow_imp.id(75378945840619168)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(73453958820136044)
,p_is_visible=>false
,p_is_frozen=>false
,p_sort_order=>3
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(75413903273760958)
,p_view_id=>wwv_flow_imp.id(75378945840619168)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(73454111829136045)
,p_is_visible=>false
,p_is_frozen=>false
,p_break_order=>5
,p_break_is_enabled=>true
,p_break_sort_direction=>'ASC'
,p_break_sort_nulls=>'FIRST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(75414801049760959)
,p_view_id=>wwv_flow_imp.id(75378945840619168)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(73454171421136046)
,p_is_visible=>false
,p_is_frozen=>false
,p_sort_order=>4
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(75419761801924526)
,p_view_id=>wwv_flow_imp.id(75378945840619168)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(73454271920136047)
,p_is_visible=>false
,p_is_frozen=>false
,p_break_order=>10
,p_break_is_enabled=>true
,p_break_sort_direction=>'ASC'
,p_break_sort_nulls=>'FIRST'
);
wwv_flow_imp_page.create_ig_report_highlight(
 p_id=>wwv_flow_imp.id(37775272130284511)
,p_view_id=>wwv_flow_imp.id(75378945840619168)
,p_execution_seq=>2.5
,p_name=>'No rankeados'
,p_background_color=>'#ffd6d2'
,p_text_color=>'#000000'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_imp.id(75386707423619180)
,p_condition_operator=>'N'
,p_condition_is_case_sensitive=>false
,p_is_enabled=>true
);
wwv_flow_imp_page.create_ig_report_highlight(
 p_id=>wwv_flow_imp.id(37775324300284510)
,p_view_id=>wwv_flow_imp.id(75378945840619168)
,p_execution_seq=>3.75
,p_name=>'Propiedad'
,p_background_color=>'#d0f1cc'
,p_text_color=>'#000000'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_imp.id(75390709640619182)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'Si'
,p_is_enabled=>true
);
wwv_flow_imp_page.create_ig_report_highlight(
 p_id=>wwv_flow_imp.id(37775359973284510)
,p_view_id=>wwv_flow_imp.id(75378945840619168)
,p_execution_seq=>5
,p_name=>'Agentes libres'
,p_background_color=>'#fff5ce'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_imp.id(75390709640619182)
,p_condition_operator=>'EQ'
,p_condition_is_case_sensitive=>false
,p_condition_expression=>'No'
,p_is_enabled=>true
);
wwv_flow_imp_page.create_ig_report_filter(
 p_id=>wwv_flow_imp.id(42768000001)
,p_report_id=>wwv_flow_imp.id(75378833307619167)
,p_type=>'COLUMN'
,p_column_id=>wwv_flow_imp.id(73454271920136047)
,p_operator=>'C'
,p_is_case_sensitive=>false
,p_is_enabled=>true
);
wwv_flow_imp_page.create_ig_report_filter(
 p_id=>wwv_flow_imp.id(37775445931288265)
,p_report_id=>wwv_flow_imp.id(75378833307619167)
,p_type=>'COLUMN'
,p_column_id=>wwv_flow_imp.id(73454111829136045)
,p_operator=>'C'
,p_is_case_sensitive=>false
,p_is_enabled=>true
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(75601021102701345)
,p_plug_name=>unistr('Gr\00E1fico')
,p_parent_plug_id=>wwv_flow_imp.id(37730165231194045)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(75601363068701349)
,p_plug_name=>'Grafico Region'
,p_parent_plug_id=>wwv_flow_imp.id(75601021102701345)
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_footer=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="font-size: 11px; color: #666; margin-top: 10px;">',
'  <strong>Posiciones:</strong> 1=QB | 2=RB | 3=WR | 4=TE | 5=DL | 6=LB | 7=DB',
'</div>'))
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(37873207660507320)
,p_region_id=>wwv_flow_imp.id(75601363068701349)
,p_chart_type=>'scatter'
,p_height=>'2000'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_fill_multi_series_gaps=>false
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>false
,p_show_row=>false
,p_show_start=>false
,p_show_end=>false
,p_show_progress=>false
,p_show_baseline=>false
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_show_gauge_value=>false
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(37874930138507323)
,p_chart_id=>wwv_flow_imp.id(37873207660507320)
,p_seq=>10
,p_name=>'Grafico'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    PLAYER_NAME as label,',
unistr('    -- Convertir posici\00F3n a n\00FAmero para el eje X'),
'    CASE pos.POSITION',
'        WHEN ''QB'' THEN 1',
'        WHEN ''RB'' THEN 2',
'        WHEN ''WR'' THEN 3',
'        WHEN ''TE'' THEN 4',
'        WHEN ''DL'' THEN 5',
'        WHEN ''LB'' THEN 6',
'        WHEN ''DB'' THEN 7',
'        ELSE 99',
'    END  + ',
unistr('    -- A\00F1adir jitter si VALUE es nulo (desplazamiento entre -0.15 y +0.15)'),
'    CASE ',
'        WHEN pr.VALUE IS NULL THEN (DBMS_RANDOM.VALUE(-15, 15) / 100)',
'        ELSE 0',
'    END as x_value_numeric,    ',
'    pos.POSITION as x_label_text,  -- Para mostrar el texto en labels',
unistr('    -- Asignar valor din\00E1mico a jugadores sin VALUE'),
'    CASE ',
'        WHEN pr.VALUE IS NULL THEN ',
unistr('            -- Obtener el m\00EDnimo VALUE de esta posici\00F3n/proveedor y restarle 10% del rango'),
'            (SELECT ',
'                MIN(pr2.VALUE) - (MAX(pr2.VALUE) - MIN(pr2.VALUE)) * 0.1',
'             FROM FANTASY_PROYECTION_LONG_TERM pr2',
'             WHERE pr2.IDFANTASYSEASON = :P30_TEMPORADA',
'               AND pr2.IDFANTASYWORKTEAM = :P30_EQUIPOFANTASY',
'               AND pr2.date_done = :P30_FILTRO_FECHA',
'               AND pr2.TYPE_LONG_TERM = ''ROS''',
'               AND pr2.IDFANTASYSUPPLIER = :P30_PROVEEDOR',
'               AND pr2.IDFANTASYPOSITIONBASE = pr.IDFANTASYPOSITIONBASE',
'               AND pr2.VALUE IS NOT NULL)',
'        ELSE pr.VALUE',
'    END as y_value,    ',
'    CASE ',
'        WHEN pr.RANKING IS NULL THEN ''Sin Ranking''',
'        WHEN pr.ISOWNED = ''Y'' THEN ''Mi Equipo''',
'        ELSE ''Agente Libre''',
'    END as series_name,',
unistr('    -- A\00D1ADIR COLUMNA DE COLOR'),
'    CASE ',
'        WHEN pr.RANKING IS NULL THEN ''#F01500''  ',
'        WHEN pr.ISOWNED = ''Y'' THEN ''#60D053''    ',
'        ELSE ''#FFCD0A''                          ',
'    END as marker_color,',
'    pr.PLAYER_NAME || '' ('' || pr.ALIAS_TEAM || '')'' || CHR(10) || ',
'    ''Value: '' || COALESCE(TO_CHAR(pr.VALUE, ''999999D99''), ''N/A'') || CHR(10) || ',
'    ''Ranking: '' || NVL(TO_CHAR(pr.RANKING), ''N/A'') as tooltip',
'FROM FANTASY_PROYECTION_LONG_TERM pr',
'JOIN FANTASY_POSITION_BASE pos ON pos.id = pr.IDFANTASYPOSITIONBASE',
'JOIN FANTASY_SUPPLIER su ON su.id = pr.IDFANTASYSUPPLIER',
'WHERE pr.IDFANTASYSEASON = :P30_TEMPORADA',
'  AND pr.IDFANTASYWORKTEAM = :P30_EQUIPOFANTASY',
'  AND pr.date_done = :P30_FILTRO_FECHA',
'  AND pr.TYPE_LONG_TERM = ''ROS''',
'  AND pr.IDFANTASYSUPPLIER = :P30_PROVEEDOR',
'ORDER BY x_value_numeric, pr.VALUE DESC NULLS LAST'))
,p_ajax_items_to_submit=>'P30_TEMPORADA,P30_EQUIPOFANTASY,P30_FILTRO_FECHA,P30_PROVEEDOR'
,p_series_name_column_name=>'SERIES_NAME'
,p_items_x_column_name=>'X_VALUE_NUMERIC'
,p_items_y_column_name=>'Y_VALUE'
,p_group_short_desc_column_name=>'X_LABEL_TEXT'
,p_items_label_column_name=>'LABEL'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_color=>'&MARKER_COLOR.'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_items_label_rendered=>false
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(37873726074507321)
,p_chart_id=>wwv_flow_imp.id(37873207660507320)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_title=>unistr('Posici\00F3n')
,p_min=>0
,p_max=>8
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_step=>1
,p_major_tick_rendered=>'on'
,p_min_step=>1
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(37874367940507322)
,p_chart_id=>wwv_flow_imp.id(37873207660507320)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>'Valor Dynasty'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'min'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(37727351670194017)
,p_name=>'P30_FILTRO_FECHA'
,p_item_sequence=>30
,p_prompt=>'Filtro Fecha'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>10
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(75419047318675484)
,p_name=>'P30_TEMPORADA'
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
,p_ai_enabled=>false
,p_item_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'OLD: Antes cambiamos temporada/equipo en cada pantalla.',
'-Ahora la seleccionamos en el HOME con los combos y fijamos las variables globales con ese valor para todas las pantalals -> por eso los pusimos Read Only.',
unistr('-Pero es que adem\00E1s ahora tenemos el panel del breadcrumb bar en el global para verse en todas las paginas, con los datos actualizados con el seleccionado de temporada/equipo -> por eso directamente ocultamos los campos siempre con una server side co')
||'ndition siempre falsa (no los borramos por dejarlos por si algun dia del futuro queremos cambiar algo... pero vamos, ya no sirven para nada)'))
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(75419341766677122)
,p_name=>'P30_EQUIPOFANTASY'
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
,p_ai_enabled=>false
,p_item_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'OLD: Antes cambiamos temporada/equipo en cada pantalla.',
'-Ahora la seleccionamos en el HOME con los combos y fijamos las variables globales con ese valor para todas las pantalals -> por eso los pusimos Read Only.',
unistr('-Pero es que adem\00E1s ahora tenemos el panel del breadcrumb bar en el global para verse en todas las paginas, con los datos actualizados con el seleccionado de temporada/equipo -> por eso directamente ocultamos los campos siempre con una server side co')
||'ndition siempre falsa (no los borramos por dejarlos por si algun dia del futuro queremos cambiar algo... pero vamos, ya no sirven para nada)'))
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(75601367636701348)
,p_name=>'P30_PROVEEDOR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(75601021102701345)
,p_prompt=>'Proveedor'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_named_lov=>'FUENTES_POSIBLES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name, id',
'from FANTASY_SUPPLIER',
'WHERE NVL(CLOSED,0) = 0',
'order by id'))
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(37726952203194013)
,p_computation_sequence=>10
,p_computation_item=>'P30_TEMPORADA'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'ID_TEMPORADA_ACTUAL'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(37727053281194014)
,p_computation_sequence=>20
,p_computation_item=>'P30_EQUIPOFANTASY'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'ID_EQUIPO_FANTASY_INICIO'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(37727493484194018)
,p_computation_sequence=>30
,p_computation_item=>'P30_FILTRO_FECHA'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_language=>'PLSQL'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  fecha_ DATE;',
'BEGIN --',
'  select max(pr.date_done)',
'  into fecha_',
'  from FANTASY_PROYECTION_LONG_TERM pr',
'  where pr.idfantasyseason = :P30_TEMPORADA',
'    and pr.IDFANTASYWORKTEAM = :P30_EQUIPOFANTASY',
'    and pr.TYPE_LONG_TERM = ''ROS'';',
'  return NVL(fecha_,SYSDATE);',
'END;'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(37789653477347630)
,p_name=>'Refresco tabla'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P30_EQUIPOFANTASY,P30_TEMPORADA,P30_FILTRO_FECHA'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(37790072035347632)
,p_event_id=>wwv_flow_imp.id(37789653477347630)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(75377886198619160)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(37730252333194046)
,p_name=>'Refresco_grafico'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P30_EQUIPOFANTASY,P30_TEMPORADA,P30_FILTRO_FECHA,P30_PROVEEDOR'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(37730318755194047)
,p_event_id=>wwv_flow_imp.id(37730252333194046)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(75601363068701349)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(37785813435284522)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(75377886198619160)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Proyecciones largo plazo - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>37785813435284522
);
wwv_flow_imp.component_end;
end;
/
