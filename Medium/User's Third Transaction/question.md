# Third Transaction of Every User

## Problem Statement

You are given a table of **Uber transactions** made by users. Write a **SQL query** to obtain the **third transaction** of each user.

### Expected Output:
- **user_id** (User Identifier)
- **spend** (Amount spent in the transaction)
- **transaction_date** (Date and time of the transaction)

---

## Table: `transactions`

| Column Name        | Type      | Description                          |
|-------------------|----------|--------------------------------------|
| `user_id`         | integer  | Unique identifier for the user      |
| `spend`          | decimal  | Amount spent in the transaction    |
| `transaction_date` | timestamp | Date and time of the transaction |

---

## Example Input

| user_id | spend  | transaction_date        |
|---------|--------|------------------------|
| 111     | 100.50 | 01/08/2022 12:00:00    |
| 111     | 55.00  | 01/10/2022 12:00:00    |
| 121     | 36.00  | 01/18/2022 12:00:00    |
| 145     | 24.99  | 01/26/2022 12:00:00    |
| 111     | 89.60  | 02/05/2022 12:00:00    |

---

## Expected Output

| user_id | spend  | transaction_date        |
|---------|--------|------------------------|
| 111     | 89.60  | 02/05/2022 12:00:00    |

---


