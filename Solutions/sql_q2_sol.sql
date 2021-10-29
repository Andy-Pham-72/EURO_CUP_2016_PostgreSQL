-- Question 2: Write a SQL query to find the number of matches that were won by penalty shootout.
SELECT COUNT(DISTINCT p.match_no) AS num_win_matches_by_penalty_shootout
FROM euro_cup_2016.penalty_shootout AS p
LEFT JOIN euro_cup_2016.match_details AS m
	ON p.match_no = m.match_no
WHERE m.win_lose = 'W';
