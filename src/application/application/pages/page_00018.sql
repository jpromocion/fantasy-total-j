prompt --application/pages/page_00018
begin
--   Manifest
--     PAGE: 00018
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
 p_id=>18
,p_name=>'Resumen Semanal'
,p_alias=>'RESUMEN-MENSUAL'
,p_step_title=>'Resumen Semanal'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>'#regiones_selector .t-Region-header { display: none !important; }'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(37037477226868772)
,p_plug_name=>'Regiones'
,p_region_name=>'regiones_selector'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>70
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
 p_id=>wwv_flow_imp.id(33529036061593807)
,p_plug_name=>'Mega resumen'
,p_region_name=>'mega_resumen'
,p_parent_plug_id=>wwv_flow_imp.id(37037477226868772)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(33529503444593812)
,p_plug_name=>'Mega Resumen'
,p_parent_plug_id=>wwv_flow_imp.id(33529036061593807)
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Resumen % acierto por proveedor para UNA temporada / equipo / semana',
unistr('-- Par\00E1metros APEX: :P18_TEMPORADA, :P18_EQUIPOFANTASY, :P18_SEMANA'),
'WITH',
'-- posiciones del equipo ordenadas por visualorder (rn = 1..N)',
'positions AS (',
'  SELECT p.id pos_id,',
'         p.position pos_name,',
'         p.visualorder,',
'         ROW_NUMBER() OVER (ORDER BY p.visualorder) rn',
'  FROM FANTASY_POSITION_WORKTEAM pw',
'  JOIN FANTASY_POSITION p ON pw.idfantasyposition = p.id',
'  WHERE pw.idfantasyworkteam = :P18_EQUIPOFANTASY',
'),',
'-- lista de jugadores del equipo (filtro por temporada/equipo)',
'team_players AS (',
'  SELECT pl.id player_id',
'  FROM FANTASY_PLAYER pl',
'  WHERE pl.idfantasyworkteam = :P18_EQUIPOFANTASY',
'    AND pl.idfantasyseason = :P18_TEMPORADA',
'),',
unistr('-- posiciones posibles por jugador: posici\00F3n base + posiciones adicionales en la tabla hija'),
'players_positions AS (',
unistr('  -- posici\00F3n base del jugador'),
'  SELECT DISTINCT pl.id AS player_id,',
'         pl.idfantasypositionbase',
'  FROM FANTASY_PLAYER pl',
'  WHERE pl.idfantasyworkteam = :P18_EQUIPOFANTASY',
'    AND pl.idfantasyseason = :P18_TEMPORADA',
'',
'  UNION',
'',
'  -- posiciones adicionales registradas en la tabla hija',
'  SELECT DISTINCT fppa.idfantasyplayer AS player_id,',
'         fppa.idfantasypositionbase',
'  FROM FANTASY_PLAYER_POSITION_BASE_ADI fppa',
'  WHERE fppa.idfantasyplayer IN (SELECT player_id FROM team_players)',
'),',
'-- puntos por jugador PARA CADA una de sus posiciones posibles para la temporada/equipo en la semana concreta',
'players_points AS (',
'  SELECT pp.player_id,',
'         pp.idfantasypositionbase,',
'         pt.week,',
'         NVL(pt.fantasypoints,0) fantasypoints',
'  FROM players_positions pp',
'  JOIN FANTASY_POINT pt ON pt.idfantasyplayer = pp.player_id',
'  WHERE pt.idfantasyseason = :P18_TEMPORADA',
'    AND pt.idfantasyworkteam = :P18_EQUIPOFANTASY',
'    AND pt.week = :P18_SEMANA',
'),',
unistr('-- jugadores elegibles por posici\00F3n (para la construcci\00F3n de la alineaci\00F3n ideal)'),
'eligible AS (',
'  SELECT pos.pos_id,',
'         pos.visualorder pos_visual,',
'         pos.rn,',
'         pp.player_id,',
'         pp.idfantasypositionbase,',
'         pp.fantasypoints',
'  FROM positions pos',
'  JOIN FANTASY_POSITION_BASE_RELA rela ON rela.idfantasyposition = pos.pos_id',
'  JOIN players_points pp ON pp.idfantasypositionbase = rela.idfantasypositionbase',
'),',
'ordered_positions AS (',
'  SELECT pos_id, visualorder, rn FROM positions',
'),',
unistr('-- CTE recursivo: asigna por orden visual la mejor opci\00F3n disponible para cada posici\00F3n'),
'ideal_recursive (rn, pos_id, player_id, points, selected_players) AS (',
unistr('  -- Anchor: primera posici\00F3n (rn = 1)'),
'  SELECT p.rn, p.pos_id,',
'    (SELECT player_id',
'     FROM (SELECT player_id, fantasypoints',
'           FROM eligible ee',
'           WHERE ee.pos_id = p.pos_id',
'           ORDER BY fantasypoints DESC, player_id)',
'     WHERE rownum = 1),',
'    NVL((SELECT fantasypoints',
'         FROM (SELECT player_id, fantasypoints',
'               FROM eligible ee',
'               WHERE ee.pos_id = p.pos_id',
'               ORDER BY fantasypoints DESC, player_id)',
'         WHERE rownum = 1), 0),',
'    NVL(TO_CHAR((SELECT player_id',
'                 FROM (SELECT player_id',
'                       FROM eligible ee',
'                       WHERE ee.pos_id = p.pos_id',
'                       ORDER BY fantasypoints DESC, player_id)',
'                 WHERE rownum = 1)), '''')',
'  FROM (SELECT pos_id, visualorder, rn FROM positions) p',
'  WHERE p.rn = 1',
'',
'  UNION ALL',
'',
unistr('  -- Paso recursivo: siguiente posici\00F3n, evitando jugadores ya asignados'),
'  SELECT i.rn + 1, op.pos_id,',
'    (SELECT player_id',
'     FROM (SELECT player_id, fantasypoints',
'           FROM eligible ee',
'           WHERE ee.pos_id = op.pos_id',
'             AND instr('',''||NVL(i.selected_players,'''')||'','', '',''||ee.player_id||'','') = 0',
'           ORDER BY fantasypoints DESC, player_id)',
'     WHERE rownum = 1),',
'    NVL((SELECT fantasypoints',
'         FROM (SELECT player_id, fantasypoints',
'               FROM eligible ee',
'               WHERE ee.pos_id = op.pos_id',
'                 AND instr('',''||NVL(i.selected_players,'''')||'','', '',''||ee.player_id||'','') = 0',
'               ORDER BY fantasypoints DESC, player_id)',
'         WHERE rownum = 1), 0),',
'    NVL(i.selected_players,'''') ||',
'      CASE',
'        WHEN (SELECT player_id',
'              FROM (SELECT player_id',
'                    FROM eligible ee',
'                    WHERE ee.pos_id = op.pos_id',
'                      AND instr('',''||NVL(i.selected_players,'''')||'','', '',''||ee.player_id||'','') = 0',
'                    ORDER BY fantasypoints DESC, player_id)',
'              WHERE rownum = 1) IS NOT NULL',
'        THEN '','' || TO_CHAR((SELECT player_id',
'                             FROM (SELECT player_id',
'                                   FROM eligible ee',
'                                   WHERE ee.pos_id = op.pos_id',
'                                     AND instr('',''||NVL(i.selected_players,'''')||'','', '',''||ee.player_id||'','') = 0',
'                                   ORDER BY fantasypoints DESC, player_id)',
'                             WHERE rownum = 1))',
'        ELSE ''''',
'      END',
'  FROM ideal_recursive i',
'  JOIN ordered_positions op ON op.rn = i.rn + 1',
'),',
unistr('-- Alineaci\00F3n ideal (filas por posici\00F3n con su jugador y puntos)'),
'ideal_lineup AS (',
'  SELECT ir.rn AS seq, ir.pos_id, ir.player_id, NVL(ir.points,0) points',
'  FROM ideal_recursive ir',
'),',
unistr('-- Total de la alineaci\00F3n ideal (suma de puntos)'),
'ideal_total AS (',
'  SELECT NVL(SUM(points),0) AS ideal_points FROM ideal_lineup',
'),',
unistr('-- Texto representativo de la alineaci\00F3n ideal (POS: Jugador (puntos)) - texto plano (CHR(10))'),
'ideal_lineup_text AS (',
'  SELECT LISTAGG(p.position || '': '' || NVL(pl.name,''(sin jugador)'') || '' ('' || TO_CHAR(ROUND(il.points,2)) || '')'', CHR(10))',
'           WITHIN GROUP (ORDER BY p.visualorder) AS ideal_lineup_desc',
'  FROM ideal_lineup il',
'  JOIN FANTASY_POSITION p ON p.id = il.pos_id',
'  LEFT JOIN FANTASY_PLAYER pl ON pl.id = il.player_id',
'),',
unistr('-- VERSI\00D3N HTML de la alineaci\00F3n ideal (br + contenedor pre-wrap)'),
'ideal_lineup_html AS (',
'  SELECT ''<div style="white-space:pre-wrap;">'' ||',
'         LISTAGG(p.position || '': '' || NVL(pl.name,''(sin jugador)'') || '' ('' || TO_CHAR(ROUND(il.points,2)) || '')'', ''<br/>'')',
'           WITHIN GROUP (ORDER BY p.visualorder)',
'         || ''</div>'' AS ideal_lineup_desc_html',
'  FROM ideal_lineup il',
'  JOIN FANTASY_POSITION p ON p.id = il.pos_id',
'  LEFT JOIN FANTASY_PLAYER pl ON pl.id = il.player_id',
'),',
unistr('-- proveedores que hicieron proyecciones esa semana y suma de puntos de su alineaci\00F3n'),
'supplier_week_points AS (',
'  SELECT pr.idfantasysupplier supplier_id,',
'         SUM(NVL(fp.fantasypoints,0)) supplier_points',
'  FROM FANTASY_PROYECTION pr',
'  LEFT JOIN FANTASY_POINT fp',
'    ON pr.idfantasyseason = fp.idfantasyseason',
'   AND pr.idfantasyworkteam = fp.idfantasyworkteam',
'   AND pr.week = fp.week',
'   AND pr.idfantasyplayer = fp.idfantasyplayer',
'  WHERE pr.idfantasyseason = :P18_TEMPORADA',
'    AND pr.idfantasyworkteam = :P18_EQUIPOFANTASY',
'    AND pr.week = :P18_SEMANA',
'  GROUP BY pr.idfantasysupplier',
'),',
unistr('-- texto representativo de la alineaci\00F3n que cada proveedor proyect\00F3 (POS: Jugador (puntos)) - texto plano'),
'supplier_lineup_text AS (',
'  SELECT pr.idfantasysupplier supplier_id,',
'         LISTAGG(pos.position || '': '' || NVL(pl.name,''(sin jugador)'') || '' ('' || NVL(TO_CHAR(ROUND(fp.fantasypoints,2)),''0'') || '')'', CHR(10))',
'           WITHIN GROUP (ORDER BY pos.visualorder) AS supplier_lineup_desc',
'  FROM FANTASY_PROYECTION pr',
'  LEFT JOIN FANTASY_PLAYER pl ON pl.id = pr.idfantasyplayer',
'  LEFT JOIN FANTASY_POSITION pos ON pos.id = pr.idfantasyposition',
'  LEFT JOIN FANTASY_POINT fp ON fp.idfantasyseason = pr.idfantasyseason',
'                        AND fp.idfantasyworkteam = pr.idfantasyworkteam',
'                        AND fp.week = pr.week',
'                        AND fp.idfantasyplayer = pr.idfantasyplayer',
'  WHERE pr.idfantasyseason = :P18_TEMPORADA',
'    AND pr.idfantasyworkteam = :P18_EQUIPOFANTASY',
'    AND pr.week = :P18_SEMANA',
'  GROUP BY pr.idfantasysupplier',
'),',
unistr('-- VERSI\00D3N HTML de la alineaci\00F3n del proveedor'),
'supplier_lineup_html AS (',
'  SELECT pr.idfantasysupplier supplier_id,',
'         ''<div style="white-space:pre-wrap;">'' ||',
'         LISTAGG(pos.position || '': '' || NVL(pl.name,''(sin jugador)'') || '' ('' || NVL(TO_CHAR(ROUND(fp.fantasypoints,2)),''0'') || '')'', ''<br/>'')',
'           WITHIN GROUP (ORDER BY pos.visualorder)',
'         || ''</div>'' AS supplier_lineup_desc_html',
'  FROM FANTASY_PROYECTION pr',
'  LEFT JOIN FANTASY_PLAYER pl ON pl.id = pr.idfantasyplayer',
'  LEFT JOIN FANTASY_POSITION pos ON pos.id = pr.idfantasyposition',
'  LEFT JOIN FANTASY_POINT fp ON fp.idfantasyseason = pr.idfantasyseason',
'                        AND fp.idfantasyworkteam = pr.idfantasyworkteam',
'                        AND fp.week = pr.week',
'                        AND fp.idfantasyplayer = pr.idfantasyplayer',
'  WHERE pr.idfantasyseason = :P18_TEMPORADA',
'    AND pr.idfantasyworkteam = :P18_EQUIPOFANTASY',
'    AND pr.week = :P18_SEMANA',
'  GROUP BY pr.idfantasysupplier',
')',
'-- Resultado final: una fila por proveedor con los datos solicitados',
'SELECT',
'  :P18_SEMANA AS Semana,',
'  it.ideal_points AS Puntuacion_Alineacion_Ideal,',
unistr('  NVL(ilt.ideal_lineup_desc, ''(sin alineaci\00F3n ideal)'') AS Alineacion_Ideal,'),
'  ilh.ideal_lineup_desc_html AS Alineacion_Ideal_HTML,',
'  su.id AS Proveedor_ID,',
'  su.name AS Proveedor,',
'  su.visualorder AS Orden_Visual_Proveedor,',
'  NVL(swp.supplier_points,0) AS Puntuacion_Proveedor,',
unistr('  NVL(slt.supplier_lineup_desc, ''(sin alineaci\00F3n de proveedor)'') AS Alineacion_Proveedor,'),
'  slh.supplier_lineup_desc_html AS Alineacion_Proveedor_HTML,',
'  CASE WHEN it.ideal_points > 0 THEN ROUND( (NVL(swp.supplier_points,0) / it.ideal_points) * 100, 2) ELSE NULL END AS Porcentaje_Acierto',
'FROM supplier_week_points swp',
'JOIN FANTASY_SUPPLIER su ON su.id = swp.supplier_id',
'CROSS JOIN ideal_total it',
'LEFT JOIN ideal_lineup_text ilt ON 1 = 1',
'LEFT JOIN ideal_lineup_html ilh ON 1 = 1',
'LEFT JOIN supplier_lineup_text slt ON slt.supplier_id = swp.supplier_id',
'LEFT JOIN supplier_lineup_html slh ON slh.supplier_id = swp.supplier_id;'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P18_TEMPORADA,P18_SEMANA,P18_EQUIPOFANTASY'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
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
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(33529728476593814)
,p_name=>'SEMANA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SEMANA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Semana'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>10
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>2000
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
 p_id=>wwv_flow_imp.id(33529806084593815)
,p_name=>'PUNTUACION_ALINEACION_IDEAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PUNTUACION_ALINEACION_IDEAL'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Puntuacion Alineacion Ideal'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>20
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999G999G999G999G990D00'
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
 p_id=>wwv_flow_imp.id(33529901558593816)
,p_name=>'ALINEACION_IDEAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ALINEACION_IDEAL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Alineacion Ideal - No formateda'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>32767
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
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
 p_id=>wwv_flow_imp.id(33530000001593817)
,p_name=>'PROVEEDOR_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROVEEDOR_ID'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Proveedor Id'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>40
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
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
 p_id=>wwv_flow_imp.id(33530154070593818)
,p_name=>'PROVEEDOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PROVEEDOR'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Proveedor'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
,p_max_length=>100
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(33530247867593819)
,p_name=>'ORDEN_VISUAL_PROVEEDOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ORDEN_VISUAL_PROVEEDOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Orden Visual Proveedor'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>60
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(33530351513593820)
,p_name=>'PUNTUACION_PROVEEDOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PUNTUACION_PROVEEDOR'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Puntuacion Proveedor'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999G999G999G999G990D00'
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
 p_id=>wwv_flow_imp.id(33530471872593821)
,p_name=>'ALINEACION_PROVEEDOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ALINEACION_PROVEEDOR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Alineacion Proveedor - no formateada'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>32767
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
 p_id=>wwv_flow_imp.id(33530552248593822)
,p_name=>'PORCENTAJE_ACIERTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PORCENTAJE_ACIERTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Porcentaje Acierto'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999G999G999G999G990D00'
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
 p_id=>wwv_flow_imp.id(33530762051593824)
,p_name=>'ALINEACION_IDEAL_HTML'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ALINEACION_IDEAL_HTML'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Alineacion Ideal Html - fuente'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>32767
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
 p_id=>wwv_flow_imp.id(33530875587593825)
,p_name=>'ALINEACION_PROVEEDOR_HTML'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ALINEACION_PROVEEDOR_HTML'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Alineacion Proveedor Html - fuente'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>32767
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
 p_id=>wwv_flow_imp.id(33530926988593826)
,p_name=>'ALINEACION_PROVEEDOR_HTMLFORMATEADA'
,p_source_type=>'SQL_EXPRESSION'
,p_source_expression=>'ALINEACION_PROVEEDOR_HTML'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Alineaci\00F3n proveedor')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'format', 'HTML')).to_clob
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
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(33531039837593827)
,p_name=>'ALINEACION_IDEAL_HTML_FOMATEADA'
,p_source_type=>'SQL_EXPRESSION'
,p_source_expression=>'ALINEACION_IDEAL_HTML'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>unistr('Alineaci\00F3n ideal')
,p_heading_alignment=>'LEFT'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'format', 'HTML')).to_clob
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
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(33529633980593813)
,p_internal_uid=>33529633980593813
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
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(33543295531788730)
,p_interactive_grid_id=>wwv_flow_imp.id(33529633980593813)
,p_static_id=>'335433'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(33543471242788730)
,p_report_id=>wwv_flow_imp.id(33543295531788730)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(1258787061835)
,p_view_id=>wwv_flow_imp.id(33543471242788730)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(33530762051593824)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(2232873061838)
,p_view_id=>wwv_flow_imp.id(33543471242788730)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(33530875587593825)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(3194023084749)
,p_view_id=>wwv_flow_imp.id(33543471242788730)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(33530926988593826)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(4491279090486)
,p_view_id=>wwv_flow_imp.id(33543471242788730)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(33531039837593827)
,p_is_visible=>false
,p_is_frozen=>false
,p_break_order=>10
,p_break_is_enabled=>true
,p_break_sort_direction=>'ASC'
,p_break_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(33543917918788731)
,p_view_id=>wwv_flow_imp.id(33543471242788730)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(33529728476593814)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(33544838476788733)
,p_view_id=>wwv_flow_imp.id(33543471242788730)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(33529806084593815)
,p_is_visible=>false
,p_is_frozen=>false
,p_break_order=>5
,p_break_is_enabled=>true
,p_break_sort_direction=>'ASC'
,p_break_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(33545740198788735)
,p_view_id=>wwv_flow_imp.id(33543471242788730)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(33529901558593816)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(33546665257788736)
,p_view_id=>wwv_flow_imp.id(33543471242788730)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(33530000001593817)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(33547490161788738)
,p_view_id=>wwv_flow_imp.id(33543471242788730)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(33530154070593818)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(33548385808788740)
,p_view_id=>wwv_flow_imp.id(33543471242788730)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(33530247867593819)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(33549204200788742)
,p_view_id=>wwv_flow_imp.id(33543471242788730)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(33530351513593820)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(33550141933788743)
,p_view_id=>wwv_flow_imp.id(33543471242788730)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(33530471872593821)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(33551013498788745)
,p_view_id=>wwv_flow_imp.id(33543471242788730)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(33530552248593822)
,p_is_visible=>true
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35677509006851522)
,p_plug_name=>'carga-bestia'
,p_title=>'Carga a lo bestia'
,p_parent_plug_id=>wwv_flow_imp.id(33529036061593807)
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h2'
,p_plug_template=>2322115667525957943
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Analiza los % de acierto de los proveedores.</p>',
unistr('<p>Estos elementos permiten fijar un l\00EDmite inferior y superior del % de acierto.</p>'),
unistr('<p>Al pulsar "Carga a lo bestia", todos los proveedores que est\00E9n por debajo del l\00EDmite inferior cargan la Puntuaci\00F3n Win con un 0, los que est\00E9n entre el l\00EDmite inferior y superior, cargan la Puntuaci\00F3n Win de 5, y finalizamente los que est\00E9n por en')
||unistr('cima del l\00EDmite superior cargan la Puntuaci\00F3n Win a 10.</p>'),
unistr('<p>NOTA: Solo cargan la puntuaci\00F3n, si el proveedor no la tiene asignada ya. Si ya la tiene asignada, no hace nada.</p>'),
'<p></p>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(36840528635767285)
,p_plug_name=>unistr('Puntuaci\00F3n en semana')
,p_region_name=>'region_fija_puntos'
,p_parent_plug_id=>wwv_flow_imp.id(37037477226868772)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(36790509410580618)
,p_plug_name=>'Resumen Semanal'
,p_region_name=>'region_ig_puntos'
,p_parent_plug_id=>wwv_flow_imp.id(36840528635767285)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
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
'  LPAD(SU.visualorder,2,''0'') || '' - '' || SU.NAME AS ORDENPROVEEDOR_COMPLETO,',
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
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
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
 p_id=>wwv_flow_imp.id(32318896825131201)
,p_name=>'ORDENPROVEEDOR_COMPLETO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ORDENPROVEEDOR_COMPLETO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ordenproveedor Completo'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>170
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
,p_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
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
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
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
,p_display_sequence=>110
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
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
,p_display_sequence=>150
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
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
,p_display_sequence=>140
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'html_expression', '<img src="&URLLOGOTEAM." height="20" width="20"/>')).to_clob
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
,p_display_sequence=>30
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
 p_id=>wwv_flow_imp.id(36792741971580621)
,p_name=>'IDFANTASYSEASON'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDFANTASYSEASON'
,p_data_type=>'NUMBER'
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
,p_display_sequence=>70
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
,p_display_sequence=>80
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
,p_display_sequence=>100
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
,p_display_sequence=>130
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
,p_display_sequence=>160
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
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
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'html_expression', '<img src="&URLFOTOJUGADOR." height="20" width="20"/>')).to_clob
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
,p_show_total_row_count=>false
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
 p_id=>wwv_flow_imp.id(5953323011853)
,p_view_id=>wwv_flow_imp.id(36791547625580619)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(32318896825131201)
,p_is_visible=>false
,p_is_frozen=>false
,p_break_order=>5
,p_break_is_enabled=>true
,p_break_sort_direction=>'ASC'
,p_break_sort_nulls=>'LAST'
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
,p_is_visible=>true
,p_is_frozen=>false
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
wwv_flow_imp_page.create_ig_report_filter(
 p_id=>wwv_flow_imp.id(180314000001)
,p_report_id=>wwv_flow_imp.id(36791376823580619)
,p_type=>'COLUMN'
,p_column_id=>wwv_flow_imp.id(36794795535580622)
,p_operator=>'EQ'
,p_is_case_sensitive=>false
,p_expression=>'Espn'
,p_is_enabled=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(36840623463767286)
,p_plug_name=>'Proveedor (puntuaciones WIN)'
,p_region_name=>'region_fija_asignacion'
,p_parent_plug_id=>wwv_flow_imp.id(37037477226868772)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(36839191417767271)
,p_plug_name=>'Ya asignados'
,p_parent_plug_id=>wwv_flow_imp.id(36840623463767286)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
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
,p_column_label=>'Proveedor Id'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18473236382716411)
,p_db_column_name=>'NAMESUPPLIER'
,p_display_order=>60
,p_column_identifier=>'E'
,p_column_label=>'Proveedor'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18473341426716412)
,p_db_column_name=>'WINPOINT'
,p_display_order=>70
,p_column_identifier=>'F'
,p_column_label=>'Puntos WIN'
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
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(18575865393152429)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(36840722845767287)
,p_button_name=>'Cargar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cargar'
,p_grid_new_row=>'Y'
,p_security_scheme=>wwv_flow_imp.id(17195882813935255)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35678195109851528)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(36840722845767287)
,p_button_name=>'eliminar-todas-win'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Limpiar puntuaciones win'
,p_confirm_message=>unistr('Se van a eliminar todas las asignaciones de puntuaci\00F3n WIN a proveedores de este ejercicio/semana/equipo \00BFest\00E1 seguro?')
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35677894019851525)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(35677509006851522)
,p_button_name=>'Cargar_Bestia'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cargar Bestia'
,p_button_position=>'NEXT'
,p_security_scheme=>wwv_flow_imp.id(17195882813935255)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18473512679716414)
,p_name=>'P18_ID_BORRADO'
,p_item_sequence=>60
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
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
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
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
'WHERE NVL(CLOSED,0) = 0',
'order by id'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
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
 p_id=>wwv_flow_imp.id(18577746134152440)
,p_name=>'P18_SEMANA'
,p_item_sequence=>50
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35677629877851523)
,p_name=>'P18_ACIERTO_INFERIOR'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(35677509006851522)
,p_prompt=>'Limite % acierto Inferior'
,p_format_mask=>'FM990D90'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>6
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'max_value', '100',
  'min_value', '0',
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35677784116851524)
,p_name=>'P18_ACIERTO_SUPERIOR'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(35677509006851522)
,p_prompt=>'Limite % acierto Superior'
,p_format_mask=>'FM990D90'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>6
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'max_value', '100',
  'min_value', '0',
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(18578219194152441)
,p_computation_sequence=>10
,p_computation_item=>'P18_TEMPORADA'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'ID_TEMPORADA_ACTUAL'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(18467730066230824)
,p_computation_sequence=>20
,p_computation_item=>'P18_EQUIPOFANTASY'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'ID_EQUIPO_FANTASY_INICIO'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(33531909191593836)
,p_computation_sequence=>30
,p_computation_item=>'P18_SEMANA'
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
'    where po.idfantasyseason = :P18_TEMPORADA',
'        and po.IDFANTASYWORKTEAM = :P18_EQUIPOFANTASY;',
'',
'    return week_;',
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
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(33529453710593811)
,p_event_id=>wwv_flow_imp.id(18579835934152447)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(33529503444593812)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(18578955454152443)
,p_name=>'Refrescar proveedor cambio temporada semana'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P18_TEMPORADA,P18_SEMANA,P18_EQUIPOFANTASY'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
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
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(18473640532716415)
,p_name=>'DA_DELETEROW'
,p_event_sequence=>40
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
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(18617208270064663)
,p_name=>'Primera entrada cargue'
,p_event_sequence=>50
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18617651504064663)
,p_event_id=>wwv_flow_imp.id(18617208270064663)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(36790509410580618)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(33530697178593823)
,p_event_id=>wwv_flow_imp.id(18617208270064663)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(33529503444593812)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18602559673886907)
,p_event_id=>wwv_flow_imp.id(18617208270064663)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(36839191417767271)
,p_attribute_01=>'N'
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
'--innecesario, ahora trabajamos con temporada/equipo global cambiado en el hombre',
'--:P18_EQUIPOFANTASY_PRECARGA := :P18_EQUIPOFANTASY;'))
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
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35677972486851526)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar Puntuacion Proveedor BESTIA'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  winPoint_  FANTASY_VALUE.WINPOINT%TYPE;',
'',
'  CURSOR cMegaResumen IS',
'    WITH',
'    -- posiciones del equipo ordenadas por visualorder (rn = 1..N)',
'    positions AS (',
'      SELECT p.id pos_id,',
'            p.position pos_name,',
'            p.visualorder,',
'            ROW_NUMBER() OVER (ORDER BY p.visualorder) rn',
'      FROM FANTASY_POSITION_WORKTEAM pw',
'      JOIN FANTASY_POSITION p ON pw.idfantasyposition = p.id',
'      WHERE pw.idfantasyworkteam = :P18_EQUIPOFANTASY',
'    ),',
'    -- lista de jugadores del equipo (filtro por temporada/equipo)',
'    team_players AS (',
'      SELECT pl.id player_id',
'      FROM FANTASY_PLAYER pl',
'      WHERE pl.idfantasyworkteam = :P18_EQUIPOFANTASY',
'        AND pl.idfantasyseason = :P18_TEMPORADA',
'    ),',
unistr('    -- posiciones posibles por jugador: posici\00F3n base + posiciones adicionales en la tabla hija'),
'    players_positions AS (',
unistr('      -- posici\00F3n base del jugador'),
'      SELECT DISTINCT pl.id AS player_id,',
'            pl.idfantasypositionbase',
'      FROM FANTASY_PLAYER pl',
'      WHERE pl.idfantasyworkteam = :P18_EQUIPOFANTASY',
'        AND pl.idfantasyseason = :P18_TEMPORADA',
'',
'      UNION',
'',
'      -- posiciones adicionales registradas en la tabla hija',
'      SELECT DISTINCT fppa.idfantasyplayer AS player_id,',
'            fppa.idfantasypositionbase',
'      FROM FANTASY_PLAYER_POSITION_BASE_ADI fppa',
'      WHERE fppa.idfantasyplayer IN (SELECT player_id FROM team_players)',
'    ),',
'    -- puntos por jugador PARA CADA una de sus posiciones posibles para la temporada/equipo en la semana concreta',
'    players_points AS (',
'      SELECT pp.player_id,',
'            pp.idfantasypositionbase,',
'            pt.week,',
'            NVL(pt.fantasypoints,0) fantasypoints',
'      FROM players_positions pp',
'      JOIN FANTASY_POINT pt ON pt.idfantasyplayer = pp.player_id',
'      WHERE pt.idfantasyseason = :P18_TEMPORADA',
'        AND pt.idfantasyworkteam = :P18_EQUIPOFANTASY',
'        AND pt.week = :P18_SEMANA',
'    ),',
unistr('    -- jugadores elegibles por posici\00F3n (para la construcci\00F3n de la alineaci\00F3n ideal)'),
'    eligible AS (',
'      SELECT pos.pos_id,',
'            pos.visualorder pos_visual,',
'            pos.rn,',
'            pp.player_id,',
'            pp.idfantasypositionbase,',
'            pp.fantasypoints',
'      FROM positions pos',
'      JOIN FANTASY_POSITION_BASE_RELA rela ON rela.idfantasyposition = pos.pos_id',
'      JOIN players_points pp ON pp.idfantasypositionbase = rela.idfantasypositionbase',
'    ),',
'    ordered_positions AS (',
'      SELECT pos_id, visualorder, rn FROM positions',
'    ),',
unistr('    -- CTE recursivo: asigna por orden visual la mejor opci\00F3n disponible para cada posici\00F3n'),
'    ideal_recursive (rn, pos_id, player_id, points, selected_players) AS (',
unistr('      -- Anchor: primera posici\00F3n (rn = 1)'),
'      SELECT p.rn, p.pos_id,',
'        (SELECT player_id',
'        FROM (SELECT player_id, fantasypoints',
'              FROM eligible ee',
'              WHERE ee.pos_id = p.pos_id',
'              ORDER BY fantasypoints DESC, player_id)',
'        WHERE rownum = 1),',
'        NVL((SELECT fantasypoints',
'            FROM (SELECT player_id, fantasypoints',
'                  FROM eligible ee',
'                  WHERE ee.pos_id = p.pos_id',
'                  ORDER BY fantasypoints DESC, player_id)',
'            WHERE rownum = 1), 0),',
'        NVL(TO_CHAR((SELECT player_id',
'                    FROM (SELECT player_id',
'                          FROM eligible ee',
'                          WHERE ee.pos_id = p.pos_id',
'                          ORDER BY fantasypoints DESC, player_id)',
'                    WHERE rownum = 1)), '''')',
'      FROM (SELECT pos_id, visualorder, rn FROM positions) p',
'      WHERE p.rn = 1',
'',
'      UNION ALL',
'',
unistr('      -- Paso recursivo: siguiente posici\00F3n, evitando jugadores ya asignados'),
'      SELECT i.rn + 1, op.pos_id,',
'        (SELECT player_id',
'        FROM (SELECT player_id, fantasypoints',
'              FROM eligible ee',
'              WHERE ee.pos_id = op.pos_id',
'                AND instr('',''||NVL(i.selected_players,'''')||'','', '',''||ee.player_id||'','') = 0',
'              ORDER BY fantasypoints DESC, player_id)',
'        WHERE rownum = 1),',
'        NVL((SELECT fantasypoints',
'            FROM (SELECT player_id, fantasypoints',
'                  FROM eligible ee',
'                  WHERE ee.pos_id = op.pos_id',
'                    AND instr('',''||NVL(i.selected_players,'''')||'','', '',''||ee.player_id||'','') = 0',
'                  ORDER BY fantasypoints DESC, player_id)',
'            WHERE rownum = 1), 0),',
'        NVL(i.selected_players,'''') ||',
'          CASE',
'            WHEN (SELECT player_id',
'                  FROM (SELECT player_id',
'                        FROM eligible ee',
'                        WHERE ee.pos_id = op.pos_id',
'                          AND instr('',''||NVL(i.selected_players,'''')||'','', '',''||ee.player_id||'','') = 0',
'                        ORDER BY fantasypoints DESC, player_id)',
'                  WHERE rownum = 1) IS NOT NULL',
'            THEN '','' || TO_CHAR((SELECT player_id',
'                                FROM (SELECT player_id',
'                                      FROM eligible ee',
'                                      WHERE ee.pos_id = op.pos_id',
'                                        AND instr('',''||NVL(i.selected_players,'''')||'','', '',''||ee.player_id||'','') = 0',
'                                      ORDER BY fantasypoints DESC, player_id)',
'                                WHERE rownum = 1))',
'            ELSE ''''',
'          END',
'      FROM ideal_recursive i',
'      JOIN ordered_positions op ON op.rn = i.rn + 1',
'    ),',
unistr('    -- Alineaci\00F3n ideal (filas por posici\00F3n con su jugador y puntos)'),
'    ideal_lineup AS (',
'      SELECT ir.rn AS seq, ir.pos_id, ir.player_id, NVL(ir.points,0) points',
'      FROM ideal_recursive ir',
'    ),',
unistr('    -- Total de la alineaci\00F3n ideal (suma de puntos)'),
'    ideal_total AS (',
'      SELECT NVL(SUM(points),0) AS ideal_points FROM ideal_lineup',
'    ),',
unistr('    -- Texto representativo de la alineaci\00F3n ideal (POS: Jugador (puntos)) - texto plano (CHR(10))'),
'    ideal_lineup_text AS (',
'      SELECT LISTAGG(p.position || '': '' || NVL(pl.name,''(sin jugador)'') || '' ('' || TO_CHAR(ROUND(il.points,2)) || '')'', CHR(10))',
'              WITHIN GROUP (ORDER BY p.visualorder) AS ideal_lineup_desc',
'      FROM ideal_lineup il',
'      JOIN FANTASY_POSITION p ON p.id = il.pos_id',
'      LEFT JOIN FANTASY_PLAYER pl ON pl.id = il.player_id',
'    ),',
unistr('    -- VERSI\00D3N HTML de la alineaci\00F3n ideal (br + contenedor pre-wrap)'),
'    ideal_lineup_html AS (',
'      SELECT ''<div style="white-space:pre-wrap;">'' ||',
'            LISTAGG(p.position || '': '' || NVL(pl.name,''(sin jugador)'') || '' ('' || TO_CHAR(ROUND(il.points,2)) || '')'', ''<br/>'')',
'              WITHIN GROUP (ORDER BY p.visualorder)',
'            || ''</div>'' AS ideal_lineup_desc_html',
'      FROM ideal_lineup il',
'      JOIN FANTASY_POSITION p ON p.id = il.pos_id',
'      LEFT JOIN FANTASY_PLAYER pl ON pl.id = il.player_id',
'    ),',
unistr('    -- proveedores que hicieron proyecciones esa semana y suma de puntos de su alineaci\00F3n'),
'    supplier_week_points AS (',
'      SELECT pr.idfantasysupplier supplier_id,',
'            SUM(NVL(fp.fantasypoints,0)) supplier_points',
'      FROM FANTASY_PROYECTION pr',
'      LEFT JOIN FANTASY_POINT fp',
'        ON pr.idfantasyseason = fp.idfantasyseason',
'      AND pr.idfantasyworkteam = fp.idfantasyworkteam',
'      AND pr.week = fp.week',
'      AND pr.idfantasyplayer = fp.idfantasyplayer',
'      WHERE pr.idfantasyseason = :P18_TEMPORADA',
'        AND pr.idfantasyworkteam = :P18_EQUIPOFANTASY',
'        AND pr.week = :P18_SEMANA',
'      GROUP BY pr.idfantasysupplier',
'    ),',
unistr('    -- texto representativo de la alineaci\00F3n que cada proveedor proyect\00F3 (POS: Jugador (puntos)) - texto plano'),
'    supplier_lineup_text AS (',
'      SELECT pr.idfantasysupplier supplier_id,',
'            LISTAGG(pos.position || '': '' || NVL(pl.name,''(sin jugador)'') || '' ('' || NVL(TO_CHAR(ROUND(fp.fantasypoints,2)),''0'') || '')'', CHR(10))',
'              WITHIN GROUP (ORDER BY pos.visualorder) AS supplier_lineup_desc',
'      FROM FANTASY_PROYECTION pr',
'      LEFT JOIN FANTASY_PLAYER pl ON pl.id = pr.idfantasyplayer',
'      LEFT JOIN FANTASY_POSITION pos ON pos.id = pr.idfantasyposition',
'      LEFT JOIN FANTASY_POINT fp ON fp.idfantasyseason = pr.idfantasyseason',
'                            AND fp.idfantasyworkteam = pr.idfantasyworkteam',
'                            AND fp.week = pr.week',
'                            AND fp.idfantasyplayer = pr.idfantasyplayer',
'      WHERE pr.idfantasyseason = :P18_TEMPORADA',
'        AND pr.idfantasyworkteam = :P18_EQUIPOFANTASY',
'        AND pr.week = :P18_SEMANA',
'      GROUP BY pr.idfantasysupplier',
'    ),',
unistr('    -- VERSI\00D3N HTML de la alineaci\00F3n del proveedor'),
'    supplier_lineup_html AS (',
'      SELECT pr.idfantasysupplier supplier_id,',
'            ''<div style="white-space:pre-wrap;">'' ||',
'            LISTAGG(pos.position || '': '' || NVL(pl.name,''(sin jugador)'') || '' ('' || NVL(TO_CHAR(ROUND(fp.fantasypoints,2)),''0'') || '')'', ''<br/>'')',
'              WITHIN GROUP (ORDER BY pos.visualorder)',
'            || ''</div>'' AS supplier_lineup_desc_html',
'      FROM FANTASY_PROYECTION pr',
'      LEFT JOIN FANTASY_PLAYER pl ON pl.id = pr.idfantasyplayer',
'      LEFT JOIN FANTASY_POSITION pos ON pos.id = pr.idfantasyposition',
'      LEFT JOIN FANTASY_POINT fp ON fp.idfantasyseason = pr.idfantasyseason',
'                            AND fp.idfantasyworkteam = pr.idfantasyworkteam',
'                            AND fp.week = pr.week',
'                            AND fp.idfantasyplayer = pr.idfantasyplayer',
'      WHERE pr.idfantasyseason = :P18_TEMPORADA',
'        AND pr.idfantasyworkteam = :P18_EQUIPOFANTASY',
'        AND pr.week = :P18_SEMANA',
'      GROUP BY pr.idfantasysupplier',
'    )',
'    -- Resultado final: una fila por proveedor con los datos solicitados',
'    SELECT',
'      :P18_SEMANA AS Semana,',
'      it.ideal_points AS Puntuacion_Alineacion_Ideal,',
unistr('      NVL(ilt.ideal_lineup_desc, ''(sin alineaci\00F3n ideal)'') AS Alineacion_Ideal,'),
'      ilh.ideal_lineup_desc_html AS Alineacion_Ideal_HTML,',
'      su.id AS Proveedor_ID,',
'      su.name AS Proveedor,',
'      su.visualorder AS Orden_Visual_Proveedor,',
'      NVL(swp.supplier_points,0) AS Puntuacion_Proveedor,',
unistr('      NVL(slt.supplier_lineup_desc, ''(sin alineaci\00F3n de proveedor)'') AS Alineacion_Proveedor,'),
'      slh.supplier_lineup_desc_html AS Alineacion_Proveedor_HTML,',
'      CASE WHEN it.ideal_points > 0 THEN ROUND( (NVL(swp.supplier_points,0) / it.ideal_points) * 100, 2) ELSE NULL END AS Porcentaje_Acierto',
'    FROM supplier_week_points swp',
'    JOIN FANTASY_SUPPLIER su ON su.id = swp.supplier_id',
'    CROSS JOIN ideal_total it',
'    LEFT JOIN ideal_lineup_text ilt ON 1 = 1',
'    LEFT JOIN ideal_lineup_html ilh ON 1 = 1',
'    LEFT JOIN supplier_lineup_text slt ON slt.supplier_id = swp.supplier_id',
'    LEFT JOIN supplier_lineup_html slh ON slh.supplier_id = swp.supplier_id;',
'',
'  FUNCTION existeYaCargado(',
'    p_idfantasyseason IN FANTASY_VALUE.IDFANTASYSEASON%TYPE,',
'    p_week IN FANTASY_VALUE.WEEK%TYPE,',
'    p_idfantasysupplier IN FANTASY_VALUE.IDFANTASYSUPPLIER%TYPE,',
'    p_idfantasyworkteam IN FANTASY_VALUE.IDFANTASYWORKTEAM%TYPE)',
'  RETURN BOOLEAN IS',
'    v_count INTEGER;',
'  BEGIN',
'    SELECT COUNT(*)',
'    INTO v_count',
'    FROM FANTASY_VALUE',
'    WHERE idfantasyseason = p_idfantasyseason',
'      AND week = p_week',
'      AND idfantasysupplier = p_idfantasysupplier',
'      AND idfantasyworkteam = p_idfantasyworkteam;',
'',
'    RETURN v_count > 0;',
'  END existeYaCargado;',
'',
'BEGIN --PROCEDIMIENTO PRINCIPAL',
'  IF :P18_ACIERTO_INFERIOR IS NOT NULL AND :P18_ACIERTO_SUPERIOR IS NOT NULL ',
'    AND :P18_ACIERTO_INFERIOR < :P18_ACIERTO_SUPERIOR THEN',
'    FOR rMegaResumen IN cMegaResumen LOOP',
'      winPoint_ := 0;',
'      IF rMegaResumen.Porcentaje_Acierto BETWEEN :P18_ACIERTO_INFERIOR AND :P18_ACIERTO_SUPERIOR THEN',
'        winPoint_ := 5;',
'      ELSIF rMegaResumen.Porcentaje_Acierto > :P18_ACIERTO_SUPERIOR THEN',
'        winPoint_ := 10;',
'      END IF;',
'',
'      IF NOT existeYaCargado(:P18_TEMPORADA, :P18_SEMANA, rMegaResumen.Proveedor_ID, :P18_EQUIPOFANTASY) THEN',
'',
'        INSERT INTO FANTASY_VALUE(',
'          idfantasyseason,',
'          week,',
'          idfantasysupplier,',
'          winpoint,',
'          IDFANTASYWORKTEAM)',
'        VALUES(',
'          :P18_TEMPORADA,',
'          :P18_SEMANA,',
'          rMegaResumen.Proveedor_ID,',
'          winPoint_,',
'          :P18_EQUIPOFANTASY);',
'      END IF;',
'',
'    END LOOP;',
'',
'  END IF;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'Error al cargar a lo bestia puntuaciones en proveedores'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(35677894019851525)
,p_process_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P18_ACIERTO_INFERIOR IS NOT NULL AND :P18_ACIERTO_SUPERIOR IS NOT NULL',
'AND :P18_ACIERTO_INFERIOR < :P18_ACIERTO_SUPERIOR'))
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
,p_process_success_message=>'Puntuaciones proveedores cargadas a lo bestia'
,p_internal_uid=>35677972486851526
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35678200515851529)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Limpiar Puntuacion Proveedor'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DELETE FROM FANTASY_VALUE',
'WHERE idfantasyseason = :P18_TEMPORADA',
'  AND week = :P18_SEMANA',
'  AND IDFANTASYWORKTEAM = :P18_EQUIPOFANTASY;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'Error al limpiar puntuaciones de proveedores'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(35678195109851528)
,p_process_success_message=>'Limpiadas puntuaciones de proveedor'
,p_internal_uid=>35678200515851529
);
wwv_flow_imp.component_end;
end;
/
