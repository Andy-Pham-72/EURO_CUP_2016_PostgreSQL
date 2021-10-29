-- Question 18: Write a SQL query to find the highest number of foul cards given to one match.
WITH temp AS (
SELECT match_no, COUNT(*) as num_booked
FROM euro_cup_2016.player_booked
GROUP BY match_no
)

SELECT match_no, num_booked
FROM temp
WHERE num_booked = (SELECT MAX(num_booked)
					FROM temp ) 
