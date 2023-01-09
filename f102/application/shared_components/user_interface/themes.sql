prompt --application/shared_components/user_interface/themes
begin
--   Manifest
--     THEME: 102
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.1'
,p_default_workspace_id=>7231611737995830
,p_default_application_id=>102
,p_default_id_offset=>0
,p_default_owner=>'WKSP_CURSO'
);
wwv_flow_imp_shared.create_theme(
 p_id=>wwv_flow_imp.id(17170036952935217)
,p_theme_id=>42
,p_theme_name=>'Universal Theme'
,p_theme_internal_name=>'UNIVERSAL_THEME'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_reference_id=>4070917134413059350
,p_is_locked=>false
,p_default_page_template=>wwv_flow_imp.id(17008128901935108)
,p_default_dialog_template=>wwv_flow_imp.id(17025598325935117)
,p_error_template=>wwv_flow_imp.id(17022947499935116)
,p_printer_friendly_template=>wwv_flow_imp.id(17008128901935108)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_imp.id(17022947499935116)
,p_default_button_template=>wwv_flow_imp.id(17167082771935205)
,p_default_region_template=>wwv_flow_imp.id(17069367738935144)
,p_default_chart_template=>wwv_flow_imp.id(17069367738935144)
,p_default_form_template=>wwv_flow_imp.id(17069367738935144)
,p_default_reportr_template=>wwv_flow_imp.id(17069367738935144)
,p_default_tabform_template=>wwv_flow_imp.id(17069367738935144)
,p_default_wizard_template=>wwv_flow_imp.id(17069367738935144)
,p_default_menur_template=>wwv_flow_imp.id(17081952102935151)
,p_default_listr_template=>wwv_flow_imp.id(17069367738935144)
,p_default_irr_template=>wwv_flow_imp.id(17067238129935143)
,p_default_report_template=>wwv_flow_imp.id(17125639701935174)
,p_default_label_template=>wwv_flow_imp.id(17164567568935201)
,p_default_menu_template=>wwv_flow_imp.id(17168654782935206)
,p_default_calendar_template=>wwv_flow_imp.id(17168714138935207)
,p_default_list_template=>wwv_flow_imp.id(17154431633935193)
,p_default_nav_list_template=>wwv_flow_imp.id(17163283296935199)
,p_default_top_nav_list_temp=>wwv_flow_imp.id(17163283296935199)
,p_default_side_nav_list_temp=>wwv_flow_imp.id(17161427069935197)
,p_default_nav_list_position=>'SIDE'
,p_default_dialogbtnr_template=>wwv_flow_imp.id(17036564828935127)
,p_default_dialogr_template=>wwv_flow_imp.id(17033764143935126)
,p_default_option_label=>wwv_flow_imp.id(17164567568935201)
,p_default_required_label=>wwv_flow_imp.id(17165892676935202)
,p_default_navbar_list_template=>wwv_flow_imp.id(17161098023935197)
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(42),'#APEX_FILES#themes/theme_42/22.1/')
,p_files_version=>64
,p_icon_library=>'FONTAPEX'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APEX_FILES#libraries/apex/#MIN_DIRECTORY#widget.stickyWidget#MIN#.js?v=#APEX_VERSION#',
'#THEME_FILES#js/theme42#MIN#.js?v=#APEX_VERSION#'))
,p_css_file_urls=>'#THEME_FILES#css/Core#MIN#.css?v=#APEX_VERSION#'
);
wwv_flow_imp.component_end;
end;
/
