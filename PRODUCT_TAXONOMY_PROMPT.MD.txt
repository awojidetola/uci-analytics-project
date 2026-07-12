# Product Taxonomy Generation

The original UCI Online Retail II dataset contains product descriptions but does not include product categories. To support category-level analysis and dashboarding, a product taxonomy was generated using a Large Language Model (LLM).

The LLM was used to design a reusable retail product taxonomy before classifying products into categories. The resulting taxonomy was then joined to the cleaned transaction dataset using product descriptions.

# Prompt

You are a Retail Merchandising Specialist and Product Data Analyst with experience designing product catalogues for e-commerce businesses.

I am working with the UCI Online Retail II dataset, which contains transaction-level data from a UK online gift retailer. The dataset contains product descriptions but does not contain product categories.

Your task is to design a logical, consistent product taxonomy that can later be used for business analytics, SQL analysis and dashboarding.

Design a hierarchy consisting of:

* Top-Level Category
* Subcategory

The taxonomy should support analysis of:

* Sales performance
* Product performance
* Customer purchasing behaviour
* Seasonal trends
* Category revenue
* Geographic purchasing patterns

## Requirements

The taxonomy should:

* Contain approximately 12–15 top-level categories.
* Include meaningful subcategories under each top-level category.
* Be mutually exclusive where possible.
* Be intuitive for retail reporting.
* Group similar products together.
* Minimise the use of an "Other" category.
* Avoid unnecessary categories for only one or two products.
* Remain flexible enough to accommodate future products.

## Important Rules

* Do not classify individual products at this stage.
* Design only the taxonomy.
* Organise products as an online gift retailer would, rather than using manufacturer classifications.
* Consider both merchandising and business reporting needs.

## Input

A list of unique product descriptions from the UCI Online Retail II dataset.

## Expected Output

Return the taxonomy as a table with the following columns:

| Top-Level Category | Subcategory | Description of Products Included |
| ------------------ | ----------- | -------------------------------- |

After the table, explain:

* Why the categories were chosen.
* Any assumptions made during taxonomy design.
* Any products that may require manual review.

# Implementation

After the taxonomy was created:

1. Individual product descriptions were classified into the taxonomy.
2. The resulting lookup table was reviewed for consistency.
3. Product descriptions in both datasets were normalised before joining to improve match accuracy.
4. The taxonomy was joined to the cleaned retail transaction dataset using SQL.

The final dataset includes two additional fields:

* `Top_Level_Category`
* `Subcategory`
