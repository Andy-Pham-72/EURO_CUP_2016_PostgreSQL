/*
Andy Pham EURO_CUP_2016 mini project
*/

CREATE SCHEMA IF NOT EXISTS euro_cup_2016;

# soccer_country table
DROP TABLE IF EXISTS euro_cup_2016.soccer_country;

CREATE TABLE  soccer_country (
	country_id NUMERIC NOT NULL ,
	country_abbr VARCHAR(4),
	country_name VARCHAR(40),
  PRIMARY KEY(country_id)
) ENGINE=MyISAM  ;

# soccer_city table
DROP TABLE IF EXISTS euro_cup_2016.soccer_city;

CREATE TABLE  soccer_city (
	city_id NUMERIC NOT NULL,
	city VARCHAR(25),
	country_id NUMERIC,
  PRIMARY KEY(city_id),
    FOREIGN KEY(country_id)
      REFERENCES soccer_country(country_id)
) ENGINE=MyISAM  ;

# soccer_venue table
DROP TABLE IF EXISTS euro_cup_2016.soccer_venue;

CREATE TABLE  soccer_venue (
	venue_id NUMERIC NOT NULL,
	venue_name VARCHAR(30),
  city_id NUMERIC,
  aud_capicity NUMERIC,
  PRIMARY KEY(venue_id),
    FOREIGN KEY(city_id)
      REFERENCES soccer_city(city_id)
)ENGINE=MyISAM  ;

# soccer_team table
DROP TABLE IF EXISTS euro_cup_2016.soccer_team ;

CREATE TABLE  soccer_team (
	team_id NUMERIC NOT NULL,
	team_group CHARACTER(1),
  match_played NUMERIC,
  won NUMERIC,
  draw NUMERIC,
  lost NUMERIC,
  goal_for NUMERIC,
  goal_agnst NUMERIC,
  goal_diff NUMERIC,
  points NUMERIC,
  group_position NUMERIC,
    FOREIGN KEY(team_id)
      REFERENCES soccer_country(country_id)
)ENGINE=MyISAM  ;

# playing_position table
DROP TABLE IF EXISTS euro_cup_2016.playing_position;

CREATE TABLE  playing_position (
	position_id VARCHAR(2) NOT NULL,
  position_desc VARCHAR(15),
  PRIMARY KEY(position_id)
)ENGINE=MyISAM  ;

# player_mast table
DROP TABLE IF EXISTS euro_cup_2016.player_mast;

CREATE TABLE  player_mast (
	player_id NUMERIC NOT NULL,
  team_id NUMERIC,
  jersey_no NUMERIC,
  player_name VARCHAR(40),
  posi_to_play CHARACTER(2),
  dt_of_bir DATE,
  age NUMERIC,
  playing_club VARCHAR(40),
  PRIMARY KEY(player_id),
  CONSTRAINT playerMast_playerId_soccerCountry_fk
    FOREIGN KEY(team_id)
      REFERENCES soccer_country(country_id)
      ON DELETE CASCADE,
  CONSTRAINT playerMast_posiToPlay_soccerCountry_fk
    FOREIGN KEY(posi_to_play)
      REFERENCES playing_position(position_id)
      ON DELETE CASCADE
)ENGINE=MyISAM  ;

# referee_mast table
DROP TABLE IF EXISTS euro_cup_2016.referee_mast;

CREATE TABLE  referee_mast (
	referee_id NUMERIC NOT NULL,
  referee_name VARCHAR(40),
  country_id NUMERIC,
  PRIMARY KEY(referee_id),
    FOREIGN KEY(country_id)
      REFERENCES soccer_country(country_id)
)ENGINE=MyISAM  ;

# match_mast table
DROP TABLE IF EXISTS euro_cup_2016.match_mast;

CREATE TABLE  match_mast (
	match_no NUMERIC NOT NULL,
  play_stage CHARACTER(1),
  play_date DATE,
  results CHARACTER(5),
  decided_by CHARACTER(1),
  goal_score CHARACTER(5),
  venue_id NUMERIC,
  referee_id NUMERIC,
  audence NUMERIC,
  plr_of_match NUMERIC,
  stop1_sec NUMERIC,
  stop2_sec NUMERIC,
  PRIMARY KEY(match_no),
  CONSTRAINT matchMast_matchNo_soccerVenue_fk
    FOREIGN KEY(venue_id)
      REFERENCES soccer_venue(venue_id)
      ON DELETE CASCADE,
  CONSTRAINT matchMast_refereeId_refereeMast_fk
    FOREIGN KEY(referee_id)
      REFERENCES referee_mast(referee_id)
      ON DELETE CASCADE,
  CONSTRAINT matchMast_plrOfMatch_playerMast_fk
    FOREIGN KEY(plr_of_match)
      REFERENCES player_mast(player_id)
      ON DELETE CASCADE
)ENGINE=MyISAM  ;

# coach_mast table
DROP TABLE IF EXISTS euro_cup_2016.coach_mast;

CREATE TABLE  coach_mast (
	coach_id NUMERIC NOT NULL,
  coach_name VARCHAR(40),
  PRIMARY KEY(coach_id)
)ENGINE=MyISAM  ;

# asst_referee_mast table
DROP TABLE IF EXISTS euro_cup_2016.asst_referee_mast;

CREATE TABLE  asst_referee_mast (
	ass_ref_id NUMERIC NOT NULL,
  ass_ref_name VARCHAR(40),
  country_id NUMERIC,
  PRIMARY KEY(ass_ref_id),
    FOREIGN KEY(country_id)
      REFERENCES soccer_country(country_id)
)ENGINE=MyISAM  ;

# match_details table
DROP TABLE IF EXISTS euro_cup_2016.match_details;

CREATE TABLE  match_details (
  match_no NUMERIC,
  play_stage VARCHAR(1),
  team_id NUMERIC,
  win_lose VARCHAR(1),
  decided_by VARCHAR(1),
  goal_score NUMERIC,
  penalty_score NUMERIC,
  ass_ref NUMERIC,
  player_gk NUMERIC,
    FOREIGN KEY(ass_ref)
      REFERENCES asst_referee_mast(ass_ref_id),
    FOREIGN KEY(player_gk)
      REFERENCES player_mast(player_id)
)ENGINE=MyISAM  ;

# goal_details table
DROP TABLE IF EXISTS euro_cup_2016.goal_details;

CREATE TABLE  goal_details (
  goal_id NUMERIC NOT NULL,
  match_no NUMERIC,
  player_id NUMERIC,
  team_id NUMERIC,
  goal_time NUMERIC,
  goal_type CHARACTER(1),
  play_stage CHARACTER(1),
  goal_schedule CHARACTER(2),
  goal_half NUMERIC,
  PRIMARY KEY(goal_id),
  CONSTRAINT goalDetails_matchNo_matchMast_fk
    FOREIGN KEY(match_no)
      REFERENCES match_mast(match_no)
      ON DELETE CASCADE,
  CONSTRAINT goalDetails_playerId_playerMast_fk
    FOREIGN KEY(player_id)
      REFERENCES player_mast(player_id)
      ON DELETE CASCADE
)ENGINE=MyISAM  ;

# penalty_shootout table
DROP TABLE IF EXISTS euro_cup_2016.penalty_shootout;

CREATE TABLE  penalty_shootout (
  kick_id NUMERIC NOT NULL,
  match_no NUMERIC,
  team_id NUMERIC,
  player_id NUMERIC,
  score_goal VARCHAR(1),
  kick_no NUMERIC,
  PRIMARY KEY(kick_id),
  CONSTRAINT penaltyShootout_matchNo_matchMast_fk
    FOREIGN KEY(match_no)
      REFERENCES match_mast(match_no)
      ON DELETE CASCADE,
  CONSTRAINT penaltyShootout_teamId_soccerCountry_fk
    FOREIGN KEY(team_id)
      REFERENCES soccer_country(country_id)
      ON DELETE CASCADE,
    CONSTRAINT penaltyShootout_playerId_playerMast_fk
      FOREIGN KEY(player_id)
        REFERENCES player_mast(player_id)
        ON DELETE CASCADE
)ENGINE=MyISAM  ;

# player_booked table
DROP TABLE IF EXISTS euro_cup_2016.player_booked ;

CREATE TABLE  player_booked (
  match_no NUMERIC,
  team_id NUMERIC,
  player_id NUMERIC,
  booking_time VARCHAR(40),
  sent_off CHARACTER(1),
  play_schedule CHARACTER(2),
  play_half NUMERIC,
  CONSTRAINT playerBooked_matchNo_matchMast_fk
    FOREIGN KEY(match_no)
      REFERENCES match_mast(match_no)
      ON DELETE CASCADE,
  CONSTRAINT playerBooked_teamId_soccerCountry_fk
    FOREIGN KEY(team_id)
      REFERENCES soccer_country(country_id)
      ON DELETE CASCADE,
  CONSTRAINT playerBooked_playerId_playerMast_fk
    FOREIGN KEY(player_id)
      REFERENCES player_mast(player_id)
      ON DELETE CASCADE
)ENGINE=MyISAM  ;

# player_in_out table
DROP TABLE IF EXISTS euro_cup_2016.player_in_out;

CREATE TABLE  player_in_out (
  match_no NUMERIC,
  team_id NUMERIC,
  player_id NUMERIC,
  in_out CHARACTER(1),
  time_in_out NUMERIC,
  play_schedule CHARACTER(2),
  play_half NUMERIC,
  CONSTRAINT playerInOut_matchNo_matchMast_fk
    FOREIGN KEY(match_no)
      REFERENCES match_mast(match_no)
      ON DELETE CASCADE,
  CONSTRAINT playerInOut_teamId_soccerCountry_fk
    FOREIGN KEY(team_id)
      REFERENCES soccer_country(country_id)
      ON DELETE CASCADE,
  CONSTRAINT playerInOut_playerId_playerMast_fk
    FOREIGN KEY(player_id)
      REFERENCES player_mast(player_id)
      ON DELETE CASCADE
)ENGINE=MyISAM  ;

# match_captain table
DROP TABLE IF EXISTS euro_cup_2016.match_captain;

CREATE TABLE  match_captain (
  match_no NUMERIC,
  team_id NUMERIC,
  player_captain NUMERIC,
  CONSTRAINT matchCaptain_matchNo_matchMast_fk
    FOREIGN KEY(match_no)
      REFERENCES match_mast(match_no)
      ON DELETE CASCADE,
  CONSTRAINT matchCaptain_teamId_soccerCountry_fk
    FOREIGN KEY(team_id)
      REFERENCES soccer_country(country_id)
      ON DELETE CASCADE,
  CONSTRAINT matchCaptain_playerCaptain_soccerCountry_fk
    FOREIGN KEY(player_captain)
      REFERENCES player_mast(player_id)
      ON DELETE CASCADE
)ENGINE=MyISAM  ;

# team_coaches table
DROP TABLE IF EXISTS euro_cup_2016.team_coaches;

CREATE TABLE  team_coaches (
  team_id NUMERIC,
  coach_id NUMERIC,
  CONSTRAINT teamCoaches_teamId_soccerCountry_fk
    FOREIGN KEY(team_id)
      REFERENCES soccer_country(country_id)
      ON DELETE CASCADE,
  CONSTRAINT teamCoaches_coachId_soccerCountry_fk
    FOREIGN KEY(coach_id)
      REFERENCES coach_mast(coach_id)
      ON DELETE CASCADE
)ENGINE=MyISAM  ;

# penalty_gk table
DROP TABLE IF EXISTS euro_cup_2016.penalty_gk;

CREATE TABLE  penalty_gk (
  match_no NUMERIC,
  team_id NUMERIC,
  player_gk NUMERIC,
  CONSTRAINT penaltyGk_matchId_soccerCountry_fk
    FOREIGN KEY(match_no)
      REFERENCES match_mast(match_no)
      ON DELETE CASCADE,
  CONSTRAINT penaltyGk_teamId_soccerCountry_fk
    FOREIGN KEY(team_id)
      REFERENCES soccer_country(team_id)
      ON DELETE CASCADE,
  CONSTRAINT penaltyGk_playerGk_soccerCountry_fk
    FOREIGN KEY(player_gk)
      REFERENCES player_mast(player_id)
      ON DELETE CASCADE
)ENGINE=MyISAM  ;
