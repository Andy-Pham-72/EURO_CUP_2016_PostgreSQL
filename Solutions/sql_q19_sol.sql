-- Question 19: Write a SQL query to find the number of captains who were also goalkeepers.
SELECT COUNT(DISTINCT m.player_captain) AS num_cap_as_goalkeep
FROM euro_cup_2016.match_captain AS m
LEFT JOIN euro_cup_2016.player_mast AS p
	ON m.player_captain = p.player_id
WHERE p.posi_to_play = 'GK';
