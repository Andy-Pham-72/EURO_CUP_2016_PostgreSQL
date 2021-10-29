-- Question 16:  Write a SQL query to find referees and the number of matches they worked in each venue.
SELECT r.referee_id, r.referee_name, s.venue_name, COUNT(m.match_no) AS total_matches
FROM euro_cup_2016.referee_mast AS r
LEFT JOIN euro_cup_2016.match_mast AS m
	ON r.referee_id = m.referee_id
LEFT JOIN euro_cup_2016.soccer_venue as s
	ON m.venue_id = s.venue_id
GROUP BY r.referee_id, r.referee_name, s.venue_name
ORDER BY total_matches DESC;
