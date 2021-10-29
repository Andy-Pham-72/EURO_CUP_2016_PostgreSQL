-- Question 6: Write a SQL query to find the number of matches that were won by a single point, but do not include matches decided by penalty shootout.
SELECT COUNT(DISTINCT match_no) AS num_match_single_point_no_penalty
FROM euro_cup_2016.match_details
WHERE win_lose = 'W'
 AND  goal_score = 1
 AND decided_by <> 'P';
