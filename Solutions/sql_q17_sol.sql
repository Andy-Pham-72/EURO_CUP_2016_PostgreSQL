-- Question 17: Write a SQL query to find the country where the most assistant referees come from, and the count of the assistant referees.
-- TOP 5 countries that have the most assistant referees come from. England is number 1.
SELECT s.country_name, COUNT(DISTINCT a.ass_ref_id) AS total_asst_num
FROM euro_cup_2016.asst_referee_mast AS a
LEFT JOIN euro_cup_2016.soccer_country AS s
	ON a.country_id = s.country_id
GROUP BY s.country_name
ORDER BY COUNT(ass_ref_id) DESC
LIMIT 5;
