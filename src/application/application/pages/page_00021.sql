prompt --application/pages/page_00021
begin
--   Manifest
--     PAGE: 00021
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
 p_id=>21
,p_name=>'Posiciones Equipos'
,p_alias=>'POSICIONES-EQUIPOS'
,p_step_title=>'Posiciones Equipos'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(18648619839683202)
,p_plug_name=>'Posiciones Equipos'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    pw.IDFANTASYWORKTEAM,',
'    wt.WORKTEAM,',
'    pw.IDFANTASYPOSITION,',
'    po.POSITION,',
'    po.NAME as DESCRIPCION_POSICION',
'from ',
'    FANTASY_POSITION_WORKTEAM PW,',
'    FANTASY_WORKTEAM WT,',
'    FANTASY_POSITION po',
'where pw.IDFANTASYWORKTEAM = wt.id    ',
'  and pw.IDFANTASYPOSITION = po.id',
'ORDER BY  pw.IDFANTASYWORKTEAM, po.VISUALORDER',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Posiciones Equipos'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(18648794206683202)
,p_name=>'Posiciones Equipos'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_base_pk2=>'IDFANTASYPOSITION'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:22:&APP_SESSION.::&DEBUG.:RP:P22_IDFANTASYWORKTEAM,P22_IDFANTASYPOSITION:\#IDFANTASYWORKTEAM#\,\#IDFANTASYPOSITION#\'
,p_detail_link_text=>'<span role="img" aria-label="Editar"><span class="fa fa-edit" aria-hidden="true" title="Editar"></span></span>'
,p_owner=>'JORTRI'
,p_internal_uid=>18648794206683202
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18649157473683204)
,p_db_column_name=>'IDFANTASYWORKTEAM'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Equipo Fantasy'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18649548318683206)
,p_db_column_name=>'IDFANTASYPOSITION'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'B'
,p_column_label=>unistr('Posici\00F3n')
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18602789430886909)
,p_db_column_name=>'WORKTEAM'
,p_display_order=>10
,p_column_identifier=>'G'
,p_column_label=>'Equipo Fantasy'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18602834255886910)
,p_db_column_name=>'POSITION'
,p_display_order=>20
,p_column_identifier=>'H'
,p_column_label=>unistr('Posici\00F3n')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18602926244886911)
,p_db_column_name=>'DESCRIPCION_POSICION'
,p_display_order=>30
,p_column_identifier=>'I'
,p_column_label=>unistr('Descripci\00F3n posici\00F3n')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(18653158949684287)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'186532'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'WORKTEAM:POSITION:DESCRIPCION_POSICION:'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(18651600315683210)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(18648619839683202)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crear'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:22:&APP_SESSION.::&DEBUG.:22::'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(18651934340683210)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(18648619839683202)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18652432873683211)
,p_event_id=>wwv_flow_imp.id(18651934340683210)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(18648619839683202)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
