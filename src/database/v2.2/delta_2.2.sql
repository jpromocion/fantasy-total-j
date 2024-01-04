

create table FANTASY_POSITION_WORKTEAM (
    IDFANTASYWORKTEAM NUMBER not null,
    IDFANTASYPOSITION NUMBER not null,
    created date not null,
    created_by varchar2(255 char) not null,
    updated date not null,
    updated_by varchar2(255 char) not null
)
/

alter table FANTASY_POSITION_WORKTEAM add constraint FANTASY_POSITION_WORKTEAM_PK primary key (IDFANTASYWORKTEAM, IDFANTASYPOSITION)
/

alter table FANTASY_POSITION_WORKTEAM add constraint FANTASY_POSITION_WORKTEAM_FK1 foreign  key (IDFANTASYWORKTEAM) references FANTASY_WORKTEAM(ID)
/

alter table FANTASY_POSITION_WORKTEAM add constraint FANTASY_POSITION_WORKTEAM_FK2 foreign  key (IDFANTASYPOSITION) references FANTASY_POSITION(ID)
/

create or replace trigger FANTASY_POSITION_WORKTEAM_BIU
    before insert or update
    on FANTASY_POSITION_WORKTEAM
    for each row
begin
    if inserting then
        :new.created := sysdate;
        :new.created_by := coalesce(sys_context('APEX$SESSION','APP_USER'),user);
    end if;
    :new.updated := sysdate;
    :new.updated_by := coalesce(sys_context('APEX$SESSION','APP_USER'),user);
end FANTASY_POSITION_WORKTEAM_BIU;
/

PROMPT Insercion segun las prouyeccions cargadas
insert into FANTASY_POSITION_WORKTEAM (IDFANTASYWORKTEAM, IDFANTASYPOSITION)
SELECT IDFANTASYWORKTEAM, IDFANTASYPOSITION
FROM FANTASY_PROYECTION
group by IDFANTASYWORKTEAM, IDFANTASYPOSITION
ORDER BY IDFANTASYWORKTEAM, IDFANTASYPOSITION;
COMMIT;


PROMPT fk en tabla de proyecciones
alter table FANTASY_PROYECTION add constraint FANTASY_PROYECTION_FK6 foreign  key (IDFANTASYWORKTEAM, IDFANTASYPOSITION) references FANTASY_POSITION_WORKTEAM(IDFANTASYWORKTEAM, IDFANTASYPOSITION)
/







PROMPT Posiciones base


CREATE SEQUENCE FANTASY_POSITION_BASE_SQ
  INCREMENT BY 1
  MINVALUE 1
  MAXVALUE 999999999999999
  NOCACHE
  NOCYCLE
  START WITH 1
/

create table FANTASY_POSITION_BASE (
    id number DEFAULT FANTASY_POSITION_BASE_SQ.nextval NOT NULL,
    POSITION	VARCHAR2(5) NOT NULL,
    NAME	VARCHAR2(100) NOT NULL,
    created date not null,
    created_by varchar2(255 char) not null,
    updated date not null,
    updated_by varchar2(255 char) not null
)
/

alter table FANTASY_POSITION_BASE add constraint FANTASY_POSITION_BASE_PK primary key (id)
/

create or replace trigger FANTASY_POSITION_BASE_BIU
    before insert or update
    on FANTASY_POSITION_BASE
    for each row
begin
    if inserting then
        :new.created := sysdate;
        :new.created_by := coalesce(sys_context('APEX$SESSION','APP_USER'),user);
    end if;
    :new.updated := sysdate;
    :new.updated_by := coalesce(sys_context('APEX$SESSION','APP_USER'),user);
end FANTASY_POSITION_BASE_BIU;
/

insert into FANTASY_POSITION_BASE(position, name)
values('QB', 'Quaterback');
insert into FANTASY_POSITION_BASE(position, name)
values('RB', 'Runningback');
insert into FANTASY_POSITION_BASE(position, name)
values('WR', 'Wide Receiver');
insert into FANTASY_POSITION_BASE(position, name)
values('TE', 'Tigh End');
commit;


PROMPT Revisar tabla de posicion jugador
ALTER TABLE FANTASY_PLAYER DROP CONSTRAINT FANTASY_PLAYER_FK2;

UPDATE FANTASY_PLAYER FP
SET FP.IDFANTASYPOSITION =
  (SELECT
    (SELECT POB.ID
    FROM FANTASY_POSITION_BASE POB
    WHERE
      (
          PO.POSITION = 'QB' AND POB.position = 'QB'
          OR PO.POSITION IN ('RB1','RB2') AND POB.position = 'RB'
          OR PO.POSITION IN ('WR1','WR1') AND POB.position = 'WR'
          OR PO.POSITION IN ('TE') AND POB.position = 'TE'
      )
    )
  FROM FANTASY_POSITION PO
  WHERE PO.ID = FP.IDFANTASYPOSITION)
/
COMMIT;

ALTER TABLE FANTASY_PLAYER RENAME COLUMN IDFANTASYPOSITION TO IDFANTASYPOSITIONBASE;

ALTER TABLE FANTASY_PLAYER add CONSTRAINT FANTASY_PLAYER_FK2 FOREIGN KEY (IDFANTASYPOSITIONBASE) REFERENCES FANTASY_POSITION_BASE(id)
/


PROMPT Tabla relacione cada posicion con posiciones base que admite
create table FANTASY_POSITION_BASE_RELA (
    IDFANTASYPOSITION NUMBER not null,
    IDFANTASYPOSITIONBASE NUMBER not null,
    created date not null,
    created_by varchar2(255 char) not null,
    updated date not null,
    updated_by varchar2(255 char) not null
)
/

alter table FANTASY_POSITION_BASE_RELA add constraint FANTASY_POSITION_BASE_RELA_PK primary key (IDFANTASYPOSITION, IDFANTASYPOSITIONBASE)
/
ALTER TABLE FANTASY_POSITION_BASE_RELA add CONSTRAINT FANTASY_POSITION_BASE_RELA_FK1 FOREIGN KEY (IDFANTASYPOSITION) REFERENCES FANTASY_POSITION(id)
/
ALTER TABLE FANTASY_POSITION_BASE_RELA add CONSTRAINT FANTASY_POSITION_BASE_RELA_FK2 FOREIGN KEY (IDFANTASYPOSITIONBASE) REFERENCES FANTASY_POSITION_BASE(id)
/


create or replace trigger FANTASY_POSITION_BASE_RELA_BIU
    before insert or update
    on FANTASY_POSITION_BASE_RELA
    for each row
begin
    if inserting then
        :new.created := sysdate;
        :new.created_by := coalesce(sys_context('APEX$SESSION','APP_USER'),user);
    end if;
    :new.updated := sysdate;
    :new.updated_by := coalesce(sys_context('APEX$SESSION','APP_USER'),user);
end FANTASY_POSITION_BASE_RELA_BIU;
/

