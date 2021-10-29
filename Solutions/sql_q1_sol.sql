-- Question 1: Write a SQL query to find the date EURO Cup 2016 started on.
SELECT play_date AS first_day_of_eurocup
FROM euro_cup_2016.match_mast
ORDER BY first_day_of_eurocup ASC
LIMIT 1;
