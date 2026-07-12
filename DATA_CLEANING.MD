# Data Cleaning Methodology

## Objective

The objective of this stage was to transform the original UCI Online Retail II dataset into a reliable, analysis-ready dataset suitable for analysis. 

# Data Quality Assessment

The following issues were identified during the initial assessment.

## Missing Values

* Description: 4,382 missing values
* Customer ID: 243,007 missing values
* Records with missing product descriptions were removed.
* Missing customer IDs were retained because they remain useful for non-customer analyses.

## Duplicate Records

Exact duplicate transaction records were identified through a combination of invoice details, product information and transaction attributes. Duplicate records were removed. 

## Cancelled Transactions

Cancelled invoices were identified by invoice numbers beginning with the character **"C"**. Cancelled transactions were retained and a new field (`is_cancelled`) was created to distinguish completed purchases from returns.

## Inventory Adjustment Records

A review of negative quantity records revealed that many represented internal inventory activities rather than customer purchases. Examples included damaged stock, lost inventory and stock corrections. Internal inventory adjustment records were removed from the analytical dataset.

## Accounting Adjustment Records

Five records with negative prices were identified as accounting entries labelled **"Adjust bad debt"**. These records were excluded because they do not represent retail sales transactions.

# Feature Engineering

The following variables were created to support  analysis.

| Feature          | Description                                |
| ---------------- | ------------------------------------------ |
| Revenue          | Quantity × Price                           |
| is_cancelled     | Indicates whether an invoice was cancelled |
| order_year       | Transaction year                           |
| order_quarter    | Transaction quarter                        |
| order_month      | Transaction month                          |
| order_month_name | Month name                                 |
| order_week       | Week number                                |
| order_day        | Day of the month                           |
| order_day_name   | Day of the week                            |
| order_hour       | Hour of transaction                        |

# Product Categorisation

The original dataset did not contain product categories.

A product taxonomy consisting of **Top-Level Category** and **Subcategory** was generated using an LLM-assisted workflow based on product descriptions. Product descriptions were normalised before joining to improve matching accuracy.
