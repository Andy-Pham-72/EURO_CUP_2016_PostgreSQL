-- Question 5: Write a SQL query to find the number of booking that happened in a stoppage time.
SELECT COUNT(*) AS num_booking_stoppage
FROM euro_cup_2016.player_booked
WHERE play_schedule = 'ST';
