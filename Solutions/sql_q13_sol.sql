-- Question 13: Write a SQL query to find all the defenders who scored a goal for their teams.
SELECT s.country_name AS team_name, p.player_name AS defender_name, COUNT(*) AS total_score
FROM euro_cup_2016.goal_details AS g
LEFT JOIN euro_cup_2016.player_mast AS p
	ON g.player_id= p.player_id
LEFT JOIN euro_cup_2016.soccer_country AS s
	ON g.team_id= s.country_id
WHERE p.posi_to_play = 'DF'
GROUP BY s.country_name,p.player_name
ORDER BY s.country_name ;
