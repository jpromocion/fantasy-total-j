prompt --application/pages/page_00001
begin
--   Manifest
--     PAGE: 00001
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
 p_id=>1
,p_name=>'Home'
,p_alias=>'HOME'
,p_step_title=>'Fantasy Total'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'13'
,p_last_updated_by=>'JORTRI'
,p_last_upd_yyyymmddhh24miss=>'20231030100104'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(17202544383935283)
,p_plug_name=>'Fantasy Total'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(17103768164935162)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<b>Temporada actual: </b>&TEMPORADA_ACTUAL. <br>',
'<b>Id temporada actual: </b>&ID_TEMPORADA_ACTUAL.'))
,p_plug_query_num_rows=>15
,p_region_image=>'#APP_FILES#icons/app-icon-512.png'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(18278094394614941)
,p_plug_name=>unistr('Contribuci\00F3n por posicion')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(17069367738935144)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P1_TEMPORADA'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(18278115648614942)
,p_region_id=>wwv_flow_imp.id(18278094394614941)
,p_chart_type=>'radar'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(18278225349614943)
,p_chart_id=>wwv_flow_imp.id(18278115648614942)
,p_seq=>10
,p_name=>'Posiciones'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'  POS.POSITION,',
'  SUM(S.MAXIMO_POSICION) AS PUNTOS',
'FROM',
'  (',
'  SELECT',
'    PR.idfantasyseason, PR.week, PR.IDFANTASYPOSITION,',
'    MAX(PO.fantasypoints) AS MAXIMO_POSICION',
'  FROM',
'    FANTASY_PROYECTION PR,',
'    FANTASY_POINT PO',
'  WHERE PR.idfantasyseason = PO.idfantasyseason',
'    AND PR.week = Po.week',
'    AND PR.idfantasyplayer = PO.idfantasyplayer',
'    AND PR.idfantasyseason = :P1_TEMPORADA',
'  GROUP BY PR.idfantasyseason, PR.week, PR.IDFANTASYPOSITION',
'  ) S,',
'  FANTASY_POSITION POS',
'WHERE S.IDFANTASYPOSITION = POS.id',
'GROUP BY S.IDFANTASYPOSITION, POS.POSITION, POS.VISUALORDER',
'order by POS.VISUALORDER;'))
,p_series_type=>'area'
,p_items_value_column_name=>'PUNTOS'
,p_items_label_column_name=>'POSITION'
,p_line_type=>'auto'
,p_items_label_rendered=>false
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(18278309476614944)
,p_chart_id=>wwv_flow_imp.id(18278115648614942)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(18278406388614945)
,p_chart_id=>wwv_flow_imp.id(18278115648614942)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>2
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(18278658845614947)
,p_plug_name=>unistr('Contribuci\00F3n por jugador')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(17069367738935144)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P1_TEMPORADA'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(18278761619614948)
,p_region_id=>wwv_flow_imp.id(18278658845614947)
,p_chart_type=>'donut'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>2
,p_value_format_scaling=>'none'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(18278893356614949)
,p_chart_id=>wwv_flow_imp.id(18278761619614948)
,p_seq=>10
,p_name=>'Jugadores'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'  PL.NAME,',
'  SUM(PO.fantasypoints) AS PUNTOS',
'FROM',
'  FANTASY_POINT PO,',
'  FANTASY_PLAYER PL',
'WHERE PO.IDFANTASYPLAYER = PL.id',
'  AND PO.IDFANTASYSEASON = :P1_TEMPORADA',
'GROUP BY PL.NAME',
'ORDER BY puntos desc'))
,p_items_value_column_name=>'PUNTOS'
,p_items_label_column_name=>'NAME'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'LABEL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(18795576951040503)
,p_plug_name=>'Semanal Jugadores'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(17069367738935144)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P1_TEMPORADA'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(18795676732040504)
,p_region_id=>wwv_flow_imp.id(18795576951040503)
,p_chart_type=>'line'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>false
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'bottom'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(18795790546040505)
,p_chart_id=>wwv_flow_imp.id(18795676732040504)
,p_seq=>10
,p_name=>'Semanal'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'  w.week,',
'  PL.NAME,',
'  SUM(',
'    nvl(',
'      (select PO.fantasypoints',
'      from FANTASY_POINT PO',
'      where PL.id = PO.IDFANTASYPLAYER(+)',
'        AND w.week = PO.WEEK(+)',
'        AND PO.IDFANTASYSEASON = :P1_TEMPORADA),',
'      0)',
'  ) AS PUNTOS',
'FROM',
'  (',
'  SELECT LPAD(rownum,2,''0'') as week',
'  FROM Dual',
'  CONNECT BY rownum <= 17',
'  ) w,',
'  FANTASY_PLAYER PL',
'WHERE pl.IDFANTASYSEASON = :P1_TEMPORADA',
'GROUP BY w.week, PL.NAME',
'ORDER BY w.week, PL.NAME'))
,p_max_row_count=>999999999999999999
,p_series_name_column_name=>'NAME'
,p_items_value_column_name=>'PUNTOS'
,p_items_label_column_name=>'WEEK'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(18796771325040515)
,p_chart_id=>wwv_flow_imp.id(18795676732040504)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_title=>'Week'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(18796802773040516)
,p_chart_id=>wwv_flow_imp.id(18795676732040504)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>'Puntos Fantasy'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'on'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(18797056728040518)
,p_plug_name=>'Semanal Proveedor'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(17069367738935144)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P1_TEMPORADA'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(18797189605040519)
,p_region_id=>wwv_flow_imp.id(18797056728040518)
,p_chart_type=>'bar'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>false
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'bottom'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(18797215684040520)
,p_chart_id=>wwv_flow_imp.id(18797189605040519)
,p_seq=>10
,p_name=>'Proveedores'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'  lpad(PR.week,2,''0'') week,',
'  SU.name,',
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
'  end colors,   ',
'  SUM(PO.fantasypoints) AS PUNTOS',
'FROM',
'  FANTASY_PROYECTION PR,',
'  FANTASY_SUPPLIER SU,',
'  FANTASY_POINT PO',
'WHERE PR.idfantasysupplier = SU.ID',
'  AND PR.idfantasyseason = PO.idfantasyseason',
'  AND PR.week = Po.week',
'  AND PR.idfantasyplayer = PO.idfantasyplayer',
'  AND PR.idfantasyseason = :P1_TEMPORADA  ',
'GROUP BY SU.name, SU.VISUALORDER, PR.week',
'order by PR.week, SU.VISUALORDER'))
,p_max_row_count=>9999999999999999
,p_series_name_column_name=>'NAME'
,p_items_value_column_name=>'PUNTOS'
,p_items_label_column_name=>'WEEK'
,p_color=>'&COLORS.'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(18798396870040531)
,p_chart_id=>wwv_flow_imp.id(18797189605040519)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>'Puntos Fantasy'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'on'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(18798238061040530)
,p_chart_id=>wwv_flow_imp.id(18797189605040519)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_title=>'Week'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(36713102027907307)
,p_plug_name=>unistr('Proveedor - Puntuaci\00F3n Win')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(17069367738935144)
,p_plug_display_sequence=>40
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P1_TEMPORADA'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(18360274968955813)
,p_region_id=>wwv_flow_imp.id(36713102027907307)
,p_chart_type=>'pie'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(18360706168955813)
,p_chart_id=>wwv_flow_imp.id(18360274968955813)
,p_seq=>10
,p_name=>'Series 1'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'  SU.name,',
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
'  SUM(va.WINPOINT) AS PUNTOSWIN',
'FROM',
'  FANTASY_SUPPLIER SU,',
'  FANTASY_VALUE VA',
'WHERE va.IDFANTASYSUPPLIER = su.id',
'  AND va.idfantasyseason = :P1_TEMPORADA',
'GROUP BY SU.name',
'ORDER BY PUNTOSWIN DESC'))
,p_max_row_count=>9999999999999
,p_items_value_column_name=>'PUNTOSWIN'
,p_items_label_column_name=>'NAME'
,p_color=>'&COLORS.'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'LABEL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(36716032773908258)
,p_plug_name=>unistr('Proveedor - Puntuaci\00F3n Fantasy')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(17069367738935144)
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P1_TEMPORADA'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(18361632401956762)
,p_region_id=>wwv_flow_imp.id(36716032773908258)
,p_chart_type=>'bar'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'horizontal'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_fill_multi_series_gaps=>false
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>false
,p_show_group_name=>false
,p_show_value=>true
,p_legend_rendered=>'off'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(18363396208956763)
,p_chart_id=>wwv_flow_imp.id(18361632401956762)
,p_seq=>10
,p_name=>'Series 1'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'  SU.name,',
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
'  SUM(PO.fantasypoints) AS PUNTOS',
'FROM',
'  FANTASY_PROYECTION PR,',
'  FANTASY_SUPPLIER SU,',
'  FANTASY_POINT PO',
'WHERE PR.idfantasysupplier = SU.ID',
'  AND PR.idfantasyseason = PO.idfantasyseason',
'  AND PR.week = Po.week',
'  AND PR.idfantasyplayer = PO.idfantasyplayer',
'  AND PR.idfantasyseason = :P1_TEMPORADA',
'GROUP BY SU.name',
'order by puntos desc'))
,p_max_row_count=>99999999999999
,p_items_value_column_name=>'PUNTOS'
,p_items_label_column_name=>'NAME'
,p_color=>'&COLORS.'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(18362773959956763)
,p_chart_id=>wwv_flow_imp.id(18361632401956762)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>'Puntos Fantasy'
,p_format_type=>'decimal'
,p_decimal_places=>2
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(18362145440956762)
,p_chart_id=>wwv_flow_imp.id(18361632401956762)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_title=>'Proveedor'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18725562129229107)
,p_name=>'P1_TEMPORADA'
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
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(18475486805716433)
,p_computation_sequence=>10
,p_computation_item=>'P1_TEMPORADA'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'ID_TEMPORADA_ACTUAL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(18475526912716434)
,p_name=>'Refrescar Grafico 1'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1_TEMPORADA'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18798407137040532)
,p_event_id=>wwv_flow_imp.id(18475526912716434)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(18797056728040518)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18475728548716436)
,p_event_id=>wwv_flow_imp.id(18475526912716434)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(36713102027907307)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18475841119716437)
,p_event_id=>wwv_flow_imp.id(18475526912716434)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(36716032773908258)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18278546550614946)
,p_event_id=>wwv_flow_imp.id(18475526912716434)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(18278094394614941)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18795420083040502)
,p_event_id=>wwv_flow_imp.id(18475526912716434)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(18278658845614947)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18796919156040517)
,p_event_id=>wwv_flow_imp.id(18475526912716434)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(18795576951040503)
);
wwv_flow_imp.component_end;
end;
/
