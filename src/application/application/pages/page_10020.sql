prompt --application/pages/page_10020
begin
--   Manifest
--     PAGE: 10020
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
 p_id=>10020
,p_name=>'Acerca de'
,p_alias=>'HELP'
,p_step_title=>'Acerca de'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(14017704003067519)
,p_protection_level=>'C'
,p_help_text=>'All application help text can be accessed from this page. The links in the "Documentation" region give a much more in-depth explanation of the application''s features and functionality.'
,p_page_component_map=>'11'
,p_last_updated_by=>'JORTRI'
,p_last_upd_yyyymmddhh24miss=>'20230911122728'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(41861688757541141)
,p_plug_name=>'Acerca de'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--padded:t-ContentBlock--h1:t-ContentBlock--lightBG'
,p_plug_template=>wwv_flow_imp.id(17052866574935136)
,p_plug_display_sequence=>30
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('<h1>Jose Javier G\00E1lvez G\00F3mez</h1>'),
'<h2>jpromocion</h2>',
'',
'<img style="align:center;vertical-align: middle;width: 200px;height: 200px;border-radius: 50%;" src="#APP_FILES#icons/zapp_negro.jpeg" alt="logo">',
'',
'<br/>',
'',
'<h2 class="text-body-large-open mb4">',
unistr('    Informaci\00F3n de contacto'),
'</h2>',
'<div class="pv-profile-section__section-info section-info" tabindex="-1">',
'',
'    <section class="pv-contact-info__contact-type ci-vanity-url">',
'        <li-icon aria-hidden="true" type="linkedin-bug" class="pv-contact-info__contact-icon" size="medium"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" data-supported-dps="24x24" fill="currentColor" class="mercado-match" width="24" he'
||'ight="24" focusable="false">',
'    ',
'    </svg></li-icon>',
'',
'    <h3 class="pv-contact-info__header t-16 t-black t-bold">',
'        LinkedIn',
'    </h3>',
'    <div class="pv-contact-info__ci-container t-14">',
'        <a href="https://www.linkedin.com/in/josejgalvez" class="pv-contact-info__contact-link link-without-visited-state t-14">',
'        linkedin.com/in/josejgalvez',
'        </a>',
'    </div>',
'    </section>',
'<br/>',
'    <section class="pv-contact-info__contact-type ci-websites">',
'        <li-icon aria-hidden="true" type="link" class="pv-contact-info__contact-icon"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" data-supported-dps="24x24" fill="currentColor" class="mercado-match" width="24" height="24" focusable="f'
||'alse">',
'    <path d="M19.83 4.17a4 4 0 00-5.66 0l-2 2A4 4 0 0011 9a4 4 0 00.56 2l-.54.54a4 4 0 00-4.85.63l-2 2a4 4 0 005.66 5.66l2-2A4 4 0 0013 15a4 4 0 00-.56-2l.54-.54a4 4 0 004.85-.63l2-2a4 4 0 000-5.66zM11 15a2 2 0 01-.59 1.41l-2 2a2 2 0 11-3-2.6l.22-.22'
||' 2-2A2 2 0 019 13a2.24 2.24 0 01.51.07l-1.22 1.22a1 1 0 000 1.41 1 1 0 001.41 0l1.22-1.22A2.24 2.24 0 0111 15zm7.41-6.59l-2 2A2 2 0 0115 11a2.24 2.24 0 01-.51-.07l1.22-1.22A1 1 0 0016 9a1 1 0 00-.29-.7A1 1 0 0015 8a1 1 0 00-.7.29l-1.23 1.22A2.24 2.24'
||' 0 0113 9a2 2 0 01.59-1.41l2-2a2 2 0 013 2.6z"></path>',
'    </svg></li-icon>',
'',
'        <h3 class="pv-contact-info__header t-16 t-black t-bold">',
'            GitHub',
'        </h3>',
'        <div class="pv-contact-info__ci-container t-14">',
'            <a href="https://github.com/jpromocion" class="pv-contact-info__contact-link link-without-visited-state" target="_blank" rel="noopener noreferrer">',
'        github.com/jpromocion',
'        </a>',
'        </div>',
'    </section>',
'<br/>',
'    <section class="pv-contact-info__contact-type ci-email">',
'        <li-icon aria-hidden="true" type="envelope" class="pv-contact-info__contact-icon"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" data-supported-dps="24x24" fill="currentColor" class="mercado-match" width="24" height="24" focusabl'
||'e="false">',
'    <path d="M2 4v13a3 3 0 003 3h14a3 3 0 003-3V4zm18 2v1.47l-8 5.33-8-5.33V6zm-1 12H5a1 1 0 01-1-1V8.67L12 14l8-5.33V17a1 1 0 01-1 1z"></path>',
'    </svg></li-icon>',
'',
'        <h3 class="pv-contact-info__header t-16 t-black t-bold">',
'            Enviar email',
'        </h3>',
'        <div class="pv-contact-info__ci-container t-14">',
'            <a href="mailto:jpromocion@gmail.com" class="pv-contact-info__contact-link link-without-visited-state t-14" target="_blank" rel="noopener noreferrer">',
'            jpromocion@gmail.com',
'            </a>',
'        </div>',
'    </section>',
'</div>'))
,p_plug_query_num_rows=>15
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_imp.component_end;
end;
/
