prompt --application/pages/page_00001
begin
--   Manifest
--     PAGE: 00001
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
 p_id=>1
,p_name=>'Home'
,p_alias=>'HOME'
,p_step_title=>'Fantasy Total'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'13'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(18278094394614941)
,p_plug_name=>'contribucion-posicion'
,p_title=>unistr('Contribuci\00F3n por posici\00F3n')
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>110
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P1_TEMPORADA,P1_EQUIPOFANTASY'
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
'    and PR.IDFANTASYWORKTEAM = PO.IDFANTASYWORKTEAM',
'    AND PR.week = Po.week',
'    AND PR.idfantasyplayer = PO.idfantasyplayer',
'    AND PR.idfantasyseason = :P1_TEMPORADA',
'    AND PR.IDFANTASYWORKTEAM = :P1_EQUIPOFANTASY',
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
,p_plug_name=>'contribucion-jugador'
,p_title=>unistr('Contribuci\00F3n por jugador')
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>120
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P1_TEMPORADA,P1_EQUIPOFANTASY'
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
'  AND PO.IDFANTASYWORKTEAM = :P1_EQUIPOFANTASY',
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
,p_plug_name=>'semanal-jugadores'
,p_title=>'Semanal Jugadores'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>130
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P1_TEMPORADA,P1_EQUIPOFANTASY'
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
'        AND PO.IDFANTASYSEASON = :P1_TEMPORADA',
'        AND PO.IDFANTASYWORKTEAM = :P1_EQUIPOFANTASY',
'      ),',
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
'  and pl.IDFANTASYWORKTEAM = :P1_EQUIPOFANTASY',
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
,p_plug_name=>'semanal-proveedor'
,p_title=>'Semanal Proveedor'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P1_TEMPORADA,P1_EQUIPOFANTASY'
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
'  su.colour colors,  ',
'  SUM(PO.fantasypoints) AS PUNTOS',
'FROM',
'  FANTASY_PROYECTION PR,',
'  FANTASY_SUPPLIER SU,',
'  FANTASY_POINT PO',
'WHERE PR.idfantasysupplier = SU.ID',
'  AND PR.idfantasyseason = PO.idfantasyseason',
'  AND PR.IDFANTASYWORKTEAM = PO.IDFANTASYWORKTEAM',
'  AND PR.week = Po.week',
'  AND PR.idfantasyplayer = PO.idfantasyplayer',
'  AND PR.idfantasyseason = :P1_TEMPORADA  ',
'  AND PR.IDFANTASYWORKTEAM = :P1_EQUIPOFANTASY',
'GROUP BY SU.name, su.colour, SU.VISUALORDER, PR.week',
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
 p_id=>wwv_flow_imp.id(32319456210131207)
,p_plug_name=>'proveedor-acierto'
,p_title=>'Proveedor - % acierto'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P1_TEMPORADA,P1_EQUIPOFANTASY'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(32319500183131208)
,p_region_id=>wwv_flow_imp.id(32319456210131207)
,p_chart_type=>'bar'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
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
 p_id=>wwv_flow_imp.id(32319637260131209)
,p_chart_id=>wwv_flow_imp.id(32319500183131208)
,p_seq=>10
,p_name=>'Series 1'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- % de acierto medio por proveedor para UNA temporada + UN equipo fantasy',
unistr('-- Par\00E1metros APEX: :P1_TEMPORADA, :P1_EQUIPOFANTASY'),
'WITH',
'-- posiciones del equipo ordenadas por visualorder (rn = 1..N)',
'positions AS (',
'  SELECT p.id pos_id,',
'         p.visualorder,',
'         ROW_NUMBER() OVER (ORDER BY p.visualorder) rn',
'  FROM FANTASY_POSITION_WORKTEAM pw',
'  JOIN FANTASY_POSITION p ON pw.idfantasyposition = p.id',
'  WHERE pw.idfantasyworkteam = :P1_EQUIPOFANTASY',
'),',
'-- semanas disponibles: aquellas semanas con al menos un registro de puntos para la temporada+equipo',
'weeks AS (',
'  SELECT DISTINCT fp.week',
'  FROM FANTASY_POINT fp',
'  WHERE fp.idfantasyseason = :P1_TEMPORADA',
'    AND fp.idfantasyworkteam = :P1_EQUIPOFANTASY',
'),',
'-- puntos por jugador para la temporada/equipo por semana',
'players_points AS (',
'  SELECT pl.id player_id,',
'         pl.idfantasypositionbase,',
'         pt.week,',
'         pt.fantasypoints',
'  FROM FANTASY_PLAYER pl',
'  JOIN FANTASY_POINT pt ON pt.idfantasyplayer = pl.id',
'  WHERE pt.idfantasyseason = :P1_TEMPORADA',
'    AND pt.idfantasyworkteam = :P1_EQUIPOFANTASY',
'    AND pl.idfantasyworkteam = :P1_EQUIPOFANTASY',
'    AND pl.idfantasyseason = :P1_TEMPORADA',
'),',
unistr('-- combinamos semanas x posiciones y emparejamos con jugadores elegibles para esa posici\00F3n'),
'eligible AS (',
'  SELECT w.week,',
'         pos.pos_id,',
'         pos.rn,',
'         pp.player_id,',
'         pp.idfantasypositionbase,',
'         pp.fantasypoints',
'  FROM weeks w',
'  CROSS JOIN positions pos',
'  JOIN FANTASY_POSITION_BASE_RELA rela ON rela.idfantasyposition = pos.pos_id',
'  JOIN players_points pp ON pp.idfantasypositionbase = rela.idfantasypositionbase',
'                       AND pp.week = w.week',
'),',
'ordered_positions AS (',
'  SELECT pos_id, rn FROM positions',
'),',
unistr('-- CTE recursivo: asigna por orden (rn) el mejor jugador disponible para cada posici\00F3n'),
'ideal_recursive (week, rn, pos_id, player_id, points, selected_players) AS (',
unistr('  -- Anchor: asignaci\00F3n para la primera posici\00F3n (rn = 1)'),
'  SELECT e.week, e.rn, e.pos_id,',
'    (SELECT player_id',
'     FROM (SELECT player_id, fantasypoints',
'           FROM eligible ee',
'           WHERE ee.week = e.week AND ee.pos_id = e.pos_id',
'           ORDER BY fantasypoints DESC, player_id)',
'     WHERE rownum = 1) AS player_id,',
'    NVL((SELECT fantasypoints',
'         FROM (SELECT player_id, fantasypoints',
'               FROM eligible ee',
'               WHERE ee.week = e.week AND ee.pos_id = e.pos_id',
'               ORDER BY fantasypoints DESC, player_id)',
'         WHERE rownum = 1), 0) AS points,',
'    NVL(TO_CHAR((SELECT player_id',
'                 FROM (SELECT player_id',
'                       FROM eligible ee',
'                       WHERE ee.week = e.week AND ee.pos_id = e.pos_id',
'                       ORDER BY fantasypoints DESC, player_id)',
'                 WHERE rownum = 1)), '''') AS selected_players',
'  FROM (SELECT DISTINCT week, rn, pos_id FROM eligible) e',
'  WHERE e.rn = 1',
'',
'  UNION ALL',
'',
unistr('  -- Paso recursivo: para la siguiente posici\00F3n (rn + 1) selecciona el mejor jugador'),
unistr('  -- que NO est\00E9 en selected_players'),
'  SELECT i.week, op.rn, op.pos_id,',
'    (SELECT player_id',
'     FROM (SELECT player_id, fantasypoints',
'           FROM eligible ee',
'           WHERE ee.week = i.week',
'             AND ee.pos_id = op.pos_id',
'             AND instr('',''||NVL(i.selected_players,'''')||'','', '',''||ee.player_id||'','') = 0',
'           ORDER BY fantasypoints DESC, player_id)',
'     WHERE rownum = 1) AS player_id,',
'    NVL((SELECT fantasypoints',
'         FROM (SELECT player_id, fantasypoints',
'               FROM eligible ee',
'               WHERE ee.week = i.week',
'                 AND ee.pos_id = op.pos_id',
'                 AND instr('',''||NVL(i.selected_players,'''')||'','', '',''||ee.player_id||'','') = 0',
'               ORDER BY fantasypoints DESC, player_id)',
'         WHERE rownum = 1), 0) AS points,',
'    NVL(i.selected_players,'''') ||',
'      CASE',
'        WHEN (SELECT player_id',
'              FROM (SELECT player_id',
'                    FROM eligible ee',
'                    WHERE ee.week = i.week',
'                      AND ee.pos_id = op.pos_id',
'                      AND instr('',''||NVL(i.selected_players,'''')||'','', '',''||ee.player_id||'','') = 0',
'                    ORDER BY fantasypoints DESC, player_id)',
'              WHERE rownum = 1) IS NOT NULL',
'        THEN '','' || TO_CHAR((SELECT player_id',
'                             FROM (SELECT player_id',
'                                   FROM eligible ee',
'                                   WHERE ee.week = i.week',
'                                     AND ee.pos_id = op.pos_id',
'                                     AND instr('',''||NVL(i.selected_players,'''')||'','', '',''||ee.player_id||'','') = 0',
'                                   ORDER BY fantasypoints DESC, player_id)',
'                             WHERE rownum = 1))',
'        ELSE ''''',
'      END AS selected_players',
'  FROM ideal_recursive i',
'  JOIN ordered_positions op ON op.rn = i.rn + 1',
')',
',',
unistr('-- Alineaci\00F3n ideal por semana (una fila por posici\00F3n seleccionada)'),
'ideal_lineup AS (',
'  SELECT week, pos_id, player_id, NVL(points,0) points',
'  FROM ideal_recursive',
'),',
unistr('-- Total de la alineaci\00F3n ideal por semana'),
'ideal_total AS (',
'  SELECT week, SUM(points) AS ideal_points',
'  FROM ideal_lineup',
'  GROUP BY week',
'),',
unistr('-- Puntos de cada proveedor en cada semana (s\00F3lo semanas donde el proveedor tuvo proyecciones)'),
'supplier_week_points AS (',
'  SELECT pr.idfantasysupplier supplier_id,',
'         pr.week,',
'         SUM(NVL(fp.fantasypoints,0)) supplier_points',
'  FROM FANTASY_PROYECTION pr',
'  JOIN FANTASY_POINT fp',
'    ON pr.idfantasyseason = fp.idfantasyseason',
'   AND pr.idfantasyworkteam = fp.idfantasyworkteam',
'   AND pr.week = fp.week',
'   AND pr.idfantasyplayer = fp.idfantasyplayer',
'  WHERE pr.idfantasyseason = :P1_TEMPORADA',
'    AND pr.idfantasyworkteam = :P1_EQUIPOFANTASY',
'  GROUP BY pr.idfantasysupplier, pr.week',
'),',
unistr('-- % semanal por proveedor (se consideran s\00F3lo semanas donde ideal_points > 0 y proveedor tiene proyecciones)'),
'week_pct AS (',
'  SELECT s.supplier_id, s.week,',
'         s.supplier_points,',
'         it.ideal_points,',
'         CASE WHEN it.ideal_points > 0 THEN ROUND( (s.supplier_points / it.ideal_points) * 100, 2) ELSE NULL END pct',
'  FROM supplier_week_points s',
'  JOIN ideal_total it ON it.week = s.week',
')',
'-- Resultado final: media de los % semanales por proveedor (para la temporada + equipo)',
'SELECT',
'  su.id supplier_id,',
'  su.name supplier_name,',
'  su.colour colors,',
'  ROUND(AVG(w.pct), 2) promedio_pct,',
'  COUNT(w.week) semanas_evaluadas,',
'  su.NAME|| CHR(10) ||'' - Promedio: ''|| ROUND(AVG(w.pct), 2)||CHR(10) ||'' - Semanas: ''|| COUNT(w.week) tooltip',
'FROM week_pct w',
'JOIN FANTASY_SUPPLIER su ON su.id = w.supplier_id',
'WHERE w.pct IS NOT NULL',
'GROUP BY su.id, su.name, su.colour',
'ORDER BY promedio_pct DESC'))
,p_max_row_count=>99999999999999
,p_items_value_column_name=>'PROMEDIO_PCT'
,p_items_label_column_name=>'SUPPLIER_NAME'
,p_items_short_desc_column_name=>'TOOLTIP'
,p_color=>'&COLORS.'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(32320723490131220)
,p_chart_id=>wwv_flow_imp.id(32319500183131208)
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
 p_id=>wwv_flow_imp.id(32320879169131221)
,p_chart_id=>wwv_flow_imp.id(32319500183131208)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(33528924489593806)
,p_plug_name=>'proveedor-acierto-datos'
,p_title=>'Datos Desglosados'
,p_parent_plug_id=>wwv_flow_imp.id(32319456210131207)
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
 p_id=>wwv_flow_imp.id(32323238067131245)
,p_plug_name=>'proveedor-acierto-datos-desglo'
,p_title=>'% acierto desglo'
,p_parent_plug_id=>wwv_flow_imp.id(33528924489593806)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('-- Informe detallado por semana x proveedor con alineaci\00F3n ideal y alineaci\00F3n del proveedor'),
unistr('-- Par\00E1metros APEX: :P1_TEMPORADA, :P1_EQUIPOFANTASY'),
'WITH',
'-- posiciones del equipo ordenadas por visualorder (rn = 1..N)',
'positions AS (',
'  SELECT p.id pos_id,',
'         p.position pos_name,',
'         p.visualorder,',
'         ROW_NUMBER() OVER (ORDER BY p.visualorder) rn',
'  FROM FANTASY_POSITION_WORKTEAM pw',
'  JOIN FANTASY_POSITION p ON pw.idfantasyposition = p.id',
'  WHERE pw.idfantasyworkteam = :P1_EQUIPOFANTASY',
'),',
'-- semanas disponibles: aquellas semanas con al menos un registro de puntos para la temporada+equipo',
'weeks AS (',
'  SELECT DISTINCT fp.week',
'  FROM FANTASY_POINT fp',
'  WHERE fp.idfantasyseason = :P1_TEMPORADA',
'    AND fp.idfantasyworkteam = :P1_EQUIPOFANTASY',
'),',
'-- puntos por jugador para la temporada/equipo por semana',
'players_points AS (',
'  SELECT pl.id player_id,',
'         pl.idfantasypositionbase,',
'         pt.week,',
'         pt.fantasypoints',
'  FROM FANTASY_PLAYER pl',
'  JOIN FANTASY_POINT pt ON pt.idfantasyplayer = pl.id',
'  WHERE pt.idfantasyseason = :P1_TEMPORADA',
'    AND pt.idfantasyworkteam = :P1_EQUIPOFANTASY',
'    AND pl.idfantasyworkteam = :P1_EQUIPOFANTASY',
'    AND pl.idfantasyseason = :P1_TEMPORADA',
'),',
unistr('-- combinamos semanas x posiciones y emparejamos con jugadores elegibles para esa posici\00F3n'),
'eligible AS (',
'  SELECT w.week,',
'         pos.pos_id,',
'         pos.rn,',
'         pp.player_id,',
'         pp.idfantasypositionbase,',
'         pp.fantasypoints',
'  FROM weeks w',
'  CROSS JOIN positions pos',
'  JOIN FANTASY_POSITION_BASE_RELA rela ON rela.idfantasyposition = pos.pos_id',
'  JOIN players_points pp ON pp.idfantasypositionbase = rela.idfantasypositionbase',
'                       AND pp.week = w.week',
'),',
'ordered_positions AS (',
'  SELECT pos_id, rn FROM positions',
'),',
unistr('-- CTE recursivo: asigna por orden (rn) el mejor jugador disponible para cada posici\00F3n'),
'ideal_recursive (week, rn, pos_id, player_id, points, selected_players) AS (',
unistr('  -- Anchor: asignaci\00F3n para la primera posici\00F3n (rn = 1)'),
'  SELECT e.week, e.rn, e.pos_id,',
'    (SELECT player_id',
'     FROM (SELECT player_id, fantasypoints',
'           FROM eligible ee',
'           WHERE ee.week = e.week AND ee.pos_id = e.pos_id',
'           ORDER BY fantasypoints DESC, player_id)',
'     WHERE rownum = 1) AS player_id,',
'    NVL((SELECT fantasypoints',
'         FROM (SELECT player_id, fantasypoints',
'               FROM eligible ee',
'               WHERE ee.week = e.week AND ee.pos_id = e.pos_id',
'               ORDER BY fantasypoints DESC, player_id)',
'         WHERE rownum = 1), 0) AS points,',
'    NVL(TO_CHAR((SELECT player_id',
'                 FROM (SELECT player_id',
'                       FROM eligible ee',
'                       WHERE ee.week = e.week AND ee.pos_id = e.pos_id',
'                       ORDER BY fantasypoints DESC, player_id)',
'                 WHERE rownum = 1)), '''') AS selected_players',
'  FROM (SELECT DISTINCT week, rn, pos_id FROM eligible) e',
'  WHERE e.rn = 1',
'',
'  UNION ALL',
'',
unistr('  -- Paso recursivo: para la siguiente posici\00F3n (rn + 1) selecciona el mejor jugador'),
unistr('  -- que NO est\00E9 en selected_players'),
'  SELECT i.week, op.rn, op.pos_id,',
'    (SELECT player_id',
'     FROM (SELECT player_id, fantasypoints',
'           FROM eligible ee',
'           WHERE ee.week = i.week',
'             AND ee.pos_id = op.pos_id',
'             AND instr('',''||NVL(i.selected_players,'''')||'','', '',''||ee.player_id||'','') = 0',
'           ORDER BY fantasypoints DESC, player_id)',
'     WHERE rownum = 1) AS player_id,',
'    NVL((SELECT fantasypoints',
'         FROM (SELECT player_id, fantasypoints',
'               FROM eligible ee',
'               WHERE ee.week = i.week',
'                 AND ee.pos_id = op.pos_id',
'                 AND instr('',''||NVL(i.selected_players,'''')||'','', '',''||ee.player_id||'','') = 0',
'               ORDER BY fantasypoints DESC, player_id)',
'         WHERE rownum = 1), 0) AS points,',
'    NVL(i.selected_players,'''') ||',
'      CASE',
'        WHEN (SELECT player_id',
'              FROM (SELECT player_id',
'                    FROM eligible ee',
'                    WHERE ee.week = i.week',
'                      AND ee.pos_id = op.pos_id',
'                      AND instr('',''||NVL(i.selected_players,'''')||'','', '',''||ee.player_id||'','') = 0',
'                    ORDER BY fantasypoints DESC, player_id)',
'              WHERE rownum = 1) IS NOT NULL',
'        THEN '','' || TO_CHAR((SELECT player_id',
'                            FROM (SELECT player_id',
'                                  FROM eligible ee',
'                                  WHERE ee.week = i.week',
'                                    AND ee.pos_id = op.pos_id',
'                                    AND instr('',''||NVL(i.selected_players,'''')||'','', '',''||ee.player_id||'','') = 0',
'                                  ORDER BY fantasypoints DESC, player_id)',
'                            WHERE rownum = 1))',
'        ELSE ''''',
'      END AS selected_players',
'  FROM ideal_recursive i',
'  JOIN ordered_positions op ON op.rn = i.rn + 1',
')',
',',
unistr('-- Alineaci\00F3n ideal por semana (una fila por posici\00F3n seleccionada)'),
'ideal_lineup AS (',
'  SELECT week, pos_id, player_id, NVL(points,0) points',
'  FROM ideal_recursive',
'),',
unistr('-- Total de la alineaci\00F3n ideal por semana'),
'ideal_total AS (',
'  SELECT week, SUM(points) AS ideal_points',
'  FROM ideal_lineup',
'  GROUP BY week',
'),',
unistr('-- Texto representativo de la alineaci\00F3n ideal por semana'),
'ideal_lineup_text AS (',
'  SELECT it.week,',
'         LISTAGG(p.position || '': '' ||',
'                 NVL(pl.name, ''(sin jugador)'') || '' ('' || TO_CHAR(ROUND(itl.points,2)) || '')'', CHR(10)',
'                 ) WITHIN GROUP (ORDER BY p.visualorder) AS ideal_lineup_desc',
'  FROM ideal_lineup itl',
'  JOIN FANTASY_POSITION p ON p.id = itl.pos_id',
'  LEFT JOIN FANTASY_PLAYER pl ON pl.id = itl.player_id',
'  JOIN ideal_total it ON it.week = itl.week',
'  GROUP BY it.week',
'),',
unistr('-- Puntos de cada proveedor en cada semana (s\00F3lo semanas donde el proveedor tuvo proyecciones)'),
'supplier_week_points AS (',
'  SELECT pr.idfantasysupplier supplier_id,',
'         pr.week,',
'         SUM(NVL(fp.fantasypoints,0)) supplier_points',
'  FROM FANTASY_PROYECTION pr',
'  JOIN FANTASY_POINT fp',
'    ON pr.idfantasyseason = fp.idfantasyseason',
'   AND pr.idfantasyworkteam = fp.idfantasyworkteam',
'   AND pr.week = fp.week',
'   AND pr.idfantasyplayer = fp.idfantasyplayer',
'  WHERE pr.idfantasyseason = :P1_TEMPORADA',
'    AND pr.idfantasyworkteam = :P1_EQUIPOFANTASY',
'  GROUP BY pr.idfantasysupplier, pr.week',
'),',
unistr('-- Texto representativo de la alineaci\00F3n del proveedor por semana (LISTAGG por posici\00F3n visualorder)'),
'supplier_lineup_text AS (',
'  SELECT pr.idfantasysupplier supplier_id,',
'         pr.week,',
'         LISTAGG(pos.position || '': '' || NVL(pl.name, ''(sin jugador)'') || '' ('' || NVL(TO_CHAR(ROUND(fp.fantasypoints,2)),''0'') || '')'', CHR(10))',
'           WITHIN GROUP (ORDER BY pos.visualorder) AS supplier_lineup_desc',
'  FROM FANTASY_PROYECTION pr',
'  JOIN FANTASY_POSITION pos ON pos.id = pr.idfantasyposition',
'  LEFT JOIN FANTASY_PLAYER pl ON pl.id = pr.idfantasyplayer',
'  LEFT JOIN FANTASY_POINT fp ON fp.idfantasyseason = pr.idfantasyseason',
'                        AND fp.idfantasyworkteam = pr.idfantasyworkteam',
'                        AND fp.week = pr.week',
'                        AND fp.idfantasyplayer = pr.idfantasyplayer',
'  WHERE pr.idfantasyseason = :P1_TEMPORADA',
'    AND pr.idfantasyworkteam = :P1_EQUIPOFANTASY',
'  GROUP BY pr.idfantasysupplier, pr.week',
')',
'-- Resultado final: una fila por semana + proveedor con todos los campos pedidos',
'SELECT',
'  it.week "Semana",',
'  it.ideal_points "Puntuacion_Alineacion_Ideal",',
unistr('  NVL(ilt.ideal_lineup_desc, ''(sin alineaci\00F3n ideal)'') "Alineacion_Ideal",'),
'  su.id supplier_id,',
'  su.name proveedor,',
'  su.visualorder orden_visual_proveedor,',
'  swp.supplier_points "Puntuacion_Proveedor",',
unistr('  NVL(slt.supplier_lineup_desc, ''(sin alineaci\00F3n de proveedor)'') "Alineacion_Proveedor",'),
'  CASE WHEN it.ideal_points > 0 THEN ROUND( (swp.supplier_points / it.ideal_points) * 100, 2) ELSE NULL END "Porcentaje_Acierto"',
'FROM supplier_week_points swp',
'JOIN ideal_total it',
'  ON it.week = swp.week',
'JOIN FANTASY_SUPPLIER su ON su.id = swp.supplier_id',
'LEFT JOIN ideal_lineup_text ilt ON ilt.week = it.week',
'LEFT JOIN supplier_lineup_text slt ON slt.supplier_id = swp.supplier_id AND slt.week = swp.week',
'WHERE it.ideal_points IS NOT NULL',
'ORDER BY it.week DESC, su.visualorder;'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'% acierto desglo'
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
 p_id=>wwv_flow_imp.id(32323318219131246)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'50'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'JORTRI'
,p_internal_uid=>32323318219131246
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(32323494097131247)
,p_db_column_name=>'Semana'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Semana'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(32323565811131248)
,p_db_column_name=>'Puntuacion_Alineacion_Ideal'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Puntuacion Alineacion Ideal'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(32323607091131249)
,p_db_column_name=>'Alineacion_Ideal'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Alineacion Ideal'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(32323702147131250)
,p_db_column_name=>'SUPPLIER_ID'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Supplier Id'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(33528434808593801)
,p_db_column_name=>'PROVEEDOR'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Proveedor'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(33528596748593802)
,p_db_column_name=>'ORDEN_VISUAL_PROVEEDOR'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Orden Visual Proveedor'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(33528650138593803)
,p_db_column_name=>'Puntuacion_Proveedor'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Puntuacion Proveedor'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(33528751029593804)
,p_db_column_name=>'Alineacion_Proveedor'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Alineacion Proveedor'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(33528846021593805)
,p_db_column_name=>'Porcentaje_Acierto'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Porcentaje Acierto'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(33538468351612445)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_type=>'REPORT'
,p_report_alias=>'335385'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>25
,p_report_columns=>'Semana:Puntuacion_Alineacion_Ideal:Alineacion_Ideal:PROVEEDOR:Puntuacion_Proveedor:Alineacion_Proveedor:Porcentaje_Acierto:'
,p_sort_column_1=>'Semana'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'ORDEN_VISUAL_PROVEEDOR'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
,p_break_on=>'Semana:Puntuacion_Alineacion_Ideal:Alineacion_Ideal'
,p_break_enabled_on=>'Semana:Puntuacion_Alineacion_Ideal:Alineacion_Ideal'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(36713102027907307)
,p_plug_name=>'proveedor-puntuacion-win'
,p_title=>unistr('Proveedor - Puntuaci\00F3n Win')
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>70
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P1_TEMPORADA,P1_EQUIPOFANTASY'
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
'  su.colour colors,',
'  SUM(va.WINPOINT) AS PUNTOSWIN',
'FROM',
'  FANTASY_SUPPLIER SU,',
'  FANTASY_VALUE VA',
'WHERE va.IDFANTASYSUPPLIER = su.id',
'  AND va.idfantasyseason = :P1_TEMPORADA',
'  AND VA.IDFANTASYWORKTEAM = :P1_EQUIPOFANTASY',
'GROUP BY SU.name, su.colour',
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
,p_plug_name=>'proveedor-puntuacion-fantasy'
,p_title=>unistr('Proveedor - Puntuaci\00F3n Fantasy')
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>80
,p_plug_new_grid_row=>false
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P1_TEMPORADA,P1_EQUIPOFANTASY'
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
,p_show_group_name=>true
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
'  su.colour colors,',
'  SUM(PO.fantasypoints) AS PUNTOS',
'FROM',
'  FANTASY_PROYECTION PR,',
'  FANTASY_SUPPLIER SU,',
'  FANTASY_POINT PO',
'WHERE PR.idfantasysupplier = SU.ID',
'  AND PR.idfantasyseason = PO.idfantasyseason',
'  AND PR.IDFANTASYWORKTEAM = PO.IDFANTASYWORKTEAM',
'  AND PR.week = Po.week',
'  AND PR.idfantasyplayer = PO.idfantasyplayer',
'  AND PR.idfantasyseason = :P1_TEMPORADA',
'  AND PR.IDFANTASYWORKTEAM = :P1_EQUIPOFANTASY',
'GROUP BY SU.name, su.colour',
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
 p_id=>wwv_flow_imp.id(18465410937230801)
,p_name=>'P1_EQUIPOFANTASY'
,p_item_sequence=>50
,p_prompt=>'Equipo Fantasy'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'EQUIPOS_FANTASY'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT workteam as display, id as value',
'FROM FANTASY_WORKTEAM',
'order by id asc'))
,p_cHeight=>1
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18725562129229107)
,p_name=>'P1_TEMPORADA'
,p_item_sequence=>40
,p_prompt=>'Temporada'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'TEMPORADAS_EXISTENTES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT season as display, id as value',
'FROM FANTASY_SEASON',
'order by season desc'))
,p_cHeight=>1
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(18475486805716433)
,p_computation_sequence=>10
,p_computation_item=>'P1_TEMPORADA'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'ID_TEMPORADA_ACTUAL'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(18470140611230848)
,p_computation_sequence=>20
,p_computation_item=>'P1_EQUIPOFANTASY'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'ID_EQUIPO_FANTASY_INICIO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(18602008579886902)
,p_name=>'Cargar anualidad global'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1_TEMPORADA'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18602176770886903)
,p_event_id=>wwv_flow_imp.id(18602008579886902)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Asignar valor anualidad global'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    :ID_TEMPORADA_ACTUAL := :P1_TEMPORADA;',
'    SELECT SEASON',
'    INTO :TEMPORADA_ACTUAL',
'    FROM FANTASY_SEASON',
'    WHERE ID = :ID_TEMPORADA_ACTUAL;',
'END;'))
,p_attribute_02=>'P1_TEMPORADA'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18602231528886904)
,p_event_id=>wwv_flow_imp.id(18602008579886902)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(37229574977158420)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(18469640967230843)
,p_name=>'Cargar equipo global'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1_EQUIPOFANTASY'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18469714429230844)
,p_event_id=>wwv_flow_imp.id(18469640967230843)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Asignar valor equipo global'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    :ID_EQUIPO_FANTASY_INICIO := :P1_EQUIPOFANTASY;',
'    SELECT WORKTEAM',
'    INTO :EQUIPO_FANTASY_INICIO',
'    FROM FANTASY_WORKTEAM',
'    WHERE ID = :ID_EQUIPO_FANTASY_INICIO;    ',
'END;',
'',
''))
,p_attribute_02=>'P1_EQUIPOFANTASY'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18469804696230845)
,p_event_id=>wwv_flow_imp.id(18469640967230843)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(37229574977158420)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(18475526912716434)
,p_name=>'Refrescar Grafico 1'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1_TEMPORADA,P1_EQUIPOFANTASY'
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
,p_attribute_01=>'N'
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
,p_attribute_01=>'N'
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
,p_attribute_01=>'N'
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
,p_attribute_01=>'N'
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
,p_attribute_01=>'N'
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
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(32320969765131222)
,p_event_id=>wwv_flow_imp.id(18475526912716434)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(32319456210131207)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(33529109931593808)
,p_event_id=>wwv_flow_imp.id(18475526912716434)
,p_event_result=>'TRUE'
,p_action_sequence=>100
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(32323238067131245)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
