create table FANTASY_POSITION (
    id number generated by default on null as identity,
    position varchar2(5) not null,
    name varchar2(100) not null,
    visualorder number(2,0) not null,
    created date not null,
    created_by varchar2(255 char) not null,
    updated date not null,
    updated_by varchar2(255 char) not null
);

alter table FANTASY_POSITION add constraint FANTASY_POSITION_PK primary key (id);
alter table FANTASY_POSITION add constraint FANTASY_POSITION_UK unique (position);