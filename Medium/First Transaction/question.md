# Etsy User Transactions: First Transaction Filter

This document covers the SQL query challenge which retrieves the number of users whose **first transaction** was valued at **$50 or more**. The solution takes into account scenarios where a user might have multiple transactions on the same day by using a window function to correctly identify the very first transaction.

---

## Problem Description

You are given a table containing Etsy user transactions. Your task is to write a query that:

- Determines the **first transaction** for each user, based on the `transaction_date` field.
- Correctly identifies the first transaction even when a user has multiple transactions on the same day (using a specific window function).
- Retrieves only the users whose first transaction was valued at **$50 or more**.
- Outputs a single number representing the **total number of users** who meet this criterion.

---

## Table Structure

**Table:** `user_transactions`

| Column Name       | Type      | Description                              |
|-------------------|-----------|------------------------------------------|
| `transaction_id`  | integer   | Unique identifier for the transaction.   |
| `user_id`         | integer   | Unique identifier for the user.          |
| `spend`           | decimal   | The monetary value of the transaction.   |
| `transaction_date`| timestamp | The date and time when the transaction occurred. |

---

## Example Input

| transaction_id | user_id | spend  | transaction_date         |
|----------------|---------|--------|--------------------------|
| 759274         | 111     | 49.50  | 02/03/2022 00:00:00      |
| 850371         | 111     | 51.00  | 03/15/2022 00:00:00      |
| 615348         | 145     | 36.30  | 03/22/2022 00:00:00      |
| 137424         | 156     | 151.00 | 04/04/2022 00:00:00      |
| 248475         | 156     | 87.00  | 04/16/2022 00:00:00      |

**Note:** Although user 111 has transactions on both 02/03/2022 and 03/15/2022, only the first transaction (02/03/2022) counts—which in this case is valued below $50.

---

## Example Output

| users |
|-------|
| 1     |

**Explanation:**  
Among all users, only user ID 156 had their first transaction valued at over $50.

---

## SQL Solution

The following Oracle SQL query uses a common table expression (CTE) and the `ROW_NUMBER()` window function to identify the first transaction per user. It then counts only those users whose first transaction was valued at $50 or more.

```sql
WITH first_transaction AS (
    SELECT 
        user_id,
        spend,
        transaction_date,
        ROW_NUMBER() OVER (
            PARTITION BY user_id 
            ORDER BY transaction_date, transaction_id
        ) AS rn
    FROM user_transactions
)
SELECT COUNT(*) AS users
FROM first_transaction
WHERE rn = 1 
  AND spend >= 50;
