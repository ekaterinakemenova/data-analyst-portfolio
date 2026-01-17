/*
Project: Business metrics dashboard for a food delivery service (Saransk, May–June 2021)
Metric: Average bill (AOV) — average commission per transaction (order) by month
*/

WITH orders AS
    (SELECT *,
            revenue * commission AS commission_revenue
     FROM analytics_events
     JOIN cities ON analytics_events.city_id = cities.city_id
     WHERE revenue IS NOT NULL
         AND log_date BETWEEN '2021-05-01' AND '2021-06-30'
         AND city_name = 'Саранск')
SELECT 
    date_trunc('month', log_date)::date AS month,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(commission_revenue::numeric), 2) AS commission_sum,
    ROUND(SUM(commission_revenue)::numeric / COUNT(DISTINCT order_id), 2) AS aov
FROM orders 
GROUP BY date_trunc('month', log_date)::date
ORDER BY month;