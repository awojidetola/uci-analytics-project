--How many orders were completed?
SELECT COUNT (DISTINCT Invoice) 
FROM `uci-online-retail-501604.OnlineRetail2Years.clean-combined-data` 
WHERE is_cancelled = 'No';


--Total Revenue, Total Qty, Average Order Value

SELECT SUM(revenue) AS total_revenue, SUM(quantity) AS total_quantity, COUNT (DISTINCT Invoice) AS complete_orders, SUM(revenue)/COUNT (DISTINCT Invoice) AS average_order_value
FROM `uci-online-retail-501604.OnlineRetail2Years.clean-combined-data`
WHERE is_cancelled = 'No';

-- When did the highest revenue transaction occur?
SELECT revenue, order_year, order_month_name, order_day_name 
FROM `uci-online-retail-501604.OnlineRetail2Years.clean-combined-data`
WHERE is_cancelled = 'No'
ORDER BY revenue DESC
LIMIT 1;

--Which month generated the most revenue
SELECT order_month_name, SUM(revenue) AS total_revenue
FROM `uci-online-retail-501604.OnlineRetail2Years.clean-combined-data`
WHERE is_cancelled = 'No'
GROUP BY order_month_name
ORDER BY SUM(revenue) DESC;

--Which weekday generated the most revenue
SELECT order_day_name, SUM(revenue) AS total_revenue
FROM `uci-online-retail-501604.OnlineRetail2Years.clean-combined-data`
WHERE is_cancelled = 'No'
GROUP BY order_day_name
ORDER BY SUM(revenue) DESC;

--Which hour generated the most revenue
SELECT order_hour, SUM(revenue) AS total_revenue
FROM `uci-online-retail-501604.OnlineRetail2Years.clean-combined-data`
WHERE is_cancelled = 'No'
GROUP BY order_hour
ORDER BY SUM(revenue) DESC;

