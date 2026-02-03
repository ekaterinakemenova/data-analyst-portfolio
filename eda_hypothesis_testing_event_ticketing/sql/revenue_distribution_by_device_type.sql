/* =====================================================================
   Project: Yandex Afisha: Seasonal Demand & User Behavior Analysis

   Author: Ekaterina Kemenova
   Date: 29.01.2026

   Task:
   Analyze revenue distribution across device types.

   Output:
   - device_type_canonical     — device type (mobile / desktop)
   - total_revenue             — total revenue from orders (RUB)
   - total_orders              — number of orders
   - avg_revenue_per_order     — average revenue per order (RUB)
   - revenue_share             — share of total revenue (rounded to 3 decimals)
   ===================================================================== */

SELECT
    device_type_canonical,
    SUM(revenue) AS total_revenue,
    COUNT(order_id) AS total_orders,
    AVG(revenue) AS avg_revenue_per_order,
    ROUND(SUM(revenue)::NUMERIC / SUM(SUM(revenue)) OVER ()::NUMERIC, 3) AS revenue_share
FROM afisha.purchases
WHERE currency_code = 'rub'
GROUP BY device_type_canonical
ORDER BY revenue_share DESC;