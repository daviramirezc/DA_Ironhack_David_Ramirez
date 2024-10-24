CREATE DATABASE ironhack_charger;
USE ironhack_charger;

-- LEVEL 1

-- Question 1: Number of users with sessions
SELECT COUNT(DISTINCT user_id) AS num_users_with_sessions
FROM sessions;


-- Question 2: Number of chargers used by user with id 1
SELECT COUNT(DISTINCT charger_id) AS num_chargers_used
FROM sessions
WHERE user_id = 1;


-- LEVEL 2
-- Question 3: Number of sessions per charger type (AC/DC):
SELECT c.type, COUNT(s.user_id) AS num_sessions
FROM sessions s
JOIN chargers c ON s.charger_id = c.id
GROUP BY c.type;



-- Question 4: Chargers being used by more than one user
SELECT s.charger_id
FROM sessions s
GROUP BY s.charger_id
HAVING COUNT(DISTINCT s.user_id) > 1;


-- Question 5: Average session time per charger
SELECT * FROM sessions;
SELECT charger_id, AVG(TIMESTAMPDIFF(MINUTE, start_time, end_time)) AS avg_session_time_minutes
FROM sessions
GROUP BY charger_id;


-- LEVEL 3

-- Question 6: Full username of users that have used more than one charger in one day (NOTE: for date only consider start_time)
SELECT u.name
FROM sessions s
JOIN users u ON s.user_id = u.id
GROUP BY u.name, DATE(s.start_time)
HAVING COUNT(DISTINCT s.charger_id) > 1;

-- Question 7: Top 3 chargers with longer sessions
SELECT charger_id, AVG(TIMESTAMPDIFF(MINUTE, start_time, end_time)) AS avg_session_time_minutes
FROM sessions
GROUP BY charger_id
ORDER BY avg_session_time_minutes DESC
LIMIT 3;


-- Question 8: Average number of users per charger (per charger in general, not per charger_id specifically)
SELECT AVG(user_count) AS avg_users_per_charger
FROM (
    SELECT charger_id, COUNT(DISTINCT user_id) AS user_count
    FROM sessions
    GROUP BY charger_id
) AS charger_user_count;


-- Question 9: Top 3 users with more chargers being used
SELECT s.user_id, u.surname, COUNT(DISTINCT s.charger_id) AS chargers_used
FROM sessions s
JOIN users u ON s.user_id = u.id
GROUP BY s.user_id, u.surname
ORDER BY chargers_used DESC
LIMIT 3;


-- LEVEL 4

-- Question 10: Number of users that have used only AC chargers, DC chargers or both
SELECT
    SUM(CASE WHEN types_count = 1 AND charger_type = 'AC' THEN 1 ELSE 0 END) AS only_ac_users,
    SUM(CASE WHEN types_count = 1 AND charger_type = 'DC' THEN 1 ELSE 0 END) AS only_dc_users,
    SUM(CASE WHEN types_count > 1 THEN 1 ELSE 0 END) AS both_types_users
FROM (
    SELECT s.user_id, COUNT(DISTINCT c.type) AS types_count, MAX(c.type) AS charger_type
    FROM sessions s
    JOIN chargers c ON s.charger_id = c.id
    GROUP BY s.user_id
) AS user_types;



-- Question 11: Monthly average number of users per charger



-- LEVEL 5

-- Question 13: Top 3 users with longest sessions per month (consider the month of start_time)

SELECT user_id, YEAR(start_time) AS year, MONTH(start_time) AS month, AVG(TIMESTAMPDIFF(MINUTE, start_time, end_time)) AS avg_session_time_minutes
FROM sessions
GROUP BY user_id, YEAR(start_time), MONTH(start_time)
ORDER BY avg_session_time_minutes DESC
LIMIT 3;

    
-- Question 14. Average time between sessions for each charger for each month (consider the month of start_time)
WITH session_gaps AS (
    SELECT
        charger_id,
        YEAR(start_time) AS year,
        MONTH(start_time) AS month,
        TIMESTAMPDIFF(MINUTE, LAG(end_time) OVER (PARTITION BY charger_id ORDER BY start_time), start_time) AS gap_minutes
    FROM sessions
)
SELECT charger_id, year, month, AVG(gap_minutes) AS avg_gap_minutes
FROM session_gaps
WHERE gap_minutes IS NOT NULL
GROUP BY charger_id, year, month;
