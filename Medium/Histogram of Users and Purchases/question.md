# Walmart User Transactions SQL Problem

## Problem Statement

Assume you're given a table on Walmart user transactions. Based on their most recent transaction date, write a query that retrieves the users along with the number of products they bought.

Output the user's most recent transaction date, user ID, and the number of products, sorted in chronological order by the transaction date.

## Table Schema

### `user_transactions` Table
| Column Name | Type |
|-------------|------|
| product_id | integer |
| user_id | integer |
| spend | decimal |
| transaction_date | timestamp |

### `user_transactions` Example Input
| product_id | user_id | spend | transaction_date |
|------------|---------|-------|------------------|
| 3673 | 123 | 68.90 | 07/08/2022 12:00:00 |
| 9623 | 123 | 274.10 | 07/08/2022 12:00:00 |
| 1467 | 115 | 19.90 | 07/08/2022 12:00:00 |
| 2513 | 159 | 25.00 | 07/08/2022 12:00:00 |
| 1452 | 159 | 74.50 | 07/10/2022 12:00:00 |

## Example Output
| transaction_date | user_id | purchase_count |
|------------------|---------|----------------|
| 07/08/2022 12:00:00 | 115 | 1 |
| 07/08/2022 12:00:00 | 123 | 2 |
| 07/10/2022 12:00:00 | 159 | 1 |

## Notes
- This problem is similar to Problem #13 in the SQL Chapter of "Ace the Data Science Interview" book.
- The output needs to be sorted in chronological order by transaction date.
- For each user, only their most recent transaction date should be considered.
- The purchase_count represents the number of products bought by the user on their most recent transaction date.
