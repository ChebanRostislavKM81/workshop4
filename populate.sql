

INSERT INTO TEAM(team)
VALUES('England');
INSERT INTO TEAM(team)
VALUES('Wales');
INSERT INTO TEAM(team)
VALUES('Ireland');

INSERT INTO PLAYER(player_name)
VALUES('Rooney');
INSERT INTO PLAYER(player_name)
VALUES('Bale');
INSERT INTO PLAYER(player_name)
VALUES('Duffy');




INSERT INTO MATCH(match_id, dates, tournament, neutral)
VALUES(1, '01.01.70', 'Friendly', 'FALSE');
INSERT INTO MATCH(match_id, dates, tournament, neutral)
VALUES(2, '02.01.70', 'Friendly', 'FALSE');
INSERT INTO MATCH(match_id, dates, tournament, neutral)
VALUES(3, '03.01.70', 'Friendly', 'FALSE');

INSERT INTO LOCATION(country, city)
VALUES('England','London');
INSERT INTO LOCATION(country, city)
VALUES('Wales','Cardiff');
INSERT INTO LOCATION(country, city)
VALUES('Dublin','Ireland');


INSERT INTO HOME_TEAM(home_team)
VALUES('England');
INSERT INTO HOME_TEAM(home_team)
VALUES('Wales');
INSERT INTO HOME_TEAM(home_team)
VALUES('Ireland');

INSERT INTO COACH(coach_name)
VALUES('Bob');
INSERT INTO COACH(coach_name)
VALUES('Davies');
INSERT INTO COACH(coach_name)
VALUES('Daniels');

INSERT INTO AWAY_TEAM(away_team)
VALUES('England');
INSERT INTO AWAY_TEAM(away_team)
VALUES('Wales');
INSERT INTO AWAY_TEAM(away_team)
VALUES('Ireland');

INSERT INTO PLAY(match_id, city, country, home_team, away_team)
VALUES(1, 'London', 'England', 'England', 'Wales');
INSERT INTO PLAY(match_id, city, country, home_team, away_team)
VALUES(2, 'Cardiff', 'Wales', 'Wales', 'Ireland');


INSERT INTO TEAM_PLAYER(team, player_name, coach_name)
VALUES('England', 'Rooney', 'Bob');
INSERT INTO TEAM_PLAYER(team, player_name, coach_name)
VALUES('Wales', 'Bale', 'Bob');
INSERT INTO TEAM_PLAYER(team, player_name, coach_name)
VALUES('Ireland', 'Duffy', 'Daniels');
