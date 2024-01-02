
CREATE SEQUENCE FANTASY_WORKTEAM_SQ
  INCREMENT BY 1
  MINVALUE 1
  MAXVALUE 999999999999999
  NOCACHE
  NOCYCLE
  START WITH 1
/

create table FANTASY_WORKTEAM (
    id number DEFAULT FANTASY_WORKTEAM_SQ.nextval NOT NULL,
    workteam varchar2(100) not null,
    urlleague varchar2(1000),
    created date not null,
    created_by varchar2(255 char) not null,
    updated date not null,
    updated_by varchar2(255 char) not null
)
/

alter table FANTASY_WORKTEAM add constraint FANTASY_WORKTEAM_PK primary key (id)
/

create or replace trigger FANTASY_WORKTEAM_BIU
    before insert or update
    on FANTASY_WORKTEAM
    for each row
begin
    if inserting then
        :new.created := sysdate;
        :new.created_by := coalesce(sys_context('APEX$SESSION','APP_USER'),user);
    end if;
    :new.updated := sysdate;
    :new.updated_by := coalesce(sys_context('APEX$SESSION','APP_USER'),user);
end FANTASY_WORKTEAM_BIU;
/

PROMPT Insercion de un equipo de jugador por defecto para aplicar a todos los existentes
insert into FANTASY_WORKTEAM (workteam, urlleague)
values('Equipo defecto','');
COMMIT;


PROMPT Tablas a las que meter nuevo relacion hijo
ALTER TABLE FANTASY_PLAYER ADD (IDFANTASYWORKTEAM NUMBER NULL);

UPDATE FANTASY_PLAYER
SET IDFANTASYWORKTEAM = (SELECT ID FROM FANTASY_WORKTEAM WHERE WORKTEAM = 'Equipo defecto')
/
commit;

ALTER TABLE FANTASY_PLAYER MODIFY IDFANTASYWORKTEAM not null;

alter table FANTASY_PLAYER add constraint FANTASY_PLAYER_FK4 foreign  key (IDFANTASYWORKTEAM) references FANTASY_WORKTEAM(id);




ALTER TABLE FANTASY_PROYECTION ADD (IDFANTASYWORKTEAM NUMBER NULL);

UPDATE FANTASY_PROYECTION
SET IDFANTASYWORKTEAM = (SELECT ID FROM FANTASY_WORKTEAM WHERE WORKTEAM = 'Equipo defecto')
/
commit;

ALTER TABLE FANTASY_PROYECTION MODIFY IDFANTASYWORKTEAM not null;

alter table FANTASY_PROYECTION add constraint FANTASY_PROYECTION_FK5 foreign  key (IDFANTASYWORKTEAM) references FANTASY_WORKTEAM(id);




ALTER TABLE FANTASY_POINT ADD (IDFANTASYWORKTEAM NUMBER NULL);

UPDATE FANTASY_POINT
SET IDFANTASYWORKTEAM = (SELECT ID FROM FANTASY_WORKTEAM WHERE WORKTEAM = 'Equipo defecto')
/
commit;

ALTER TABLE FANTASY_POINT MODIFY IDFANTASYWORKTEAM not null;

alter table FANTASY_POINT add constraint FANTASY_POINT_FK3 foreign  key (IDFANTASYWORKTEAM) references FANTASY_WORKTEAM(id);




ALTER TABLE FANTASY_VALUE ADD (IDFANTASYWORKTEAM NUMBER NULL);

UPDATE FANTASY_VALUE
SET IDFANTASYWORKTEAM = (SELECT ID FROM FANTASY_WORKTEAM WHERE WORKTEAM = 'Equipo defecto')
/
commit;

ALTER TABLE FANTASY_VALUE MODIFY IDFANTASYWORKTEAM not null;

alter table FANTASY_VALUE add constraint FANTASY_VALUE_FK3 foreign  key (IDFANTASYWORKTEAM) references FANTASY_WORKTEAM(id);





PROMPT Cambios de UK
alter table FANTASY_PLAYER drop constraint FANTASY_PLAYER_UK;
alter table FANTASY_PLAYER add constraint FANTASY_PLAYER_UK unique(IDFANTASYSEASON,IDFANTASYWORKTEAM, NAME);

alter table FANTASY_POINT drop constraint FANTASY_POINT_UK;
alter table FANTASY_POINT add constraint FANTASY_POINT_UK unique(IDFANTASYSEASON,IDFANTASYWORKTEAM, WEEK, IDFANTASYPLAYER);

alter table FANTASY_PROYECTION drop constraint FANTASY_PROYECTION_UK;
alter table FANTASY_PROYECTION add constraint FANTASY_PROYECTION_UK unique(IDFANTASYSEASON,IDFANTASYWORKTEAM, WEEK, IDFANTASYSUPPLIER, IDFANTASYPOSITION);

alter table FANTASY_VALUE drop constraint FANTASY_VALUE_UK;
alter table FANTASY_VALUE add constraint FANTASY_VALUE_UK unique(IDFANTASYSEASON,IDFANTASYWORKTEAM, WEEK, IDFANTASYSUPPLIER);