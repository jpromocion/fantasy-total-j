prompt --application/pages/page_00005
begin
--   Manifest
--     PAGE: 00005
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.9'
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
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8934175664306786)
,p_plug_name=>unistr('Clasificaci\00F3n temporal - Puntos Win')
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_location=>null
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
'  su.colour colors,',
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
'GROUP BY su.NAME, su.colour, FS.SEASON'))
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
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'min'
,p_position=>'auto'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(20206068357424132)
,p_plug_name=>'Datos - Top'
,p_parent_plug_id=>wwv_flow_imp.id(8934175664306786)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(20204122246424113)
,p_plug_name=>'Datos'
,p_parent_plug_id=>wwv_flow_imp.id(20206068357424132)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
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
,p_report_type=>'GROUP_BY'
,p_report_alias=>'185299'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'TEMPORADA:EQUIPO:PROVEEDOR:PUNTOS'
);
wwv_flow_imp_page.create_worksheet_group_by(
 p_id=>wwv_flow_imp.id(33048309666221059)
,p_report_id=>wwv_flow_imp.id(18529877895826887)
,p_group_by_columns=>'TEMPORADA:PROVEEDOR'
,p_function_01=>'SUM'
,p_function_column_01=>'PUNTOS'
,p_function_db_column_name_01=>'APXWS_GBFC_01'
,p_function_label_01=>'puntos ageegados'
,p_function_format_mask_01=>'999G999G999G999G990'
,p_function_sum_01=>'N'
,p_sort_column_01=>'TEMPORADA'
,p_sort_direction_01=>'DESC'
,p_sort_column_02=>'APXWS_GBFC_01'
,p_sort_direction_02=>'DESC'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(20205604316424128)
,p_name=>'Top'
,p_parent_plug_id=>wwv_flow_imp.id(20206068357424132)
,p_template=>2100526641005906379
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
,p_query_row_template=>2538654340625403440
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
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(20205938574424131)
,p_query_column_id=>2
,p_column_alias=>'PUNTOS'
,p_column_display_sequence=>30
,p_column_heading=>'Puntos'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(20203653046424108)
,p_plug_name=>unistr('Clasificaci\00F3n temporal - Puntos Fantasy')
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_location=>null
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
'  su.colour colors,',
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
'GROUP BY SU.name, su.colour, FS.SEASON'))
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
,p_format_type=>'decimal'
,p_decimal_places=>2
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'min'
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
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(20205271408424124)
,p_plug_name=>'Datos'
,p_parent_plug_id=>wwv_flow_imp.id(20206281171424134)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
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
,p_report_type=>'GROUP_BY'
,p_report_alias=>'185340'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'TEMPORADA:EQUIPO:PROVEEDOR:PUNTOS'
);
wwv_flow_imp_page.create_worksheet_group_by(
 p_id=>wwv_flow_imp.id(33047560161220059)
,p_report_id=>wwv_flow_imp.id(18533974178857845)
,p_group_by_columns=>'TEMPORADA:PROVEEDOR'
,p_function_01=>'SUM'
,p_function_column_01=>'PUNTOS'
,p_function_db_column_name_01=>'APXWS_GBFC_01'
,p_function_label_01=>'puntos agregados'
,p_function_format_mask_01=>'999G999G999G999G990'
,p_function_sum_01=>'N'
,p_sort_column_01=>'TEMPORADA'
,p_sort_direction_01=>'DESC'
,p_sort_column_02=>'APXWS_GBFC_01'
,p_sort_direction_02=>'DESC'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(20206353767424135)
,p_name=>'Top'
,p_parent_plug_id=>wwv_flow_imp.id(20206281171424134)
,p_template=>2100526641005906379
,p_display_sequence=>30
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
,p_query_row_template=>2538654340625403440
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
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(20206694024424138)
,p_query_column_id=>2
,p_column_alias=>'PUNTOS'
,p_column_display_sequence=>30
,p_column_heading=>'Puntos'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(32321088158131223)
,p_plug_name=>unistr('Clasificaci\00F3n temporal - % acierto')
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(32321195674131224)
,p_region_id=>wwv_flow_imp.id(32321088158131223)
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
 p_id=>wwv_flow_imp.id(32321253621131225)
,p_chart_id=>wwv_flow_imp.id(32321195674131224)
,p_seq=>20
,p_name=>'ProveedorPorcenAcierto'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Chart: % acierto promedio por proveedor por temporada (Scatter)',
'-- Series Name = proveedor_serie, Label = LABEL_X, X = TEMPORADA_X, Y = PUNTOS_Y, Tooltip = TOOLTIP',
'WITH',
'-- pares season/workteam/week con puntos',
'season_team_weeks AS (',
'  SELECT DISTINCT fp.idfantasyseason, fp.idfantasyworkteam, fp.week',
'  FROM FANTASY_POINT fp',
'),',
'-- posiciones por workteam (ordenadas)',
'positions AS (',
'  SELECT pw.idfantasyworkteam,',
'         p.id pos_id,',
'         p.visualorder,',
'         ROW_NUMBER() OVER (PARTITION BY pw.idfantasyworkteam ORDER BY p.visualorder) rn',
'  FROM FANTASY_POSITION_WORKTEAM pw',
'  JOIN FANTASY_POSITION p ON pw.idfantasyposition = p.id',
'),',
'-- puntos por jugador por season/workteam/week',
'players_points AS (',
'  SELECT pl.id player_id,',
'         pl.idfantasypositionbase,',
'         pl.idfantasyworkteam,',
'         pl.idfantasyseason,',
'         pt.week,',
'         pt.fantasypoints',
'  FROM FANTASY_PLAYER pl',
'  JOIN FANTASY_POINT pt ON pt.idfantasyplayer = pl.id',
'  WHERE pt.idfantasyseason = pl.idfantasyseason',
'    AND pt.idfantasyworkteam = pl.idfantasyworkteam',
'),',
unistr('-- eligible: por cada season/workteam/week + posici\00F3n los jugadores elegibles'),
'eligible AS (',
'  SELECT stw.idfantasyseason,',
'         stw.idfantasyworkteam,',
'         stw.week,',
'         pos.pos_id,',
'         pos.rn,',
'         pp.player_id,',
'         pp.idfantasypositionbase,',
'         pp.fantasypoints',
'  FROM season_team_weeks stw',
'  JOIN positions pos ON pos.idfantasyworkteam = stw.idfantasyworkteam',
'  JOIN FANTASY_POSITION_BASE_RELA rela ON rela.idfantasyposition = pos.pos_id',
'  JOIN players_points pp ON pp.idfantasypositionbase = rela.idfantasypositionbase',
'     AND pp.idfantasyworkteam = stw.idfantasyworkteam',
'     AND pp.idfantasyseason = stw.idfantasyseason',
'     AND pp.week = stw.week',
'),',
'ordered_positions AS (',
'  SELECT DISTINCT idfantasyworkteam, pos_id, rn FROM positions',
'),',
'-- CTE recursivo por (season,workteam,week) para elegir por orden el mejor jugador no usado',
'ideal_recursive (',
'  idfantasyseason, idfantasyworkteam, week, rn, pos_id, player_id, points, selected_players',
') AS (',
'  -- anchor rn = 1',
'  SELECT e.idfantasyseason, e.idfantasyworkteam, e.week, e.rn, e.pos_id,',
'    (SELECT player_id FROM (SELECT player_id, fantasypoints FROM eligible ee WHERE ee.idfantasyseason = e.idfantasyseason AND ee.idfantasyworkteam = e.idfantasyworkteam AND ee.week = e.week AND ee.pos_id = e.pos_id ORDER BY fantasypoints DESC, player'
||'_id) WHERE rownum = 1),',
'    NVL((SELECT fantasypoints FROM (SELECT player_id, fantasypoints FROM eligible ee WHERE ee.idfantasyseason = e.idfantasyseason AND ee.idfantasyworkteam = e.idfantasyworkteam AND ee.week = e.week AND ee.pos_id = e.pos_id ORDER BY fantasypoints DESC'
||', player_id) WHERE rownum = 1),0),',
'    NVL(TO_CHAR((SELECT player_id FROM (SELECT player_id FROM eligible ee WHERE ee.idfantasyseason = e.idfantasyseason AND ee.idfantasyworkteam = e.idfantasyworkteam AND ee.week = e.week AND ee.pos_id = e.pos_id ORDER BY fantasypoints DESC, player_id'
||') WHERE rownum = 1)), '''')',
'  FROM (SELECT DISTINCT idfantasyseason, idfantasyworkteam, week, rn, pos_id FROM eligible) e',
'  WHERE e.rn = 1',
'',
'  UNION ALL',
'',
'  -- paso recursivo',
'  SELECT i.idfantasyseason, i.idfantasyworkteam, i.week, op.rn, op.pos_id,',
'    (SELECT player_id FROM (SELECT player_id, fantasypoints FROM eligible ee WHERE ee.idfantasyseason = i.idfantasyseason AND ee.idfantasyworkteam = i.idfantasyworkteam AND ee.week = i.week AND ee.pos_id = op.pos_id AND instr('',''||NVL(i.selected_play'
||'ers,'''')||'','', '',''||ee.player_id||'','') = 0 ORDER BY fantasypoints DESC, player_id) WHERE rownum = 1),',
'    NVL((SELECT fantasypoints FROM (SELECT player_id, fantasypoints FROM eligible ee WHERE ee.idfantasyseason = i.idfantasyseason AND ee.idfantasyworkteam = i.idfantasyworkteam AND ee.week = i.week AND ee.pos_id = op.pos_id AND instr('',''||NVL(i.selec'
||'ted_players,'''')||'','', '',''||ee.player_id||'','') = 0 ORDER BY fantasypoints DESC, player_id) WHERE rownum = 1),0),',
'    NVL(i.selected_players,'''') ||',
'      CASE',
'        WHEN (SELECT player_id FROM (SELECT player_id FROM eligible ee WHERE ee.idfantasyseason = i.idfantasyseason AND ee.idfantasyworkteam = i.idfantasyworkteam AND ee.week = i.week AND ee.pos_id = op.pos_id AND instr('',''||NVL(i.selected_players,'''''
||')||'','', '',''||ee.player_id||'','') = 0 ORDER BY fantasypoints DESC, player_id) WHERE rownum = 1) IS NOT NULL',
'        THEN '','' || TO_CHAR((SELECT player_id FROM (SELECT player_id FROM eligible ee WHERE ee.idfantasyseason = i.idfantasyseason AND ee.idfantasyworkteam = i.idfantasyworkteam AND ee.week = i.week AND ee.pos_id = op.pos_id AND instr('',''||NVL(i.sele'
||'cted_players,'''')||'','', '',''||ee.player_id||'','') = 0 ORDER BY fantasypoints DESC, player_id) WHERE rownum = 1))',
'        ELSE ''''',
'      END',
'  FROM ideal_recursive i',
'  JOIN ordered_positions op ON op.idfantasyworkteam = i.idfantasyworkteam AND op.rn = i.rn + 1',
'),',
'ideal_lineup AS (',
'  SELECT idfantasyseason, idfantasyworkteam, week, pos_id, player_id, NVL(points,0) points',
'  FROM ideal_recursive',
'),',
'ideal_total AS (',
'  SELECT idfantasyseason, idfantasyworkteam, week, SUM(points) AS ideal_points',
'  FROM ideal_lineup',
'  GROUP BY idfantasyseason, idfantasyworkteam, week',
'),',
'-- puntos por proveedor por season/workteam/week',
'supplier_week_points AS (',
'  SELECT pr.idfantasysupplier supplier_id,',
'         pr.idfantasyseason,',
'         pr.idfantasyworkteam,',
'         pr.week,',
'         SUM(NVL(fp.fantasypoints,0)) supplier_points',
'  FROM FANTASY_PROYECTION pr',
'  JOIN FANTASY_POINT fp',
'    ON pr.idfantasyseason = fp.idfantasyseason',
'   AND pr.idfantasyworkteam = fp.idfantasyworkteam',
'   AND pr.week = fp.week',
'   AND pr.idfantasyplayer = fp.idfantasyplayer',
'  GROUP BY pr.idfantasysupplier, pr.idfantasyseason, pr.idfantasyworkteam, pr.week',
'),',
'-- pct semanal por supplier (solo donde ideal_points > 0)',
'week_pct AS (',
'  SELECT s.supplier_id, s.idfantasyseason, s.idfantasyworkteam, s.week,',
'         s.supplier_points, it.ideal_points,',
'         CASE WHEN it.ideal_points > 0 THEN ROUND((s.supplier_points / it.ideal_points) * 100, 2) ELSE NULL END pct',
'  FROM supplier_week_points s',
'  JOIN ideal_total it',
'    ON it.idfantasyseason = s.idfantasyseason',
'   AND it.idfantasyworkteam = s.idfantasyworkteam',
'   AND it.week = s.week',
')',
'-- Resultado: promedio de % semanales por proveedor por temporada',
'SELECT',
'  su.name proveedor_serie,',
'  su.colour colors,',
'  fs.season temporada_x,',
'  ROUND(AVG(w.pct), 2) prc_media_y,',
'  fs.season || '' - '' || su.name LABEL_X,',
'  su.name || '' - % acierto: '' || TO_CHAR(ROUND(AVG(w.pct), 2)) tooltip',
'FROM week_pct w',
'JOIN FANTASY_SUPPLIER su ON su.id = w.supplier_id',
'JOIN FANTASY_SEASON fs ON fs.id = w.idfantasyseason',
'WHERE w.pct IS NOT NULL',
'GROUP BY su.name, su.colour, fs.season',
'ORDER BY fs.season DESC, prc_media_y DESC'))
,p_series_name_column_name=>'PROVEEDOR_SERIE'
,p_items_x_column_name=>'TEMPORADA_X'
,p_items_y_column_name=>'PRC_MEDIA_Y'
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
 p_id=>wwv_flow_imp.id(32321338635131226)
,p_chart_id=>wwv_flow_imp.id(32321195674131224)
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
 p_id=>wwv_flow_imp.id(32321448152131227)
,p_chart_id=>wwv_flow_imp.id(32321195674131224)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>2
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'min'
,p_position=>'auto'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(32321514451131228)
,p_plug_name=>'Datos - Top'
,p_parent_plug_id=>wwv_flow_imp.id(32321088158131223)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(32321695758131229)
,p_plug_name=>'Datos'
,p_parent_plug_id=>wwv_flow_imp.id(32321514451131228)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Tabla: % acierto promedio por temporada / equipo / proveedor',
'WITH',
'-- mismos CTEs que en el chart: season_team_weeks, positions, players_points, eligible, ideal_recursive, ideal_total, supplier_week_points, week_pct',
'season_team_weeks AS (',
'  SELECT DISTINCT fp.idfantasyseason, fp.idfantasyworkteam, fp.week',
'  FROM FANTASY_POINT fp',
'),',
'positions AS (',
'  SELECT pw.idfantasyworkteam,',
'         p.id pos_id,',
'         p.visualorder,',
'         ROW_NUMBER() OVER (PARTITION BY pw.idfantasyworkteam ORDER BY p.visualorder) rn',
'  FROM FANTASY_POSITION_WORKTEAM pw',
'  JOIN FANTASY_POSITION p ON pw.idfantasyposition = p.id',
'),',
'players_points AS (',
'  SELECT pl.id player_id,',
'         pl.idfantasypositionbase,',
'         pl.idfantasyworkteam,',
'         pl.idfantasyseason,',
'         pt.week,',
'         pt.fantasypoints',
'  FROM FANTASY_PLAYER pl',
'  JOIN FANTASY_POINT pt ON pt.idfantasyplayer = pl.id',
'  WHERE pt.idfantasyseason = pl.idfantasyseason',
'    AND pt.idfantasyworkteam = pl.idfantasyworkteam',
'),',
'eligible AS (',
'  SELECT stw.idfantasyseason,',
'         stw.idfantasyworkteam,',
'         stw.week,',
'         pos.pos_id,',
'         pos.rn,',
'         pp.player_id,',
'         pp.idfantasypositionbase,',
'         pp.fantasypoints',
'  FROM season_team_weeks stw',
'  JOIN positions pos ON pos.idfantasyworkteam = stw.idfantasyworkteam',
'  JOIN FANTASY_POSITION_BASE_RELA rela ON rela.idfantasyposition = pos.pos_id',
'  JOIN players_points pp ON pp.idfantasypositionbase = rela.idfantasypositionbase',
'     AND pp.idfantasyworkteam = stw.idfantasyworkteam',
'     AND pp.idfantasyseason = stw.idfantasyseason',
'     AND pp.week = stw.week',
'),',
'ordered_positions AS (',
'  SELECT DISTINCT idfantasyworkteam, pos_id, rn FROM positions',
'),',
'ideal_recursive (',
'  idfantasyseason, idfantasyworkteam, week, rn, pos_id, player_id, points, selected_players',
') AS (',
'  SELECT e.idfantasyseason, e.idfantasyworkteam, e.week, e.rn, e.pos_id,',
'    (SELECT player_id FROM (SELECT player_id, fantasypoints FROM eligible ee WHERE ee.idfantasyseason = e.idfantasyseason AND ee.idfantasyworkteam = e.idfantasyworkteam AND ee.week = e.week AND ee.pos_id = e.pos_id ORDER BY fantasypoints DESC, player'
||'_id) WHERE rownum = 1),',
'    NVL((SELECT fantasypoints FROM (SELECT player_id, fantasypoints FROM eligible ee WHERE ee.idfantasyseason = e.idfantasyseason AND ee.idfantasyworkteam = e.idfantasyworkteam AND ee.week = e.week AND ee.pos_id = e.pos_id ORDER BY fantasypoints DESC'
||', player_id) WHERE rownum = 1),0),',
'    NVL(TO_CHAR((SELECT player_id FROM (SELECT player_id FROM eligible ee WHERE ee.idfantasyseason = e.idfantasyseason AND ee.idfantasyworkteam = e.idfantasyworkteam AND ee.week = e.week AND ee.pos_id = e.pos_id ORDER BY fantasypoints DESC, player_id'
||') WHERE rownum = 1)), '''')',
'  FROM (SELECT DISTINCT idfantasyseason, idfantasyworkteam, week, rn, pos_id FROM eligible) e',
'  WHERE e.rn = 1',
'',
'  UNION ALL',
'',
'  SELECT i.idfantasyseason, i.idfantasyworkteam, i.week, op.rn, op.pos_id,',
'    (SELECT player_id FROM (SELECT player_id, fantasypoints FROM eligible ee WHERE ee.idfantasyseason = i.idfantasyseason AND ee.idfantasyworkteam = i.idfantasyworkteam AND ee.week = i.week AND ee.pos_id = op.pos_id AND instr('',''||NVL(i.selected_play'
||'ers,'''')||'','', '',''||ee.player_id||'','') = 0 ORDER BY fantasypoints DESC, player_id) WHERE rownum = 1),',
'    NVL((SELECT fantasypoints FROM (SELECT player_id, fantasypoints FROM eligible ee WHERE ee.idfantasyseason = i.idfantasyseason AND ee.idfantasyworkteam = i.idfantasyworkteam AND ee.week = i.week AND ee.pos_id = op.pos_id AND instr('',''||NVL(i.selec'
||'ted_players,'''')||'','', '',''||ee.player_id||'','') = 0 ORDER BY fantasypoints DESC, player_id) WHERE rownum = 1),0),',
'    NVL(i.selected_players,'''') ||',
'      CASE',
'        WHEN (SELECT player_id FROM (SELECT player_id FROM eligible ee WHERE ee.idfantasyseason = i.idfantasyseason AND ee.idfantasyworkteam = i.idfantasyworkteam AND ee.week = i.week AND ee.pos_id = op.pos_id AND instr('',''||NVL(i.selected_players,'''''
||')||'','', '',''||ee.player_id||'','') = 0 ORDER BY fantasypoints DESC, player_id) WHERE rownum = 1) IS NOT NULL',
'        THEN '','' || TO_CHAR((SELECT player_id FROM (SELECT player_id FROM eligible ee WHERE ee.idfantasyseason = i.idfantasyseason AND ee.idfantasyworkteam = i.idfantasyworkteam AND ee.week = i.week AND ee.pos_id = op.pos_id AND instr('',''||NVL(i.sele'
||'cted_players,'''')||'','', '',''||ee.player_id||'','') = 0 ORDER BY fantasypoints DESC, player_id) WHERE rownum = 1))',
'        ELSE ''''',
'      END',
'  FROM ideal_recursive i',
'  JOIN ordered_positions op ON op.idfantasyworkteam = i.idfantasyworkteam AND op.rn = i.rn + 1',
'),',
'ideal_lineup AS (',
'  SELECT idfantasyseason, idfantasyworkteam, week, pos_id, player_id, NVL(points,0) points',
'  FROM ideal_recursive',
'),',
'ideal_total AS (',
'  SELECT idfantasyseason, idfantasyworkteam, week, SUM(points) AS ideal_points',
'  FROM ideal_lineup',
'  GROUP BY idfantasyseason, idfantasyworkteam, week',
'),',
'supplier_week_points AS (',
'  SELECT pr.idfantasysupplier supplier_id,',
'         pr.idfantasyseason,',
'         pr.idfantasyworkteam,',
'         pr.week,',
'         SUM(NVL(fp.fantasypoints,0)) supplier_points',
'  FROM FANTASY_PROYECTION pr',
'  JOIN FANTASY_POINT fp',
'    ON pr.idfantasyseason = fp.idfantasyseason',
'   AND pr.idfantasyworkteam = fp.idfantasyworkteam',
'   AND pr.week = fp.week',
'   AND pr.idfantasyplayer = fp.idfantasyplayer',
'  GROUP BY pr.idfantasysupplier, pr.idfantasyseason, pr.idfantasyworkteam, pr.week',
'),',
'week_pct AS (',
'  SELECT s.supplier_id, s.idfantasyseason, s.idfantasyworkteam, s.week,',
'         s.supplier_points, it.ideal_points,',
'         CASE WHEN it.ideal_points > 0 THEN ROUND((s.supplier_points / it.ideal_points) * 100, 2) ELSE NULL END pct',
'  FROM supplier_week_points s',
'  JOIN ideal_total it',
'    ON it.idfantasyseason = s.idfantasyseason',
'   AND it.idfantasyworkteam = s.idfantasyworkteam',
'   AND it.week = s.week',
')',
'-- Resultado: temporada, equipo, proveedor, % acierto promedio (por las semanas evaluadas)',
'SELECT',
'  fs.season temporada,',
'  wt.workteam equipo,',
'  su.name proveedor,',
'  ROUND(AVG(w.pct), 2) porcentaje,',
'  COUNT(DISTINCT w.week) semanas_evaluadas',
'FROM week_pct w',
'JOIN FANTASY_SUPPLIER su ON su.id = w.supplier_id',
'JOIN FANTASY_WORKTEAM wt ON wt.id = w.idfantasyworkteam',
'JOIN FANTASY_SEASON fs ON fs.id = w.idfantasyseason',
'WHERE w.pct IS NOT NULL',
'GROUP BY fs.season, wt.workteam, su.name',
'ORDER BY fs.season DESC, wt.workteam, porcentaje DESC'))
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
 p_id=>wwv_flow_imp.id(32321796265131230)
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
,p_internal_uid=>32321796265131230
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(32321885133131231)
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
 p_id=>wwv_flow_imp.id(32321909977131232)
,p_db_column_name=>'EQUIPO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Equipo'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(32322093497131233)
,p_db_column_name=>'PROVEEDOR'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Proveedor'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(32322572867131238)
,p_db_column_name=>'PORCENTAJE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Porcentaje'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(32322622633131239)
,p_db_column_name=>'SEMANAS_EVALUADAS'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Semanas Evaluadas'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(33045594269175810)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_type=>'GROUP_BY'
,p_report_alias=>'330456'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'TEMPORADA:EQUIPO:PROVEEDOR:PORCENTAJE:SEMANAS_EVALUADAS'
);
wwv_flow_imp_page.create_worksheet_group_by(
 p_id=>wwv_flow_imp.id(33049374971232035)
,p_report_id=>wwv_flow_imp.id(33045594269175810)
,p_group_by_columns=>'TEMPORADA:PROVEEDOR'
,p_function_01=>'AVG'
,p_function_column_01=>'PORCENTAJE'
,p_function_db_column_name_01=>'APXWS_GBFC_01'
,p_function_label_01=>'Porcentaje medio'
,p_function_format_mask_01=>'999G999G999G999G990D00'
,p_function_sum_01=>'N'
,p_sort_column_01=>'TEMPORADA'
,p_sort_direction_01=>'DESC'
,p_sort_column_02=>'APXWS_GBFC_01'
,p_sort_direction_02=>'DESC'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(32322213466131235)
,p_name=>'Top'
,p_parent_plug_id=>wwv_flow_imp.id(32321514451131228)
,p_template=>2100526641005906379
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_new_grid_row=>false
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('-- Tabla acumulada hist\00F3rica: % acierto promedio por proveedor (todas las temporadas)'),
'WITH',
'-- pares season/workteam/week con puntos',
'season_team_weeks AS (',
'  SELECT DISTINCT fp.idfantasyseason, fp.idfantasyworkteam, fp.week',
'  FROM FANTASY_POINT fp',
'),',
'positions AS (',
'  SELECT pw.idfantasyworkteam,',
'         p.id pos_id,',
'         p.visualorder,',
'         ROW_NUMBER() OVER (PARTITION BY pw.idfantasyworkteam ORDER BY p.visualorder) rn',
'  FROM FANTASY_POSITION_WORKTEAM pw',
'  JOIN FANTASY_POSITION p ON pw.idfantasyposition = p.id',
'),',
'players_points AS (',
'  SELECT pl.id player_id,',
'         pl.idfantasypositionbase,',
'         pl.idfantasyworkteam,',
'         pl.idfantasyseason,',
'         pt.week,',
'         pt.fantasypoints',
'  FROM FANTASY_PLAYER pl',
'  JOIN FANTASY_POINT pt ON pt.idfantasyplayer = pl.id',
'  WHERE pt.idfantasyseason = pl.idfantasyseason',
'    AND pt.idfantasyworkteam = pl.idfantasyworkteam',
'),',
'eligible AS (',
'  SELECT stw.idfantasyseason,',
'         stw.idfantasyworkteam,',
'         stw.week,',
'         pos.pos_id,',
'         pos.rn,',
'         pp.player_id,',
'         pp.idfantasypositionbase,',
'         pp.fantasypoints',
'  FROM season_team_weeks stw',
'  JOIN positions pos ON pos.idfantasyworkteam = stw.idfantasyworkteam',
'  JOIN FANTASY_POSITION_BASE_RELA rela ON rela.idfantasyposition = pos.pos_id',
'  JOIN players_points pp ON pp.idfantasypositionbase = rela.idfantasypositionbase',
'     AND pp.idfantasyworkteam = stw.idfantasyworkteam',
'     AND pp.idfantasyseason = stw.idfantasyseason',
'     AND pp.week = stw.week',
'),',
'ordered_positions AS (',
'  SELECT DISTINCT idfantasyworkteam, pos_id, rn FROM positions',
'),',
'ideal_recursive (',
'  idfantasyseason, idfantasyworkteam, week, rn, pos_id, player_id, points, selected_players',
') AS (',
'  SELECT e.idfantasyseason, e.idfantasyworkteam, e.week, e.rn, e.pos_id,',
'    (SELECT player_id FROM (SELECT player_id, fantasypoints FROM eligible ee WHERE ee.idfantasyseason = e.idfantasyseason AND ee.idfantasyworkteam = e.idfantasyworkteam AND ee.week = e.week AND ee.pos_id = e.pos_id ORDER BY fantasypoints DESC, player'
||'_id) WHERE rownum = 1),',
'    NVL((SELECT fantasypoints FROM (SELECT player_id, fantasypoints FROM eligible ee WHERE ee.idfantasyseason = e.idfantasyseason AND ee.idfantasyworkteam = e.idfantasyworkteam AND ee.week = e.week AND ee.pos_id = e.pos_id ORDER BY fantasypoints DESC'
||', player_id) WHERE rownum = 1),0),',
'    NVL(TO_CHAR((SELECT player_id FROM (SELECT player_id FROM eligible ee WHERE ee.idfantasyseason = e.idfantasyseason AND ee.idfantasyworkteam = e.idfantasyworkteam AND ee.week = e.week AND ee.pos_id = e.pos_id ORDER BY fantasypoints DESC, player_id'
||') WHERE rownum = 1)), '''')',
'  FROM (SELECT DISTINCT idfantasyseason, idfantasyworkteam, week, rn, pos_id FROM eligible) e',
'  WHERE e.rn = 1',
'',
'  UNION ALL',
'',
'  SELECT i.idfantasyseason, i.idfantasyworkteam, i.week, op.rn, op.pos_id,',
'    (SELECT player_id FROM (SELECT player_id, fantasypoints FROM eligible ee WHERE ee.idfantasyseason = i.idfantasyseason AND ee.idfantasyworkteam = i.idfantasyworkteam AND ee.week = i.week AND ee.pos_id = op.pos_id AND instr('',''||NVL(i.selected_play'
||'ers,'''')||'','', '',''||ee.player_id||'','') = 0 ORDER BY fantasypoints DESC, player_id) WHERE rownum = 1),',
'    NVL((SELECT fantasypoints FROM (SELECT player_id, fantasypoints FROM eligible ee WHERE ee.idfantasyseason = i.idfantasyseason AND ee.idfantasyworkteam = i.idfantasyworkteam AND ee.week = i.week AND ee.pos_id = op.pos_id AND instr('',''||NVL(i.selec'
||'ted_players,'''')||'','', '',''||ee.player_id||'','') = 0 ORDER BY fantasypoints DESC, player_id) WHERE rownum = 1),0),',
'    NVL(i.selected_players,'''') ||',
'      CASE',
'        WHEN (SELECT player_id FROM (SELECT player_id FROM eligible ee WHERE ee.idfantasyseason = i.idfantasyseason AND ee.idfantasyworkteam = i.idfantasyworkteam AND ee.week = i.week AND ee.pos_id = op.pos_id AND instr('',''||NVL(i.selected_players,'''''
||')||'','', '',''||ee.player_id||'','') = 0 ORDER BY fantasypoints DESC, player_id) WHERE rownum = 1) IS NOT NULL',
'        THEN '','' || TO_CHAR((SELECT player_id FROM (SELECT player_id FROM eligible ee WHERE ee.idfantasyseason = i.idfantasyseason AND ee.idfantasyworkteam = i.idfantasyworkteam AND ee.week = i.week AND ee.pos_id = op.pos_id AND instr('',''||NVL(i.sele'
||'cted_players,'''')||'','', '',''||ee.player_id||'','') = 0 ORDER BY fantasypoints DESC, player_id) WHERE rownum = 1))',
'        ELSE ''''',
'      END',
'  FROM ideal_recursive i',
'  JOIN ordered_positions op ON op.idfantasyworkteam = i.idfantasyworkteam AND op.rn = i.rn + 1',
'),',
'ideal_lineup AS (',
'  SELECT idfantasyseason, idfantasyworkteam, week, pos_id, player_id, NVL(points,0) points',
'  FROM ideal_recursive',
'),',
'ideal_total AS (',
'  SELECT idfantasyseason, idfantasyworkteam, week, SUM(points) AS ideal_points',
'  FROM ideal_lineup',
'  GROUP BY idfantasyseason, idfantasyworkteam, week',
'),',
'supplier_week_points AS (',
'  SELECT pr.idfantasysupplier supplier_id,',
'         pr.idfantasyseason,',
'         pr.idfantasyworkteam,',
'         pr.week,',
'         SUM(NVL(fp.fantasypoints,0)) supplier_points',
'  FROM FANTASY_PROYECTION pr',
'  JOIN FANTASY_POINT fp',
'    ON pr.idfantasyseason = fp.idfantasyseason',
'   AND pr.idfantasyworkteam = fp.idfantasyworkteam',
'   AND pr.week = fp.week',
'   AND pr.idfantasyplayer = fp.idfantasyplayer',
'  GROUP BY pr.idfantasysupplier, pr.idfantasyseason, pr.idfantasyworkteam, pr.week',
'),',
'week_pct AS (',
'  SELECT s.supplier_id, s.idfantasyseason, s.idfantasyworkteam, s.week,',
'         s.supplier_points, it.ideal_points,',
'         CASE WHEN it.ideal_points > 0 THEN ROUND((s.supplier_points / it.ideal_points) * 100, 2) ELSE NULL END pct',
'  FROM supplier_week_points s',
'  JOIN ideal_total it',
'    ON it.idfantasyseason = s.idfantasyseason',
'   AND it.idfantasyworkteam = s.idfantasyworkteam',
'   AND it.week = s.week',
')',
unistr('-- Resultado global: promedio de % semanales por proveedor (todas las temporadas), con n\00FAmero de semanas evaluadas'),
'SELECT',
'  su.name proveedor,',
'  ROUND(AVG(w.pct), 2) porcentaje_acierto,',
'  COUNT(DISTINCT w.idfantasyseason || ''-'' || w.idfantasyworkteam || ''-'' || TO_CHAR(w.week)) semanas_evaluadas',
'FROM week_pct w',
'JOIN FANTASY_SUPPLIER su ON su.id = w.supplier_id',
'WHERE w.pct IS NOT NULL',
'GROUP BY su.name',
'ORDER BY porcentaje_acierto DESC'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>10
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(32322393736131236)
,p_query_column_id=>1
,p_column_alias=>'PROVEEDOR'
,p_column_display_sequence=>10
,p_column_heading=>'Proveedor'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(32322743499131240)
,p_query_column_id=>2
,p_column_alias=>'PORCENTAJE_ACIERTO'
,p_column_display_sequence=>20
,p_column_heading=>'Porcentaje Acierto'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(32322852901131241)
,p_query_column_id=>3
,p_column_alias=>'SEMANAS_EVALUADAS'
,p_column_display_sequence=>30
,p_column_heading=>'Semanas Evaluadas'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp.component_end;
end;
/
