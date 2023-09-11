create table FANTASY_PLAYER (
    id number generated by default on null as identity,
    idfantasyseason number(4,0) not null,
    name varchar2(50) not null,
    idfantasyposition number not null,
    created date not null,
    created_by varchar2(255 char) not null,
    updated date not null,
    updated_by varchar2(255 char) not null,
    urlphoto varchar2(1000),
    idfantasyteam number
);

alter table FANTASY_PLAYER add constraint FANTASY_PLAYER_PK primary key (id);
alter table FANTASY_PLAYER add constraint FANTASY_PLAYER_FK foreign  key (idfantasyseason) references FANTASY_SEASON(id);
alter table FANTASY_PLAYER add constraint FANTASY_PLAYER_FK2 foreign  key (idfantasyposition) references FANTASY_POSITION(id);
alter table FANTASY_PLAYER add constraint FANTASY_PLAYER_UK unique (idfantasyseason, name);
alter table FANTASY_PLAYER add constraint FANTASY_PLAYER_FK3 foreign  key (idfantasyteam) references FANTASY_TEAM(id);