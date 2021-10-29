-- Question 12: Write a SQL query that returns the total number of goals scored by each position on each country's team. Do not include positions which scored no goals.
SELECT s.country_name, p.posi_to_play, COUNT(*) AS total_score
FROM euro_cup_2016.goal_details AS g
LEFT JOIN euro_cup_2016.player_mast AS p
	ON g.player_id= p.player_id
LEFT JOIN euro_cup_2016.soccer_country AS s
	ON g.team_id= s.country_id
GROUP BY s.country_name, p.posi_to_play
ORDER BY s.country_name ;

-- 2nd solution
/*
WITH temp AS (
	SELECT g.team_id AS country_id, g.player_id, p.posi_to_play, COUNT(*) AS total_score_per_posi
	FROM euro_cup_2016.goal_details AS g
	LEFT JOIN euro_cup_2016.player_mast AS p
		ON p.player_id = g.player_id
	GROUP BY g.team_id, g.player_id, p.posi_to_play
	ORDER BY g.team_id
)
SELECT s.country_name, t.posi_to_play, SUM(total_score_per_posi) AS total_score
FROM temp AS t
LEFT JOIN euro_cup_2016.soccer_country AS s
ON t.country_id = s.country_id
GROUP BY s.country_name, t.posi_to_play
ORDER BY s.country_name ;
*/
