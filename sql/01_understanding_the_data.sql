
/*How many records, unique invoices, customers, products and countries are there? */

SELECT COUNT (*) AS total_rows, COUNT (DISTINCT Invoice) AS count_invoice, COUNT (DISTINCT (StockCode)) AS count_stockcode, COUNT (DISTINCT (Country)) AS count_country, COUNT (DISTINCT (CAST (`Customer ID` AS STRING))) AS count_customers
FROM`uci-online-retail-501604.OnlineRetail2Years.Data-2009-2011`;

/*What is the transaction date range?*/
SELECT MIN(InvoiceDate) AS min_date, MAX(InvoiceDate) AS max_date
FROM `uci-online-retail-501604.OnlineRetail2Years.Data-2009-2011`;

/*Display the first 10 transactions */

SELECT * 
FROM`uci-online-retail-501604.OnlineRetail2Years.Data-2009-2011`
LIMIT 10;

/*List all the countries represented */

SELECT DISTINCT (Country)
FROM`uci-online-retail-501604.OnlineRetail2Years.Data-2009-2011`;
