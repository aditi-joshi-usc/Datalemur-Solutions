# eBay Top Customers SQL Problem

## Problem Statement

Assume that you are given the table below containing information on various orders made by eBay customers. Write a query to obtain the user IDs and number of products purchased by the top 3 customers; these customers must have spent at least $1,000 in total.

Output the user id and number of products in descending order. To break ties (i.e., if 2 customers both bought 10 products), the user who spent more should take precedence.

## Table Schema

### `user_transactions` Table
| Column Name | Type |
|-------------|------|
| transaction_id | integer |
| product_id | integer |
| user_id | integer |
| spend | decimal |

### `user_transactions` Example Input
| transaction_id | product_id | user_id | spend |
|----------------|------------|---------|-------|
| 131432 | 1324 | 128 | 699.78 |
| 131433 | 1313 | 128 | 501.00 |
| 153853 | 2134 | 102 | 1001.20 |
| 247826 | 8476 | 133 | 1051.00 |
| 247265 | 3255 | 133 | 1474.00 |
| 136495 | 3677 | 133 | 247.56 |

## Example Output
| user_id | product_num |
|---------|-------------|
| 133 | 3 |
| 128 | 2 |
| 102 | 1 |

## Notes
- This problem is similar to Problem #5 in the SQL Chapter of "Ace the Data Science Interview" book.
- The top 3 customers are determined by the number of products purchased.
- Only customers who spent at least $1,000 in total should be considered.
- In case of a tie in the number of products purchased, the customer who spent more takes precedence.
- The output should be sorted by the number of products in descending order.
