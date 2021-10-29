-- Question 20: Write a SQL query to find the substitude players who came into the field in the first half of play, within a normal play schedule.

SELECT p1.match_no, p2.player_name, p2.player_id, p2.jersey_no, p1.time_in_out
FROM euro_cup_2016.player_in_out AS p1
LEFT JOIN euro_cup_2016.player_mast AS p2
	ON p1.player_id = p2.player_id
WHERE p1.play_half = 1
 AND  p1.in_out = 'I'
 AND  p1.play_schedule = 'NT'
ORDER BY p2.player_name ASC;
