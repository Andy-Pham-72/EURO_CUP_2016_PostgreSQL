-- Question 15: Write a SQL query to find the referees who booked the most number of players.
-- TOP 10 Referees who booked the most number of players
SELECT r.referee_id, r.referee_name, COUNT(DISTINCT p.player_id) AS total_booked_players
FROM euro_cup_2016.referee_mast AS r
LEFT JOIN euro_cup_2016.match_mast AS m
	ON r.referee_id = m.referee_id
LEFT JOIN euro_cup_2016.player_booked as p
	ON m.match_no = p.match_no
GROUP BY r.referee_id, r.referee_name
ORDER BY total_booked_players DESC
LIMIT 10;
