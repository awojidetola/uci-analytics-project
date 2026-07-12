# Online Retail II (Analysis Ready)

## Overview

This repository analyses the UCI Online Retail dataset. It documents the data cleaning and preparation with SQL, data analysis and then visualisation process. The cleaned dataset is avaliable on Kaggle, while the repository contains the scripts and project documentation used to produce it. 

Link to original UCI dataset: [Here](https://archive.ics.uci.edu/dataset/502/online+retail+ii)

Link to clean dataset on Kaggle: [Here](https://www.kaggle.com/datasets/awojidemargaret/online-retail-ii-cleaned/data)

## Repository Structure

```text
.
├── README.md
├── DATA_CLEANING.md
├── sql/
│   ├── 01_data_understanding.sql
│   ├── 02_data_quality_assessment.sql
│   ├── 03_data_cleaning_feature_engineering.sql
│   └── 04_exploratory_analysis.sql (coming soon)
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
