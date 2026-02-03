/* =====================================================================
   Project: Yandex Afisha: Seasonal Demand & User Behavior Analysis

   Author: Ekaterina Kemenova
   Date: 29.01.2026

   Task:
   Analyze weekly dynamics of key business metrics.

   Output:
   - week                — week start date
   - total_revenue       — total revenue per week
   - total_orders        — number of orders per week
   - total_users         — number of unique users per week
   - revenue_per_order   — average revenue per order
   ===================================================================== */

SELECT
    DATE_TRUNC('week', created_dt_msk)::DATE AS week,
    SUM(revenue) AS total_revenue,
    COUNT(order_id) AS total_orders,
    COUNT(DISTINCT user_id) AS total_users,
    SUM(revenue) / COUNT(order_id) AS revenue_per_order
FROM afisha.purchases
WHERE currency_code = 'rub'
GROUP BY 1
ORDER BY 1;