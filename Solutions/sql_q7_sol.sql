-- Question 7: Write a SQL query to find all the venues where matches with penalty shootouts were played.
WITH match_pen AS (
SELECT m1.venue_id
FROM euro_cup_2016.match_mast AS m1
LEFT JOIN euro_cup_2016.match_details AS m2
	ON m1.match_no = m2.match_no
WHERE m2.decided_by = 'P'
)
SELECT DISTINCT m3.venue_id, s.venue_name
FROM euro_cup_2016.soccer_venue AS s
JOIN match_pen AS m3
	ON m3.venue_id = s.venue_id
ORDER BY m3.venue_id, s.venue_name DESC
;

-- 2nd solution
/*
SELECT venue_name
FROM euro_cup_2016.soccer_venue
WHERE venue_id IN
    (SELECT venue_id
     FROM euro_cup_2016.match_mast
     WHERE match_no IN
         (SELECT DISTINCT match_no
          FROM euro_cup_2016.penalty_shootout));
*/
