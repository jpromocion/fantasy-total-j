prompt --application/deployment/install/install_delta_2_7_sql
begin
--   Manifest
--     INSTALL: INSTALL-delta_2.7.sql
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
 p_id=>wwv_flow_imp.id(37598037657312667)
,p_install_id=>wwv_flow_imp.id(17317298307119342)
,p_name=>'delta_2.7.sql'
,p_sequence=>90
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'CREATE SEQUENCE FANTASY_PROYECTION_LONG_TERM_SQ',
'  INCREMENT BY 1',
'  MINVALUE 1',
'  MAXVALUE 999999999999999',
'  NOCACHE',
'  NOCYCLE',
'  START WITH 1',
'/',
'',
'create table FANTASY_PROYECTION_LONG_TERM (',
'    id number DEFAULT FANTASY_PROYECTION_LONG_TERM_SQ.nextval NOT NULL,',
'    type_long_term varchar2(3) not null,',
'    date_done DATE not null,',
'    idfantasyseason number(4,0) not null,',
'    IDFANTASYWORKTEAM NUMBER NOT NULL,',
'    IDFANTASYSUPPLIER NUMBER NOT NULL,',
'    IDFANTASYPOSITIONBASE NUMBER NOT NULL,',
'    ranking number(4,0) null,',
'    player_name varchar2(50) not null,',
'    alias_team varchar2(4) null,',
'    value number(7,2) null,',
'    isowned varchar2(1) default ''N'' not null,',
'    created date not null,',
'    created_by varchar2(255 char) not null,',
'    updated date not null,',
'    updated_by varchar2(255 char) not null',
')',
'/',
'',
'alter table FANTASY_PROYECTION_LONG_TERM add constraint FANTASY_PROYECTION_LONG_TERM_PK primary key (id)',
'/',
'',
'alter table FANTASY_PROYECTION_LONG_TERM add constraint FANTASY_PROYECTION_LONG_TERM_FK1 foreign  key (IDFANTASYSEASON) references FANTASY_SEASON(ID)',
'/',
'',
'alter table FANTASY_PROYECTION_LONG_TERM add constraint FANTASY_PROYECTION_LONG_TERM_FK2 foreign  key (IDFANTASYWORKTEAM) references FANTASY_WORKTEAM(ID)',
'/',
'',
'alter table FANTASY_PROYECTION_LONG_TERM add constraint FANTASY_PROYECTION_LONG_TERM_FK3 foreign  key (IDFANTASYPOSITIONBASE) references FANTASY_POSITION_BASE(ID)',
'/',
'',
'alter table FANTASY_PROYECTION_LONG_TERM add constraint FANTASY_PROYECTION_LONG_TERM_FK4 foreign  key (IDFANTASYSUPPLIER) references FANTASY_SUPPLIER(ID)',
'/',
'',
'comment on table FANTASY_PROYECTION_LONG_TERM is ''Tabla que contiene las proyecciones a largo plazo de los jugadores segun su posicion y equipo: Dynasty / ROS (resto temporada)''',
'/',
'',
'comment on column FANTASY_PROYECTION_LONG_TERM.TYPE_LONG_TERM is ''Tipo de proyeccion a largo plazo: DYN (Dynasty) / ROS (Resto de temporada)''',
'/',
'',
'create or replace trigger FANTASY_PROYECTION_LONG_TERM_BIU',
'    before insert or update',
'    on FANTASY_PROYECTION_LONG_TERM',
'    for each row',
'begin',
'    if inserting then',
'        :new.created := sysdate;',
'        :new.created_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'    end if;',
'    :new.updated := sysdate;',
'    :new.updated_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'end FANTASY_PROYECTION_LONG_TERM_BIU;',
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
