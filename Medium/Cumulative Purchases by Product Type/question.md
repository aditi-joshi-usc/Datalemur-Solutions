# SQL Problem: Cumulative Purchases for Each Product Type

## Problem Description
Assume you're given a table containing Amazon purchasing activity. Write a query to calculate the cumulative purchases for each product type, ordered chronologically. The output should consist of the order date, product type, and the cumulative sum of quantities purchased.

## Table: total_trans
| Column Name  | Type    |
|--------------|---------|
| order_id     | integer |
| product_type | string  |
| quantity     | integer |
| order_date   | datetime|

## Example Input
| order_id | product_type | quantity | order_date           |
|----------|--------------|----------|----------------------|
| 213824   | printer      | 20       | 06/27/2022 12:00:00  |
| 132842   | printer      | 18       | 06/28/2022 12:00:00  |

## Example Output
| order_date           | product_type | cum_purchased |
|----------------------|--------------|---------------|
| 06/27/2022 12:00:00  | printer      | 20            |
| 06/28/2022 12:00:00  | printer      | 38            |

**Explanation:**  
- On June 27, 2022, a total of 20 printers were purchased.
- On June 28, 2022, an additional 18 printers were purchased, resulting in a cumulative total of 38 printers (20 + 18).

