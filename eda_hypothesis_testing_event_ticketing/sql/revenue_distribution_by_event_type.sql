/* =====================================================================
   Project: Yandex Afisha: Seasonal Demand & User Behavior Analysis

   Author: Ekaterina Kemenova
   Date: 29.01.2026

   Task:
   Analyze revenue and order distribution by event type.

   Output:
   - event_type_main        — main event category
   - total_revenue          — total revenue from orders
   - total_orders           — number of orders
   - avg_revenue_per_order  — average order revenue
   - total_event_name       — number of unique events
   - avg_tickets            — average number of tickets per order
   - avg_ticket_revenue     — average revenue per ticket
   - revenue_share          — share of total revenue (rounded to 3 decimals)
   ===================================================================== */

SELECT
    event_type_main,
    SUM(revenue) AS total_revenue,
    COUNT(order_id) AS total_orders,
    AVG(revenue) AS avg_revenue_per_order,
    COUNT(DISTINCT event_name_code) AS total_event_name,
    AVG(tickets_count) AS avg_tickets,
    SUM(revenue) / SUM(tickets_count) AS avg_ticket_revenue,
    ROUND(SUM(revenue)::NUMERIC / SUM(SUM(revenue)) OVER ()::NUMERIC, 3) AS revenue_share
FROM afisha.purchases AS p
LEFT JOIN afisha.events AS e ON p.event_id = e.event_id
WHERE currency_code = 'rub'
GROUP BY event_type_main
ORDER BY total_orders DESC;