prompt --application/deployment/install/install_02_carga_triggers
begin
--   Manifest
--     INSTALL: INSTALL-02_carga_triggers
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.5'
,p_default_workspace_id=>7231611737995830
,p_default_application_id=>102
,p_default_id_offset=>0
,p_default_owner=>'WKSP_CURSO'
);
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(18839846489119570)
,p_install_id=>wwv_flow_imp.id(17317298307119342)
,p_name=>'02_carga_triggers'
,p_sequence=>20
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'',
'',
'PROMPT Triggers',
'create or replace trigger FANTASY_SUPPLIER_BIU',
'    before insert or update',
'    on FANTASY_SUPPLIER',
'    for each row',
'begin',
'    if inserting then',
'        :new.created := sysdate;',
'        :new.created_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'    end if;',
'    :new.updated := sysdate;',
'    :new.updated_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'end FANTASY_SUPPLIER_BIU;',
'/',
'',
'',
'create or replace trigger FANTASY_POSITION_BIU',
'    before insert or update',
'    on FANTASY_POSITION',
'    for each row',
'begin',
'    if inserting then',
'        :new.created := sysdate;',
'        :new.created_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'    end if;',
'    :new.updated := sysdate;',
'    :new.updated_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'end FANTASY_POSITION_BIU;',
'/',
'',
'',
'create or replace trigger FANTASY_SEASON_BIU',
'    before insert or update',
'    on FANTASY_SEASON',
'    for each row',
'begin',
'    if inserting then',
'        :new.created := sysdate;',
'        :new.created_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'    end if;',
'    :new.updated := sysdate;',
'    :new.updated_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'end FANTASY_SEASON_BIU;',
'/',
'',
'',
'',
'',
'create or replace trigger FANTASY_TEAM_BIU',
'    before insert or update',
'    on FANTASY_TEAM',
'    for each row',
'begin',
'    if inserting then',
'        :new.created := sysdate;',
'        :new.created_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'    end if;',
'    :new.updated := sysdate;',
'    :new.updated_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'end FANTASY_TEAM_BIU;',
'/',
'',
'',
'create or replace trigger FANTASY_PLAYER_BIU',
'    before insert or update',
'    on FANTASY_PLAYER',
'    for each row',
'begin',
'    if inserting then',
'        :new.created := sysdate;',
'        :new.created_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'    end if;',
'    :new.updated := sysdate;',
'    :new.updated_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'end FANTASY_PLAYER_BIU;',
'/',
'',
'',
'',
'create or replace trigger FANTASY_PROYECTION_BIU',
'    before insert or update',
'    on FANTASY_PROYECTION',
'    for each row',
'begin',
'    if inserting then',
'        :new.created := sysdate;',
'        :new.created_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'    end if;',
'    :new.updated := sysdate;',
'    :new.updated_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'end FANTASY_PROYECTION_BIU;',
'/',
'',
'',
'create or replace trigger FANTASY_POINT_BIU',
'    before insert or update',
'    on FANTASY_POINT',
'    for each row',
'begin',
'    if inserting then',
'        :new.created := sysdate;',
'        :new.created_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'    end if;',
'    :new.updated := sysdate;',
'    :new.updated_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'end FANTASY_POINT_BIU;',
'/',
'',
'',
'create or replace trigger FANTASY_VALUE_BIU',
'    before insert or update',
'    on FANTASY_VALUE',
'    for each row',
'begin',
'    if inserting then',
'        :new.created := sysdate;',
'        :new.created_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'    end if;',
'    :new.updated := sysdate;',
'    :new.updated_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'end FANTASY_VALUE_BIU;',
'/'))
);
wwv_flow_imp.component_end;
end;
/
