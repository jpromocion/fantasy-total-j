
create or replace trigger FANTASY_PLAYER_BIU
    before insert or update
    on FANTASY_PLAYER
    for each row
begin
    if inserting then
        :new.created := sysdate;
        :new.created_by := coalesce(sys_context('APEX$SESSION','APP_USER'),user);
    end if;
    :new.updated := sysdate;
    :new.updated_by := coalesce(sys_context('APEX$SESSION','APP_USER'),user);
end FANTASY_PLAYER_BIU;
/