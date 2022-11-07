prompt --application/shared_components/files/icons_app_icon_32_png
begin
--   Manifest
--     APP STATIC FILES: 102
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.04.12'
,p_release=>'22.1.6'
,p_default_workspace_id=>7231611737995830
,p_default_application_id=>102
,p_default_id_offset=>0
,p_default_owner=>'WKSP_CURSO'
);
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7AF4000000017352474200AECE1CE900000142494441545847ED94314EC33018855F21AE9334294515B0C002031B1760646140E2081C84A997E0240C2016E8C08C040B2CC0';
wwv_flow_imp.g_varchar2_table(2) := 'D40115B54D43923A4E2A5B0265C0D4AD1A2A55CEE8387EDFFFC57A95D6CD598E053E1503600C1803C6C0BC0D84BD1834F760ADA75AF536D7228A87232411834556516BD8E5017096C920B74E6588983A651CD421B0BDAA56F0F7A6990CF43F42F8B48190';
wwv_flow_imp.g_varchar2_table(3) := 'F5E53935B28618C31FA06908A60610E1627242AD5F73848D8CE7B03DA2DC53FC501B40FC5F96A452B12A5C1C5CE75BD8DBDE47FBE90A7ED39D28431B201B102DCDA501144771E30D5864059DE05D2E1FEE1E83A7391E0777E519280214A714EBE7271768';
wwv_flow_imp.g_varchar2_table(4) := '3F5FE2E1F3764901C4CD5669FE170341F74BA979F901461143D08D7074700ACE38EEDFAEB1E9ECC82E78EDBCC8BBA97AE7371D541DF2671768F7C0C4469971830130068C0163600CF5711470EFCA816B0000000049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(17193146729935247)
,p_file_name=>'icons/app-icon-32.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
wwv_flow_imp.component_end;
end;
/
