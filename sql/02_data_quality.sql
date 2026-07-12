/*Find the nulls in the data (method 1 - this works in BigQuery but not in a lot others)*/
SELECT
    COUNTIF(Invoice IS NULL) AS invoice_nulls,
    COUNTIF(StockCode IS NULL) AS stockcode_nulls,
    COUNTIF(Description IS NULL) AS description_nulls,
    COUNTIF(Quantity IS NULL) AS quantity_nulls,
    COUNTIF(InvoiceDate IS NULL) AS invoicedate_nulls,
    COUNTIF(Price IS NULL) AS unitprice_nulls,
    COUNTIF(`Customer ID` IS NULL) AS customerid_nulls,
    COUNTIF(Country IS NULL) AS country_nulls
FROM `uci-online-retail-501604.OnlineRetail2Years.Data-2009-2011`;


/*Find the nulls in the data (method 2 - will work everywhere)*/
SELECT
COUNT (*) - COUNT (Invoice) AS invoice_nulls, 
COUNT (*) - COUNT (StockCode) AS stockcode_nulls, 
COUNT (*) - COUNT (Description) AS description_nulls,
COUNT (*) - COUNT (Quantity) AS quantity_nulls,
COUNT (*) - COUNT (InvoiceDate) AS invoicedate_nulls,
COUNT (*) - COUNT (Price) AS unitprice_nulls,
COUNT (*) - COUNT (`Customer ID`) AS customerid_nulls,
COUNT (*) - COUNT (Country) AS country_nulls

FROM `uci-online-retail-501604.OnlineRetail2Years.Data-2009-2011`;

/*How many products have 0 or negative prices?*/
SELECT COUNT (price)
FROM `uci-online-retail-501604.OnlineRetail2Years.Data-2009-2011`
WHERE price <= 0;

/*Are there duplicate transaction records?*/


SELECT 
    Invoice, StockCode, Quantity, InvoiceDate, Price,Country, `Customer ID`, COUNT(*)
FROM `uci-online-retail-501604.OnlineRetail2Years.Data-2009-2011`
GROUP BY Invoice, StockCode, Quantity, InvoiceDate, Price, Country, `Customer ID`
HAVING COUNT(*) > 1;


/*How many cancelled invoices exist? An order/invoice is considered to be cancelled if it startswith a C. */

SELECT Invoice AS cancelled_orders
FROM `uci-online-retail-501604.OnlineRetail2Years.Data-2009-2011` 
WHERE Invoice LIKE 'C%';

/*How many transactions have zero or negative quantities?*/
SELECT COUNT (Quantity)
FROM `uci-online-retail-501604.OnlineRetail2Years.Data-2009-2011`
WHERE Quantity <= 0

/**/


