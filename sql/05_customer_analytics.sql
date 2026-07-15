
--Who are the top 20 customers by revenue? (minor issue, current customer id is in float, f0_ is the string equivalent)

SELECT `f0_` AS customer_id, revenue FROM `uci-online-retail-501604.OnlineRetail2Years.clean-combined-data`
WHERE is_cancelled = 'No' AND `f0_` IS NOT NULL
ORDER BY revenue DESC
LIMIT 20;

-- Who placed the most orders 

SELECT COUNT(DISTINCT Invoice) AS no_orders, `f0_` AS customer_id FROM `uci-online-retail-501604.OnlineRetail2Years.clean-combined-data`
WHERE is_cancelled = 'No' AND `customer id` IS NOT NULL
GROUP BY `f0_`
ORDER BY COUNT(DISTINCT Invoice) DESC
LIMIT 10;

--Who placed the greatest quantity of products

SELECT SUM(quantity) AS qty, `f0_` AS customer_id FROM `uci-online-retail-501604.OnlineRetail2Years.clean-combined-data`
WHERE is_cancelled = 'No' AND `customer id` IS NOT NULL
GROUP BY `f0_`
ORDER BY SUM(Quantity) DESC
LIMIT 10;


--Sales Metrics by Customer
SELECT `f0_` AS customer_id, SUM(revenue) AS total_revenue, SUM(quantity) AS total_quantity, COUNT (DISTINCT Invoice) AS complete_orders, SUM(revenue)/COUNT (DISTINCT Invoice) AS average_order_value,  SUM(quantity) / COUNT(DISTINCT Invoice) AS average_basket_size
FROM `uci-online-retail-501604.OnlineRetail2Years.clean-combined-data`
WHERE is_cancelled = 'No'
AND `f0_` IS NOT NULL
GROUP BY `f0_`
ORDER BY average_order_value DESC
LIMIT 10;



-- Who are the top 20% and what do they like, when do they order?

WITH revenue_group_table AS (
SELECT `f0_` AS customer_id, SUM (revenue) AS total_revenue,
NTILE(5) OVER (ORDER BY SUM (revenue) DESC) AS revenue_group
FROM `uci-online-retail-501604.OnlineRetail2Years.clean-combined-data`
WHERE is_cancelled = 'No'
AND `f0_` IS NOT NULL
GROUP BY customer_id),

top_20 AS (SELECT r.customer_id, t.revenue, r.revenue_group, t.invoice, t.top_level_category, t.order_hour, t.order_year, t.order_month_name, 
FROM revenue_group_table AS r
RIGHT JOIN `uci-online-retail-501604.OnlineRetail2Years.clean-combined-data` AS t
ON r.customer_id = t.`f0_`
WHERE r.revenue_group > 1
ORDER BY r.customer_id)

SELECT * FROM top_20;


--- Pareto Analysis. (Top 20% vs Bottom 80%)
WITH customer_profile AS (

SELECT
    `f0_` AS customer_id,
    SUM(revenue) AS total_revenue,
    COUNT(DISTINCT Invoice) AS total_orders,

    CASE
        WHEN COUNT(DISTINCT Invoice) > 1
        THEN TRUE
        ELSE FALSE
    END AS repeat_customer,

    NTILE(5) OVER (
        ORDER BY SUM(revenue) DESC
    ) AS revenue_group

FROM `uci-online-retail-501604.OnlineRetail2Years.clean-combined-data`

WHERE is_cancelled='No'
AND `f0_` IS NOT NULL

GROUP BY customer_id

)

SELECT

CASE

WHEN revenue_group=1
THEN 'Top 20%'

ELSE 'Bottom 80%'

END AS customer_segment,

COUNT(*) AS customers,

SUM(total_revenue) AS revenue,

AVG(total_revenue) AS avg_customer_revenue,

ROUND(
    100 * SUM(total_revenue)
    / SUM(SUM(total_revenue)) OVER (),
    2
) AS percentage_of_total_revenue,

AVG(total_orders) AS avg_orders,

COUNTIF(repeat_customer) AS repeat_customers,

ROUND(
100*COUNTIF(repeat_customer)/COUNT(*),
2
) AS repeat_rate

FROM customer_profile

GROUP BY customer_segment;




-- Deeper Pareto Analysis
WITH customer_profile AS (

SELECT
    `f0_` AS customer_id,
    SUM(revenue) AS total_revenue,
    COUNT(DISTINCT Invoice) AS total_orders,

    CASE
        WHEN COUNT(DISTINCT Invoice) > 1
        THEN TRUE
        ELSE FALSE
    END AS repeat_customer,

    NTILE(5) OVER (
        ORDER BY SUM(revenue) DESC
    ) AS revenue_group

FROM `uci-online-retail-501604.OnlineRetail2Years.clean-combined-data`

WHERE is_cancelled='No'
AND `f0_` IS NOT NULL

GROUP BY customer_id

),

top_20_table AS(
  SELECT c.customer_id, c.revenue_group, t.revenue, t.invoice, t.top_level_category, t.order_day_name, t.order_hour, t.order_year, t.order_month_name, t.Country
  FROM customer_profile AS c
  JOIN `uci-online-retail-501604.OnlineRetail2Years.clean-combined-data` AS t
  ON c.customer_id = t.`f0_`
  WHERE c.revenue_group =1)


-- Where do they order from?
/* SELECT country, SUM(revenue) AS revenue_total from top_20_table
GROUP BY country
ORDER BY SUM(revenue) DESC
LIMIT 10; 

SELECT top_level_category, SUM(revenue) AS revenue_total FROM top_20_table
GROUP BY top_level_category
ORDER BY SUM(revenue) DESC
LIMIT 10;

SELECT order_month_name, SUM(revenue) AS revenue_total FROM top_20_table
GROUP BY order_month_name
ORDER BY SUM(revenue) DESC; 

SELECT order_day_name, SUM(revenue) AS revenue_total FROM top_20_table
GROUP BY order_day_name
ORDER BY SUM(revenue) DESC;*/ 

SELECT order_hour, SUM(revenue) AS revenue_total FROM top_20_table
GROUP BY order_hour
ORDER BY SUM(revenue) DESC; 