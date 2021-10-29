-- Question 4: Write a SQL query to compute a list showing the number of substitutions that happened in various stages of play for the entire tournament.
SELECT play_half, play_schedule, COUNT(*) AS sub_num
FROM euro_cup_2016.player_in_out
WHERE in_out = 'I'
GROUP BY play_half, play_schedule
ORDER BY play_half, play_schedule, sub_num DESC;
