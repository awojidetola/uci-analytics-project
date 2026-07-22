# Retail Store Analysis Project 

## Overview

This repository analyses the UCI Online Retail dataset. It documents the data cleaning and preparation with SQL, data analysis and then visualisation process. The cleaned dataset is avaliable on Kaggle, while the repository contains the scripts and project documentation used to produce it. 

Link to original UCI dataset: [Here](https://archive.ics.uci.edu/dataset/502/online+retail+ii)

Link to clean dataset on Kaggle: [Here](https://www.kaggle.com/datasets/awojidemargaret/online-retail-ii-cleaned/data)

## Repository Structure

```text
.
├── README.md
├── DATA_CLEANING.md
├── PRODUCT_TAXONOMY_PROMPT.md
├── sql/
│   ├── 01_data_understanding.sql
│   ├── 02_data_quality_assessment.sql
│   ├── 03_data_cleaning_feature_engineering.sql
│   └── 04_sales_performance_analysis.sql 
│   └── 05_customer_analytics.sql
│   └── 06_product_analysis.sql 
│   └── 07_geography_and_timeseries_analysis.sql 
├── Retail Analysis Report.pdf
├── Dashboard/ (coming soon)

```

## Features Added

Compared with the original dataset, this version includes:

* Removal of duplicate transaction records
* Removal of inventory adjustment records
* Removal of accounting adjustment entries
* Removal of records with missing product descriptions
* Cancellation flag (`is_cancelled`)
* Revenue calculation
* Date-based features (year, quarter, month, week, day and hour)
* Product category and subcategory classification

## Executive Summary

Retail performance is largely driven by a small group of highly valuable customers. Pareto analysis shows that the top 20% of customers generated over 77% of total revenue while maintaining an exceptional high repeat purchase rate of 99.32% demonstrating strong customer loyalty. 
These high value customers mostly purchased home-related products, particularly with the Kitchen and Dining, Home and Outdoor and Textiles product categories. Purchase activity peaked during the Q4 and mostly occur during standard business hours. Targeted marketing, personalised promotions and loyalty incentives focused on this customer segment could have a substantial impact on future revenue growth. 
Product and market analysis show that the business heavily relies on the United Kingdom as its primary revenue source while maintaining a smaller but profitable presence across several European markets. The results also show a clear seasonal demand pattern with sales peaking consistently during October and November, providing evidence for stock planning and promotional scheduling. 

