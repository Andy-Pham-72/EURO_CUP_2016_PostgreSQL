-- Question 8: Write a SQL query to find the match number for the game with the highest number of penalty shots, and which countries played that match.
SELECT match_no,
		COUNT(*) AS highest_penalty_shot
FROM euro_cup_2016.penalty_shootout
GROUP BY match_no
HAVING COUNT(*) = (
	SELECT MAX(highest_penalty_shot)
	FROM (
		SELECT COUNT(*) AS highest_penalty_shot
		FROM euro_cup_2016.penalty_shootout
		GROUP BY match_no
	) AS max_num_shot_calculation
);

-- 2nd solution
/*
SELECT match_no, COUNT(*) AS highest_penalty_shot
FROM euro_cup_2016.penalty_shootout
GROUP BY match_no
ORDER BY highest_penalty_shot DESC
LIMIT 1;
*/
