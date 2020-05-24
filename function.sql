create type func as object( 
    match_id integer,
    dates date,
    tournament varchar(28),
    home_team varchar(28),
    away_team varchar(28)
);
create type play_match is table of func;
create or replace function total_match(home_team1 varchar default 'Team1',away_team1 varchar default 'Team2') return play_match pipelined is
begin
    for i in (
    select match.match_id, match.dates, match.tournament, play.home_team, play.away_team
    from match join play on match.match_id = play.match_id)
    loop 
        pipe row(i);
    end loop;
end;
    
