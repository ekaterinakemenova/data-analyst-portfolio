/*
Project: Business metrics dashboard for a food delivery service (Saransk, May–June 2021)
Metric: DAU (Daily Active Users) - number of unique registered users who placed at least one order per day
*/

SELECT
    e.log_date,
    COUNT(DISTINCT e.user_id) AS dau
FROM analytics_events AS e
JOIN cities AS c
    ON e.city_id = c.city_id
WHERE c.city_name = 'Саранск'
  AND e.event = 'order'
  AND e.user_id IS NOT NULL
  AND e.log_date BETWEEN DATE '2021-05-01' AND DATE '2021-06-30'
GROUP BY e.log_date
ORDER BY e.log_date;