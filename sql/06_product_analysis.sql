
--Products that generate the most revenue
SELECT top_level_category, subcategory, SUM(revenue) AS total_revenue
FROM `uci-online-retail-501604.OnlineRetail2Years.clean-combined-data` 
WHERE is_cancelled = 'No'
GROUP BY top_level_category, subcategory
ORDER BY SUM(revenue)
LIMIT 10;


-- What products sell the highest quantity
SELECT top_level_category, subcategory, SUM(quantity) AS total_quantity
FROM `uci-online-retail-501604.OnlineRetail2Years.clean-combined-data` 
WHERE is_cancelled = 'No'
GROUP BY top_level_category, subcategory
ORDER BY SUM(quantity) DESC
LIMIT 10;


-- Which products are cancelled most frequently?

SELECT Top_Level_Category,Subcategory, COUNT (*) AS cancelled_orders
FROM `uci-online-retail-501604.OnlineRetail2Years.clean-combined-data` 
WHERE is_cancelled = 'Yes'
GROUP BY Top_Level_Category, Subcategory
ORDER BY COUNT (*) DESC
LIMIT 10;

-- Product Cancellation Rate
SELECT
    top_level_category,
    subcategory,

    COUNT(*) AS total_sales,

    COUNTIF(is_cancelled = 'Yes') AS cancelled_sales,

    ROUND(
        100 * COUNTIF(is_cancelled = 'Yes') / COUNT(*),
        2
    ) AS cancellation_rate

FROM `uci-online-retail-501604.OnlineRetail2Years.clean-combined-data`
WHERE top_level_category IS NOT NULL

GROUP BY
    top_level_category,
    subcategory

ORDER BY cancellation_rate DESC;

