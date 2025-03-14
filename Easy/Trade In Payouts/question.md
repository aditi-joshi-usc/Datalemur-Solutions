# Apple Trade-In Revenue Analysis Problem

**Overview:**  
Apple offers a trade-in program where customers can return their old iPhone devices and receive a cash payout based on the device model. The trade-in payout value is determined by the model, and the payout details are stored in the `trade_in_payouts` table. The trade-in transactions themselves are recorded in the `trade_in_transactions` table.

**Objective:**  
For each store, write an SQL query that calculates the total revenue from the trade-ins. This involves joining the two tables on `model_id`, summing the `payout_amount` for each store, and ordering the results in descending order by the total payout.

---

## Tables and Schema Details

### 1. `trade_in_transactions`
This table records each trade-in transaction.

| Column Name       | Data Type | Description                           |
|-------------------|-----------|---------------------------------------|
| transaction_id    | integer   | The unique identifier for the transaction. |
| model_id          | integer   | The model identifier for the traded-in device. |
| store_id          | integer   | The store where the trade-in occurred. |
| transaction_date  | date      | The date when the trade-in took place. |

**Example Input:**

| transaction_id | model_id | store_id | transaction_date |
|----------------|----------|----------|------------------|
| 1              | 112      | 512      | 01/01/2022       |
| 2              | 113      | 512      | 01/01/2022       |

### 2. `trade_in_payouts`
This table provides the payout values for each iPhone model.

| Column Name   | Data Type | Description                                      |
|---------------|-----------|--------------------------------------------------|
| model_id      | integer   | The unique model identifier.                     |
| model_name    | string    | The name of the iPhone model (e.g., iPhone 12, iPhone 13). |
| payout_amount | integer   | The cash payout value for trading in the device. |

**Example Input:**

| model_id | model_name         | payout_amount |
|----------|--------------------|---------------|
| 111      | iPhone 11          | 200           |
| 112      | iPhone 12          | 350           |
| 113      | iPhone 13          | 450           |
| 114      | iPhone 13 Pro Max  | 650           |

---

## Example Output

| store_id | payout_total |
|----------|--------------|
| 512      | 800          |

**Explanation:**  
Store 512 had two trade-in transactions:  
- Trade-in for model_id 112 (iPhone 12) with a payout of 350.  
- Trade-in for model_id 113 (iPhone 13) with a payout of 450.

The total payout for store 512 is the sum of these amounts: 350 + 450 = 800.

---

## Task Summary

Write an SQL query that performs the following steps:
1. **Join** the `trade_in_transactions` table with the `trade_in_payouts` table on the `model_id` column.
2. **Group** the joined data by `store_id` and calculate the total payout (i.e., the sum of `payout_amount`) for each store.
3. **Order** the results in descending order based on the total payout.
4. **Return** the results with two columns: `store_id` and `payout_total`.

Good luck writing your query!
