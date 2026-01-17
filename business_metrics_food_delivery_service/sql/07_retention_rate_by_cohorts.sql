/*
Project: Business metrics dashboard for a food delivery service (Saransk, May–June 2021)
Metric: Retention Rate by cohort month — comparison of user retention within the first 7 days after registration for cohorts grouped by month of first visit
*/

-- Select new users based on their first visit date
WITH new_users AS (
    SELECT DISTINCT
           first_date,
           user_id
    FROM analytics_events
    JOIN cities ON analytics_events.city_id = cities.city_id
    WHERE first_date BETWEEN '2021-05-01' AND '2021-06-24'
      AND city_name = 'Саранск'
),

-- Select all active users by event date
active_users AS (
    SELECT DISTINCT
           log_date,
           user_id
    FROM analytics_events
    JOIN cities ON analytics_events.city_id = cities.city_id
    WHERE log_date BETWEEN '2021-05-01' AND '2021-06-30'
      AND city_name = 'Саранск'
),

daily_retention AS (
    SELECT
           new_users.user_id,
           first_date,
           log_date::date - first_date::date AS day_since_install
    FROM new_users
    JOIN active_users
         ON new_users.user_id = active_users.user_id
        AND log_date >= first_date
)

SELECT
       DATE_TRUNC('month', first_date)::date AS cohort_month,
       day_since_install,
       COUNT(DISTINCT user_id) AS retained_users,
       ROUND(
           COUNT(DISTINCT user_id)::numeric
           / MAX(COUNT(DISTINCT user_id)) OVER (
               PARTITION BY DATE_TRUNC('month', first_date)::date
           ),
           2
       ) AS retention_rate
FROM daily_retention
WHERE day_since_install <= 7
GROUP BY cohort_month, day_since_install
ORDER BY cohort_month, day_since_install;