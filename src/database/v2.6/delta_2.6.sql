

create table FANTASY_PLAYER_POSITION_BASE_ADI (
    IDFANTASYPLAYER NUMBER not null,
    IDFANTASYPOSITIONBASE NUMBER not null,
    created date not null,
    created_by varchar2(255 char) not null,
    updated date not null,
    updated_by varchar2(255 char) not null
)
/

alter table FANTASY_PLAYER_POSITION_BASE_ADI add constraint FANTASY_PLAYER_POSITION_BASE_ADI_PK primary key (IDFANTASYPLAYER, IDFANTASYPOSITIONBASE)
/

alter table FANTASY_PLAYER_POSITION_BASE_ADI add constraint FANTASY_PLAYER_POSITION_BASE_ADI_FK1 foreign  key (IDFANTASYPLAYER) references FANTASY_PLAYER(ID)
/

alter table FANTASY_PLAYER_POSITION_BASE_ADI add constraint FANTASY_PLAYER_POSITION_BASE_ADI_FK2 foreign  key (IDFANTASYPOSITIONBASE) references FANTASY_POSITION_BASE(ID)
/

create or replace trigger FANTASY_PLAYER_POSITION_BASE_ADI_BIU
    before insert or update
    on FANTASY_PLAYER_POSITION_BASE_ADI
    for each row
begin
    if inserting then
        :new.created := sysdate;
        :new.created_by := coalesce(sys_context('APEX$SESSION','APP_USER'),user);
    end if;
    :new.updated := sysdate;
    :new.updated_by := coalesce(sys_context('APEX$SESSION','APP_USER'),user);
end FANTASY_PLAYER_POSITION_BASE_ADI_BIU;
/





