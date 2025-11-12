prompt --application/deployment/install/install_delta_2_6_sql
begin
--   Manifest
--     INSTALL: INSTALL-delta_2.6.sql
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.10'
,p_default_workspace_id=>7231611737995830
,p_default_application_id=>102
,p_default_id_offset=>0
,p_default_owner=>'WKSP_CURSO'
);
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(36670968093396488)
,p_install_id=>wwv_flow_imp.id(17317298307119342)
,p_name=>'delta_2.6.sql'
,p_sequence=>80
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'',
'create table FANTASY_PLAYER_POSITION_BASE_ADI (',
'    IDFANTASYPLAYER NUMBER not null,',
'    IDFANTASYPOSITIONBASE NUMBER not null,',
'    created date not null,',
'    created_by varchar2(255 char) not null,',
'    updated date not null,',
'    updated_by varchar2(255 char) not null',
')',
'/',
'',
'alter table FANTASY_PLAYER_POSITION_BASE_ADI add constraint FANTASY_PLAYER_POSITION_BASE_ADI_PK primary key (IDFANTASYPLAYER, IDFANTASYPOSITIONBASE)',
'/',
'',
'alter table FANTASY_PLAYER_POSITION_BASE_ADI add constraint FANTASY_PLAYER_POSITION_BASE_ADI_FK1 foreign  key (IDFANTASYPLAYER) references FANTASY_PLAYER(ID)',
'/',
'',
'alter table FANTASY_PLAYER_POSITION_BASE_ADI add constraint FANTASY_PLAYER_POSITION_BASE_ADI_FK2 foreign  key (IDFANTASYPOSITIONBASE) references FANTASY_POSITION_BASE(ID)',
'/',
'',
'create or replace trigger FANTASY_PLAYER_POSITION_BASE_ADI_BIU',
'    before insert or update',
'    on FANTASY_PLAYER_POSITION_BASE_ADI',
'    for each row',
'begin',
'    if inserting then',
'        :new.created := sysdate;',
'        :new.created_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'    end if;',
'    :new.updated := sysdate;',
'    :new.updated_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'end FANTASY_PLAYER_POSITION_BASE_ADI_BIU;',
'/',
'',
'',
'',
'',
'',
''))
);
wwv_flow_imp.component_end;
end;
/
