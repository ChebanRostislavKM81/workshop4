
CREATE OR REPLACE PACKAGE package1 is
    type func is RECORD( 
        match_id integer,
        dates date,
        tournament varchar(28),
        home_team varchar(28),
        away_team varchar(28) );
    type play_match is table of func;
    function total_match(home_team1 varchar default 'Team1',away_team1 varchar default 'Team2') return play_match pipelined;
    procedure teams_loc_match(
    home_team_procedure home_team.home_team%TYPE,
    away_team_procedure away_team.away_team%TYPE,
    match_id_procedure match.match_id%TYPE,
    city_procedure location.city%TYPE,
    country_procedure location.country%TYPE);
end package1;
/
CREATE OR REPLACE PACKAGE body package1 is
    function total_match(home_team1 varchar default 'Team1',away_team1 varchar default 'Team2') return play_match pipelined is
    begin
        for i in (
            select match.match_id, match.dates, match.tournament, play.home_team, play.away_team
            from match join play on match.match_id = play.match_id)
        loop 
            pipe row(i);
        end loop;
    end;
    procedure teams_loc_match(
    home_team_procedure home_team.home_team%TYPE,
    away_team_procedure away_team.away_team%TYPE,
    match_id_procedure match.match_id%TYPE,
    city_procedure location.city%TYPE,
    country_procedure location.country%TYPE)as 
        home_team_variable home_team.home_team%TYPE;
        away_team_variable away_team.away_team%TYPE;
        match_id_variable match.match_id%TYPE;
        city_variable location.city%TYPE;
        country_variable location.country%TYPE;
    begin 
        select home_team 
        into home_team_variable
        from home_team where home_team_procedure = home_team;
        select away_team 
        into away_team_variable
        from away_team where away_team_procedure = away_team;
        select match_id 
        into match_id_variable
        from match where match_id_procedure = match_id;
        select city
        into city_variable
        from location where city_procedure = city;
        select country
        into country_variable
        from location where country_procedure = country;
        
        insert into play(match_id, city, country, home_team, away_team)
        values(match_id_procedure, city_procedure, country_procedure, home_team_procedure, away_team_procedure);
        
     exception
        when NO_DATA_FOUND
        then
            DBMS_OUTPUT.put_line('There is no such team match or loc');
    END;
end package1;
