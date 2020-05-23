
-- Generated by Oracle SQL Developer Data Modeler 19.2.0.182.1216
--   at:        2020-05-23 20:52:43 EEST
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



CREATE TABLE away_team (
    away_team VARCHAR2(28) NOT NULL
);

CREATE UNIQUE INDEX away_team__idx ON
    away_team (
        away_team
    ASC );

ALTER TABLE away_team ADD CONSTRAINT away_team_pk PRIMARY KEY ( away_team );

CREATE TABLE coach (
    coach_name VARCHAR2(28) NOT NULL
);



CREATE TABLE home_team (
    home_team VARCHAR2(28) NOT NULL
);

CREATE UNIQUE INDEX home_team__idx ON
    home_team (
        home_team
    ASC );

ALTER TABLE home_team ADD CONSTRAINT home_team_pk PRIMARY KEY ( home_team );

CREATE TABLE location (
    country   VARCHAR2(28) NOT NULL,
    city      VARCHAR2(28) NOT NULL
);

ALTER TABLE location ADD CONSTRAINT location_pk PRIMARY KEY ( city,
                                                              country );

CREATE TABLE match (
    match_id     INTEGER NOT NULL,
    dates        DATE,
    tournament   VARCHAR2(38),
    neutral      VARCHAR2(28)
);

ALTER TABLE match ADD CONSTRAINT match_pk PRIMARY KEY ( match_id );

CREATE TABLE play (
    match_id    INTEGER NOT NULL,
    city        VARCHAR2(28) NOT NULL,
    country     VARCHAR2(28) NOT NULL,
    home_team   VARCHAR2(28) NOT NULL,
    away_team   VARCHAR2(28) NOT NULL
);

CREATE UNIQUE INDEX play__idx ON
    play (
        match_id
    ASC );

CREATE TABLE player (
    player_name VARCHAR2(38) NOT NULL
);

ALTER TABLE player ADD CONSTRAINT player_pk PRIMARY KEY ( player_name );

CREATE TABLE team (
    team VARCHAR2(28) NOT NULL
);

ALTER TABLE team ADD CONSTRAINT team_pk PRIMARY KEY ( team );

CREATE TABLE team_player (
    team          VARCHAR2(28) NOT NULL,
    player_name   VARCHAR2(38) NOT NULL,
    coach_name    VARCHAR2(28) NOT NULL
);

CREATE UNIQUE INDEX team_player__idx ON
    team_player (
        player_name
    ASC );


CREATE UNIQUE INDEX team_player__idxv2 ON
    team_player (
        team
    ASC );

ALTER TABLE away_team
    ADD CONSTRAINT away_team_team_fk FOREIGN KEY ( away_team )
        REFERENCES team ( team );

ALTER TABLE home_team
    ADD CONSTRAINT home_team_team_fk FOREIGN KEY ( home_team )
        REFERENCES team ( team );

ALTER TABLE play
    ADD CONSTRAINT play_away_team_fk FOREIGN KEY ( away_team )
        REFERENCES away_team ( away_team );

ALTER TABLE play
    ADD CONSTRAINT play_home_team_fk FOREIGN KEY ( home_team )
        REFERENCES home_team ( home_team );

ALTER TABLE play
    ADD CONSTRAINT play_location_fk FOREIGN KEY ( city,
                                                  country )
        REFERENCES location ( city,
                              country );

ALTER TABLE play
    ADD CONSTRAINT play_match_fk FOREIGN KEY ( match_id )
        REFERENCES match ( match_id );



ALTER TABLE team_player
    ADD CONSTRAINT team_player_player_fk FOREIGN KEY ( player_name )
        REFERENCES player ( player_name );

ALTER TABLE team_player
    ADD CONSTRAINT team_player_team_fk FOREIGN KEY ( team )
        REFERENCES team ( team );



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             9
-- CREATE INDEX                             6
-- ALTER TABLE                             16
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
