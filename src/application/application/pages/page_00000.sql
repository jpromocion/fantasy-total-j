prompt --application/pages/page_00000
begin
--   Manifest
--     PAGE: 00000
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
 p_id=>0
,p_name=>'Global Page'
,p_step_title=>'Global Page'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'D'
,p_page_component_map=>'14'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35830796639218964)
,p_plug_name=>'Fantasy Total_OLD'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2674017834225413037
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_01'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<b>Temporada actual: </b>&TEMPORADA_ACTUAL. (&ID_TEMPORADA_ACTUAL.) <br>',
'<b>Equipo: </b>&EQUIPO_FANTASY_INICIO. (&ID_EQUIPO_FANTASY_INICIO.)'))
,p_plug_query_num_rows=>15
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>'1=0'
,p_plug_display_when_cond2=>'PLSQL'
,p_region_image=>'#APP_FILES#icons/app-icon-512.png'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
,p_plug_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Como se mostraba antes el resumen por static content.... pero al final se sustityuye por una region de dynamic content... pues la static no se refresca con el refresh tras el cambio temporada/equipo de los combos... y la region dynamic si!!!',
'En vez de eliminarla, le ponemos un server side condition con expresion siempre falsa para dejarlo aqui'))
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(37229574977158420)
,p_plug_name=>'Fantasy Total'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2674017834225413037
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_location=>null
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_result clob;',
'begin',
'    l_result := ''<b>Temporada actual: </b>'' || :TEMPORADA_ACTUAL || '' ('' || :ID_TEMPORADA_ACTUAL ||'') <br>'';',
'',
'    l_result := l_result || ''<b>Equipo: </b>''|| :EQUIPO_FANTASY_INICIO||'' (''|| :ID_EQUIPO_FANTASY_INICIO|| '')'';',
'',
'    return l_result;',
'end;'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_DYNAMIC_CONTENT'
,p_region_image=>'#APP_FILES#icons/app-icon-512.png'
);
wwv_flow_imp.component_end;
end;
/
