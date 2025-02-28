# Retrieve the Mode of Order Occurrences

## Problem Statement
Given a table `items_per_order` with the following columns:
- `item_count` (integer): Represents the number of items sold in each order.
- `order_occurrences` (integer): Represents the frequency of orders with the corresponding number of items sold.

Write a query to find the mode of the `order_occurrences`. If there are multiple `item_count` values with the same mode, the results should be sorted in ascending order.

## Example Input
| item_count | order_occurrences |
|------------|-------------------|
| 1          | 500               |
| 2          | 1000              |
| 3          | 800               |

## Example Output
| mode |
|------|
| 2    |

## Explanation
The `order_occurrences` value of 1000 corresponds to the highest frequency among all `item_count` values. Therefore, the mode is `2`.

## SQL Query
```sql
WITH MaxOccurrences AS (
    SELECT MAX(order_occurrences) AS max_occurrences
    FROM items_per_order
)
SELECT item_count AS mode
FROM items_per_order
WHERE order_occurrences = (SELECT max_occurrences FROM MaxOccurrences)
ORDER BY item_count ASC;
