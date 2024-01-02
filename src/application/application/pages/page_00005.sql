prompt --application/pages/page_00005
begin
--   Manifest
--     PAGE: 00005
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
 p_id=>5
,p_name=>unistr('Clasificaci\00F3n temporal')
,p_alias=>unistr('CLASIFICACI\00D3N-TEMPORAL')
,p_step_title=>unistr('Clasificaci\00F3n temporal')
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
,p_last_updated_by=>'JPROMOCION@GMAIL.COM'
,p_last_upd_yyyymmddhh24miss=>'20240102130100'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8934175664306786)
,p_plug_name=>unistr('Clasificaci\00F3n temporal - Puntos Win')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(17069367738935144)
,p_plug_display_sequence=>10
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(8934531595306787)
,p_region_id=>wwv_flow_imp.id(8934175664306786)
,p_chart_type=>'scatter'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(8936292758306790)
,p_chart_id=>wwv_flow_imp.id(8934531595306787)
,p_seq=>10
,p_name=>'ProveedorPuntoWin'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  su.NAME proveedor_serie,',
'  case',
'    when SU.name = ''FantasyPros'' then ''#309fdb''',
'    when SU.name = ''FantasyPros Top10'' then ''#3caf85''',
'    when SU.name = ''Estadio Fantasy'' then ''#fbce4a''',
'    when SU.name = ''FFToday'' then ''#e95b54''',
'    when SU.name = ''Football Guys'' then ''#854e9b''',
'    when SU.name = ''numberFire'' then ''#2ebfbc''',
'    when SU.name = ''FantasyData'' then ''#ed813e''',
'    when SU.name = ''Walter Football'' then ''#e85d88''',
'    when SU.name = ''Roto Baller'' then ''#13b6cf''',
'    when SU.name = ''Fantasy SP'' then ''#81bb5f''',
'    else ''''',
'  end colors,  ',
'  FS.SEASON temporada_x,',
'  SUM(FV.WINPOINT) puntos_y,',
'  FS.SEASON || '' - '' || su.NAME LABEL_X,',
'  su.NAME||'' - Puntos win: ''||SUM(FV.WINPOINT) tooltip',
'from',
'  FANTASY_VALUE FV,',
'  FANTASY_SEASON FS,',
'  FANTASY_SUPPLIER su',
'WHERE FV.IDFANTASYSEASON = FS.ID',
'  AND FV.IDFANTASYSUPPLIER = su.ID',
'GROUP BY su.NAME, FS.SEASON'))
,p_series_name_column_name=>'PROVEEDOR_SERIE'
,p_items_x_column_name=>'TEMPORADA_X'
,p_items_y_column_name=>'PUNTOS_Y'
,p_items_label_column_name=>'LABEL_X'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_color=>'&COLORS.'
,p_line_style=>'dashed'
,p_line_type=>'auto'
,p_marker_rendered=>'auto'
,p_marker_shape=>'square'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(8935078243306789)
,p_chart_id=>wwv_flow_imp.id(8934531595306787)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_min=>2021
,p_max=>2030
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_numeric_pattern=>'####'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(8935642328306790)
,p_chart_id=>wwv_flow_imp.id(8934531595306787)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>true
,p_zoom_order_weeks=>true
,p_zoom_order_months=>true
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(20206068357424132)
,p_plug_name=>'Datos - Top'
,p_parent_plug_id=>wwv_flow_imp.id(8934175664306786)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(17042708691935130)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(20204122246424113)
,p_plug_name=>'Datos'
,p_parent_plug_id=>wwv_flow_imp.id(20206068357424132)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(17067238129935143)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  FS.SEASON temporada,',
'  wt.WORKTEAM equipo,',
'  su.NAME proveedor,',
'  SUM(FV.WINPOINT) puntos',
'from',
'  FANTASY_VALUE FV,',
'  FANTASY_SEASON FS,',
'  FANTASY_SUPPLIER su,',
'  FANTASY_WORKTEAM wt',
'WHERE FV.IDFANTASYSEASON = FS.ID',
'  AND FV.IDFANTASYSUPPLIER = su.ID',
'  AND FV.IDFANTASYWORKTEAM = wt.ID',
'GROUP BY su.NAME, FS.SEASON, wt.WORKTEAM',
'order by FS.SEASON desc, wt.WORKTEAM, puntos desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Datos'
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
 p_id=>wwv_flow_imp.id(18468110369230828)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'JORTRI'
,p_internal_uid=>18468110369230828
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18468212221230829)
,p_db_column_name=>'TEMPORADA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Temporada'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18468318979230830)
,p_db_column_name=>'EQUIPO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Equipo'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18468461575230831)
,p_db_column_name=>'PROVEEDOR'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Proveedor'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18468585483230832)
,p_db_column_name=>'PUNTOS'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Puntos'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(18529877895826887)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'185299'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'TEMPORADA:EQUIPO:PROVEEDOR:PUNTOS'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(20205604316424128)
,p_name=>'Top'
,p_parent_plug_id=>wwv_flow_imp.id(20206068357424132)
,p_template=>wwv_flow_imp.id(17067238129935143)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_new_grid_row=>false
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'  su.NAME proveedor,',
'  SUM(FV.WINPOINT) puntos',
'from',
'  FANTASY_VALUE FV,',
'  FANTASY_SUPPLIER su',
'WHERE FV.IDFANTASYSUPPLIER = su.ID',
'GROUP BY su.NAME',
'order by puntos desc'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(17125639701935174)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(20205807656424130)
,p_query_column_id=>1
,p_column_alias=>'PROVEEDOR'
,p_column_display_sequence=>20
,p_column_heading=>'Proveedor'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(20205938574424131)
,p_query_column_id=>2
,p_column_alias=>'PUNTOS'
,p_column_display_sequence=>30
,p_column_heading=>'Puntos'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(20203653046424108)
,p_plug_name=>unistr('Clasificaci\00F3n temporal - Puntos Fantasy')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(17069367738935144)
,p_plug_display_sequence=>20
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(20203749516424109)
,p_region_id=>wwv_flow_imp.id(20203653046424108)
,p_chart_type=>'scatter'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(20203861882424110)
,p_chart_id=>wwv_flow_imp.id(20203749516424109)
,p_seq=>10
,p_name=>'ProveedorPuntoFantasy'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'  SU.name proveedor_serie,',
'  case',
'    when SU.name = ''FantasyPros'' then ''#309fdb''',
'    when SU.name = ''FantasyPros Top10'' then ''#3caf85''',
'    when SU.name = ''Estadio Fantasy'' then ''#fbce4a''',
'    when SU.name = ''FFToday'' then ''#e95b54''',
'    when SU.name = ''Football Guys'' then ''#854e9b''',
'    when SU.name = ''numberFire'' then ''#2ebfbc''',
'    when SU.name = ''FantasyData'' then ''#ed813e''',
'    when SU.name = ''Walter Football'' then ''#e85d88''',
'    when SU.name = ''Roto Baller'' then ''#13b6cf''',
'    when SU.name = ''Fantasy SP'' then ''#81bb5f''',
'    else ''''',
'  end colors,',
'  FS.SEASON temporada_x,',
'  SUM(PO.fantasypoints) puntos_y,',
'  FS.SEASON || '' - '' || su.NAME LABEL_X,',
'  su.NAME||'' - Puntos: ''||SUM(PO.fantasypoints) tooltip',
'FROM',
'  FANTASY_PROYECTION PR,',
'  FANTASY_SUPPLIER SU,',
'  FANTASY_SEASON FS,',
'  FANTASY_POINT PO',
'WHERE PR.idfantasysupplier = SU.ID',
'  AND PR.idfantasyseason = FS.ID',
'  AND PR.idfantasyseason = PO.idfantasyseason',
'  AND PR.week = Po.week',
'  AND PR.idfantasyplayer = PO.idfantasyplayer',
'GROUP BY SU.name, FS.SEASON'))
,p_series_name_column_name=>'PROVEEDOR_SERIE'
,p_items_x_column_name=>'TEMPORADA_X'
,p_items_y_column_name=>'PUNTOS_Y'
,p_items_label_column_name=>'LABEL_X'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_color=>'&COLORS.'
,p_line_style=>'dashed'
,p_line_type=>'auto'
,p_marker_rendered=>'auto'
,p_marker_shape=>'square'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(20203930485424111)
,p_chart_id=>wwv_flow_imp.id(20203749516424109)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_min=>2021
,p_max=>2030
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_numeric_pattern=>'####'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(20204087758424112)
,p_chart_id=>wwv_flow_imp.id(20203749516424109)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_min=>1000
,p_format_type=>'decimal'
,p_decimal_places=>2
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(20206281171424134)
,p_plug_name=>'Datos - Top'
,p_parent_plug_id=>wwv_flow_imp.id(20203653046424108)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(17042708691935130)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(20205271408424124)
,p_plug_name=>'Datos'
,p_parent_plug_id=>wwv_flow_imp.id(20206281171424134)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(17067238129935143)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'  FS.SEASON temporada,',
'  wt.WORKTEAM equipo,',
'  SU.name proveedor,',
'  SUM(PO.fantasypoints) puntos',
'FROM',
'  FANTASY_PROYECTION PR,',
'  FANTASY_SUPPLIER SU,',
'  FANTASY_SEASON FS,',
'  FANTASY_POINT PO,',
'  FANTASY_WORKTEAM wt',
'WHERE PR.idfantasysupplier = SU.ID',
'  AND PR.idfantasyseason = FS.ID',
'  AND PR.idfantasyseason = PO.idfantasyseason',
'  AND PR.IDFANTASYWORKTEAM = PO.IDFANTASYWORKTEAM',
'  AND PR.week = Po.week',
'  AND PR.idfantasyplayer = PO.idfantasyplayer',
'  AND PR.IDFANTASYWORKTEAM = wt.ID',
'GROUP BY SU.name, FS.SEASON, wt.WORKTEAM',
'order by FS.SEASON desc, wt.WORKTEAM, puntos desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Datos'
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
 p_id=>wwv_flow_imp.id(18468707870230834)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'JORTRI'
,p_internal_uid=>18468707870230834
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18468816381230835)
,p_db_column_name=>'TEMPORADA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Temporada'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18468942823230836)
,p_db_column_name=>'EQUIPO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Equipo'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18469006204230837)
,p_db_column_name=>'PROVEEDOR'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Proveedor'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18469127297230838)
,p_db_column_name=>'PUNTOS'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Puntos'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(18533974178857845)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'185340'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'TEMPORADA:EQUIPO:PROVEEDOR:PUNTOS'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(20206353767424135)
,p_name=>'Top'
,p_parent_plug_id=>wwv_flow_imp.id(20206281171424134)
,p_template=>wwv_flow_imp.id(17067238129935143)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_new_grid_row=>false
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'  SU.name proveedor,',
'  SUM(PO.fantasypoints) puntos',
'FROM',
'  FANTASY_PROYECTION PR,',
'  FANTASY_SUPPLIER SU,',
'  FANTASY_POINT PO',
'WHERE PR.idfantasysupplier = SU.ID',
'  AND PR.idfantasyseason = PO.idfantasyseason',
'  AND PR.IDFANTASYWORKTEAM = PO.IDFANTASYWORKTEAM',
'  AND PR.week = Po.week',
'  AND PR.idfantasyplayer = PO.idfantasyplayer',
'GROUP BY SU.name',
'order by puntos desc'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(17125639701935174)
,p_query_num_rows=>10
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(20206535958424137)
,p_query_column_id=>1
,p_column_alias=>'PROVEEDOR'
,p_column_display_sequence=>20
,p_column_heading=>'Proveedor'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(20206694024424138)
,p_query_column_id=>2
,p_column_alias=>'PUNTOS'
,p_column_display_sequence=>30
,p_column_heading=>'Puntos'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp.component_end;
end;
/
