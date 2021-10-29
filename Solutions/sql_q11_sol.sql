-- Question 11: Write a SQL query to find the players, their jersey number, and playing club who were the goalkeepers for England in EURO Cup 2016.
SELECT player_name, jersey_no, playing_club
FROM euro_cup_2016.player_mast
WHERE posi_to_play = 'GK'
 AND  team_id = (
	SELECT country_id
	FROM euro_cup_2016.soccer_country
	WHERE country_name = 'England'
	);
