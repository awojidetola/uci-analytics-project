-- Which countries have the highest revenue
SELECT country,  SUM(revenue) AS total_revenue,
FROM `uci-online-retail-501604.OnlineRetail2Years.clean-combined-data` 
WHERE is_cancelled = 'No'
GROUP BY Country
ORDER BY total_revenue DESC
LIMIT 10;


-- Which countries have the highest number of customers
SELECT country,  COUNT(distinct `f0_`) AS customer_count,
FROM `uci-online-retail-501604.OnlineRetail2Years.clean-combined-data` 
WHERE is_cancelled = 'No'
AND `f0_` IS NOT NULL
GROUP BY Country
ORDER BY customer_count DESC
LIMIT 10;

-- Is there evidence of seasonality?
SELECT order_year, order_month order_month_name, SUM(revenue) AS total_revenue
FROM `uci-online-retail-501604.OnlineRetail2Years.clean-combined-data` 
WHERE is_cancelled = 'No'
GROUP BY order_year, order_month_name
ORDER BY order_year, order_month DESC;

-- When do cancellations occur (weekday?)

SELECT
    order_day_name,

    COUNT(*) AS total_sales,

    COUNTIF(is_cancelled = 'Yes') AS cancelled_sales,

    ROUND(
        100 * COUNTIF(is_cancelled = 'Yes') / COUNT(*),
        2
    ) AS cancellation_rate

FROM `uci-online-retail-501604.OnlineRetail2Years.clean-combined-data`
WHERE top_level_category IS NOT NULL

GROUP BY
    order_day_name

ORDER BY cancellation_rate DESC;

--Month with highest qty sold vs Month with highest revenue

SELECT order_year, order_month_name, SUM(quantity) AS total_qty, SUM(revenue) AS total_revenue, AVG(quantity) AS avg_qty, AVG(revenue) AS avg_revenue
FROM `uci-online-retail-501604.OnlineRetail2Years.clean-combined-data`
WHERE is_cancelled = 'No'
GROUP BY order_year, order_month_name
ORDER BY SUM(revenue) DESC;
