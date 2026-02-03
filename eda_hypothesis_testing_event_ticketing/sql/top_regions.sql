/* =====================================================================
   Project: Yandex Afisha: Seasonal Demand & User Behavior Analysis

   Author: Ekaterina Kemenova
   Date: 29.01.2026

   Task:
   Identify top regions by total revenue.

   Output:
   - region_name      — region name
   - total_revenue    — total revenue from orders
   - total_orders     — number of orders
   - total_users      — number of unique users
   - total_tickets    — total number of tickets sold
   - one_ticket_cost  — average revenue per ticket
   ===================================================================== */

SELECT
    region_name,
    SUM(revenue) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT user_id) AS total_users,
    SUM(tickets_count) AS total_tickets,
    SUM(revenue) / SUM(tickets_count)::NUMERIC AS one_ticket_cost
FROM afisha.purchases
LEFT JOIN afisha.events USING (event_id)
LEFT JOIN afisha.city USING (city_id)
LEFT JOIN afisha.regions USING (region_id)
WHERE currency_code = 'rub'
GROUP BY region_name
ORDER BY total_revenue DESC
LIMIT 10;