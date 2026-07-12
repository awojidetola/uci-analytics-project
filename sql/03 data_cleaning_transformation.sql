-- cleaning stage --

WITH remove_missing_desc AS (
    SELECT * 
    FROM `uci-online-retail-501604.OnlineRetail2Years.Data-2009-2011`
    WHERE Description IS NOT NULL
),

remove_bad_debt AS (
  SELECT * FROM remove_missing_desc
  WHERE price >=0
),

remove_inventory_adjustments AS (
  SELECT * FROM remove_bad_debt 
  WHERE NOT (invoice NOT LIKE 'C%' AND quantity <0)
),

remove_duplicates AS (
    SELECT * 
    FROM remove_inventory_adjustments
    QUALIFY ROW_NUMBER() OVER(
        PARTITION BY Invoice, StockCode, Quantity, InvoiceDate, Description, Country
        ORDER BY InvoiceDate
    ) = 1
),

-- feature - engineering --

convert_customer_id AS (
SELECT *, 
CAST(CAST(`Customer ID` AS INT64) AS STRING)
FROM remove_duplicates 
),

create_is_cancelled AS (
  SELECT *,
  CASE WHEN Invoice LIKE 'C%'
  THEN 'Yes'
  ELSE 'No'
  END AS is_cancelled 
  FROM convert_customer_id
),

create_revenue AS (
  SELECT *, (Price* Quantity) AS Revenue
  FROM create_is_cancelled
),

create_date_features AS (
  SELECT *, 
  EXTRACT (YEAR FROM InvoiceDate) AS order_year,
  EXTRACT (QUARTER FROM InvoiceDate) AS order_quarter,
  EXTRACT (MONTH FROM InvoiceDate) AS order_month,
  FORMAT_DATE ('%B', DATE(InvoiceDate)) AS order_month_name,
  EXTRACT (WEEK FROM InvoiceDate) AS order_week,
  EXTRACT(DAY FROM InvoiceDate) AS order_day,
  FORMAT_DATE ('%A', DATE (InvoiceDate)) AS order_day_name,
  EXTRACT (HOUR FROM InvoiceDate) AS order_hour,
  FROM create_revenue 
),

final_data AS (

SELECT
    c.*,
    p.Top_Level_Category,
    p.Subcategory
FROM create_date_features AS c 
LEFT JOIN `uci-online-retail-501604.OnlineRetail2Years.product-data` AS p
ON REGEXP_REPLACE(TRIM(UPPER(c.Description)), r'\s+', ' ')
 =
REGEXP_REPLACE(TRIM(UPPER(p.Description)), r'\s+', ' ')
)

SELECT * FROM final_data;