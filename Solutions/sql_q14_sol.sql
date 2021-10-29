-- Question 14: Write a SQL query to find referees and the number of bookings they made for the entire tournament. Sort your answer by the number of bookings in descending order.
SELECT r.referee_id, r.referee_name, COUNT(*) AS total_bookings
FROM euro_cup_2016.referee_mast AS r
LEFT JOIN euro_cup_2016.match_mast AS m
	ON r.referee_id = m.referee_id
LEFT JOIN euro_cup_2016.player_booked as p
	ON m.match_no = p.match_no
GROUP BY r.referee_id, r.referee_name
ORDER BY total_bookings DESC;
