# Highest Purchase by Customer SQL Query

```sql
SELECT customer_id, MAX(purchase_amount) as purchase_amount
FROM transactions
GROUP BY customer_id
ORDER BY purchase_amount DESC;
```

## Explanation

This query:

1. Groups all transactions by `customer_id` using the `GROUP BY` clause
2. For each customer, finds their maximum purchase amount using the `MAX()` aggregate function
3. Orders the results by purchase amount in descending order (highest to lowest) using `ORDER BY purchase_amount DESC`

When applied to the example data, this produces:

| customer_id | purchase_amount |
|------------|-----------------|
| 2          | 551.20          |
| 1          | 150.00          |
| 3          | 13.30           |

## How It Works

- For customer_id = 1: Finds the maximum between 150.00 and 35.90, which is 150.00
- For customer_id = 2: Finds the maximum among 349.99, 199.95, and 551.20, which is 551.20
- For customer_id = 3: Only has one purchase at 13.30, so that's the maximum

